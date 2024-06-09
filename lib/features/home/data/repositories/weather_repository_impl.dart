import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:my_weather/core/error_handler/error_handler.dart';
import 'package:my_weather/core/failure/failure.dart';
import 'package:my_weather/core/networking/network_info.dart';
import 'package:my_weather/features/home/data/datasources/remote_datasource.dart';
import 'package:my_weather/features/home/data/mapper/home_mapper.dart';
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
}
