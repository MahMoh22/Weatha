import 'package:dio/dio.dart';
import 'package:my_weather/core/failure/failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;
  ErrorHandler.handler(dynamic error) {
    if (error is DioException) {
      failure = _handleError(error);
    } else {
      failure = DataSource.defaultError.getFailure();
    }
  }
}

Failure _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectTimeOut.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.reciveTimeOut.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.connectTimeOut.getFailure();
    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();
    case DioExceptionType.unknown:
      return DataSource.defaultError.getFailure();
    case DioExceptionType.badCertificate:
      return DataSource.unauthorised.getFailure();
    case DioExceptionType.badResponse:
      return DataSource.badRequest.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.noInternetConnection.getFailure();

    default:
      return DataSource.defaultError.getFailure();
  }
}

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorised,
  notFound,
  internalServerError,
  connectTimeOut,
  cancel,
  reciveTimeOut,
  sendTimeOut,
  cacheError,
  noInternetConnection,
  defaultError,
}

extension DataSourceExtention on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.success:
        return Failure(ResponseCode.success, ResponseMessage.success);
      case DataSource.noContent:
        return Failure(ResponseCode.noContent, ResponseMessage.noContent);
      case DataSource.badRequest:
        return Failure(ResponseCode.badRequest, ResponseMessage.badRequest);
      case DataSource.forbidden:
        return Failure(ResponseCode.forbidden, ResponseMessage.forbidden);
      case DataSource.unauthorised:
        return Failure(ResponseCode.unauthorised, ResponseMessage.unauthorised);
      case DataSource.notFound:
        return Failure(ResponseCode.notFound, ResponseMessage.notFound);
      case DataSource.internalServerError:
        return Failure(ResponseCode.internalServerError,
            ResponseMessage.internalServerError);
      case DataSource.connectTimeOut:
        return Failure(
            ResponseCode.connectTimeOut, ResponseMessage.connectTimeOut);
      case DataSource.cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.cancel);
      case DataSource.reciveTimeOut:
        return Failure(
            ResponseCode.reciveTimeOut, ResponseMessage.reciveTimeOut);
      case DataSource.sendTimeOut:
        return Failure(ResponseCode.sendTimeOut, ResponseMessage.sendTimeOut);
      case DataSource.cacheError:
        return Failure(ResponseCode.cacheError, ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return Failure(ResponseCode.noInternetConnection,
            ResponseMessage.noInternetConnection);
      case DataSource.defaultError:
        return Failure(ResponseCode.defaultError, ResponseMessage.defaultError);
    }
  }
}

class ResponseCode {
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no data
  static const int badRequest = 400; // failure, API rejected request
  static const int forbidden = 401; // failure, user is not authorised
  static const int unauthorised = 403; // failure, API rejected request
  static const int notFound = 404; // not found
  static const int internalServerError = 500; // failure, crash in sever side
  // local status code
  static const int connectTimeOut = -1;
  static const int cancel = -2;
  static const int reciveTimeOut = -3;
  static const int sendTimeOut = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int defaultError = -7;
}

class ResponseMessage {
  /*success,
  noContent,
  badRequest,
  forbidden,
  unauthorised,
  notFound,
  internalServerError,
  connectTimeOut,
  cancel,
  reciveTimeOut,
  sendTimeOut,
  cacheError,
  noInternetConnection,
  defaultError,*/
  static String success = "Success"; // success with data
  static String noContent = "Success with not content"; // success with no data
  static String badRequest =
      "Bad request. try again later"; // failure, API rejected request
  static String forbidden =
      "Forbidden request. try again later"; // failure, user is not authorised
  static String unauthorised =
      "User unauthorized, try again later"; // failure, API rejected request
  static String notFound = "Url not found, try again later"; // not found
  static String internalServerError =
      "Some thing went wrong, try again later"; // failure, crash in sever side
  // local status code
  static String connectTimeOut = "Time out, try again late";
  static String cancel = "Some thing went wrong, try again later";
  static String reciveTimeOut = "Time out, try again late";
  static String sendTimeOut = "Time out, try again late";
  static String cacheError = "Cache error, try again later";
  static String noInternetConnection = "Please check your internet connection";
  static String defaultError = "Some thing went wrong, try again later";
}

class ApiInternalStatus {
  static const int success = 0;
  static const int failure = 1;
}
