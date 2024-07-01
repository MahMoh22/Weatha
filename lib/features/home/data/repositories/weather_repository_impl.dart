import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:my_weather/core/error_handler/error_handler.dart';
import 'package:my_weather/core/failure/failure.dart';
import 'package:my_weather/core/networking/network_info.dart';
import 'package:my_weather/features/home/data/datasources/remote_datasource.dart';
import 'package:my_weather/features/home/data/mapper/home_mapper.dart';
import 'package:my_weather/features/home/data/mapper/search_mapper.dart';
import 'package:my_weather/features/home/domain/entities/search.dart';
import 'package:my_weather/features/home/domain/entities/weather.dart';
import 'package:my_weather/features/home/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final HomeRemoteDatasource homeRemoteDatasource;
  final NetworkInfo networkInfo;
  WeatherRepositoryImpl(
      {required this.homeRemoteDatasource, required this.networkInfo});

  @override
  Future<Either<Failure, Weather>> byLocation() async {
    if (await networkInfo.isConnected()) {
      try {
        //it`s connected to the internet it`s safe to call API
        final response = await homeRemoteDatasource.byLocation();
        if (response.location != null) {
          //success
          return Right(response.toEntity());
        } else {
          //Business error
          return Left(
              Failure(ApiInternalStatus.failure, 'Something Went Wrong'));
        }
      } catch (error) {
        if (kDebugMode) {
          print(error);
        }
        return Left(ErrorHandler.handler(error).failure);
      }
    } else {
      //connection failure
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, Weather>> byName() async {
    if (await networkInfo.isConnected()) {
      try {
        //it`s connected to the internet it`s safe to call API
        final response = await homeRemoteDatasource.byName();
        if (response.location != null) {
          //success
          return Right(response.toEntity());
        } else {
          //Business error
          return Left(
              Failure(ApiInternalStatus.failure, 'Something Went Wrong'));
        }
      } catch (error) {
        if (kDebugMode) {
          print(error);
        }
        return Left(ErrorHandler.handler(error).failure);
      }
    } else {
      //connection failure
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      /*ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Location services are disabled. Please enable the services')));*/
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        /*ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location permissions are denied')));*/
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      /*ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Location permissions are permanently denied, we cannot request permissions.')));*/
      return false;
    }
    return true;
  }

  @override
  Future<Either<Failure, Position>> getCurrentPosition() async {
    
    if (await networkInfo.isConnected()) {
      try {
        final hasPermission = await handleLocationPermission();
        if (!hasPermission) {
          return Left(Failure(1, 'Location Permission Needed, Please Enable Location Services.'));
        }
        final position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        return Right(position);
      } catch (error) {
        if (kDebugMode) {
          print(error);
        }
        return Left(ErrorHandler.handler(error).failure);
      }
    } else {
      //connection failure
      return Left(DataSource.noInternetConnection.getFailure());
    }
    

    /*if (await networkInfo.isConnected()) {
      try {
        bool serviceEnabled;
        LocationPermission permission;

        // Test if location services are enabled.
        serviceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!serviceEnabled) {
          // Location services are not enabled don't continue
          // accessing the position and request users of the
          // App to enable the location services.
          //return Future.error('Location services are disabled.');
          return Left(Failure(1, 'Location services are disabled.'));
        }

        permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            // Permissions are denied, next time you could try
            // requesting permissions again (this is also where
            // Android's shouldShowRequestPermissionRationale
            // returned true. According to Android guidelines
            // your App should show an explanatory UI now.
            //return Future.error('Location permissions are denied');
            return Left(Failure(1, 'Location permissions are denied'));
          }
        }

        if (permission == LocationPermission.deniedForever) {
          // Permissions are denied forever, handle appropriately.
          //return Future.error(
          //  'Location permissions are permanently denied, we cannot request permissions.');
          return Left(Failure(1,
              'Location permissions are permanently denied, we cannot request permissions.'));
        }

        // When we reach here, permissions are granted and we can
        // continue accessing the position of the device.
        final posision = await Geolocator.getCurrentPosition();
        return Right(posision);
      } catch (error) {
        if (kDebugMode) {
          print(error);
        }
        return Left(ErrorHandler.handler(error).failure);
      }
    } else {
      //connection failure
      return Left(DataSource.noInternetConnection.getFailure());
    } */
  }

  @override
  Future<Either<Failure, List<Search>>> searchCity() async {
    if (await networkInfo.isConnected()) {
      try {
        //it`s connected to the internet it`s safe to call API
        final response = await homeRemoteDatasource.searchCity();
        if (response.searchList != null) {
          //success
          return Right(response.toEntity());
        } else {
          //Business error
          return Left(
              Failure(ApiInternalStatus.failure, 'Something Went Wrong'));
        }
      } catch (error) {
        if (kDebugMode) {
          print(error);
        }
        return Left(ErrorHandler.handler(error).failure);
      }
    } else {
      //connection failure
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}
