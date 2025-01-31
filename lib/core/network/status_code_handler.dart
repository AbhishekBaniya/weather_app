import 'package:dio/dio.dart';

import '../../config/res/dims.dart';
import '../../config/res/strings.dart';

class StatusCodeHandler {
  // Private constructor
  StatusCodeHandler._privateConstructor();

  // Single instance
  static final StatusCodeHandler _instance = StatusCodeHandler._privateConstructor();

  // Factory constructor
  factory StatusCodeHandler() {
    return _instance;
  }

  /// Handles the status code and returns a user-friendly message.
  String handleStatusCode(int statusCode) {
    switch (statusCode) {
      case 200:
        return statusCode.toString() + Strings.requestSuccess;
      case 201:
        return statusCode.toString() + Strings.resourceCreatedSuccess;
      case 204:
        return statusCode.toString() + Strings.noContent;
      case 400:
        return statusCode.toString() + Strings.badRequest;
      case 401:
        return statusCode.toString() + Strings.unauthorized;
      case 403:
        return statusCode.toString() + Strings.forbidden;
      case 404:
        return statusCode.toString() + Strings.resourceNotFound;
      case 405:
        return statusCode.toString() + Strings.methodNotAllowed;
      case 408:
        return statusCode.toString() + Strings.requestTimeOut;
      case 429:
        return statusCode.toString() + Strings.tooManyRequests;
      case 500:
        return statusCode.toString() + Strings.internalServerError;
      case 502:
        return statusCode.toString() + Strings.badGateway;
      case 503:
        return statusCode.toString() + Strings.serviceUnavailable;
      case 504:
        return statusCode.toString() + Strings.gatewayTimeOut;
      default:
        return statusCode.toString() + Strings.unexpectedError;
    }
  }

  /// Logs the error details and provides a user-friendly message.
  String handleDioError(DioException error) {
    /*if (error.response != null) {
      // If the server responded with an error status code
      return handleStatusCode(error.response?.statusCode ?? Dim.intZero);
    } else if (error.type == DioExceptionType.connectionTimeout) {
      return Strings.connectionTimeOut;
    } else if (error.type == DioExceptionType.receiveTimeout) {
      return Strings.responseTimeOut;
    } else if (error.type == DioExceptionType.sendTimeout) {
      return Strings.requestTimeOuts;
    } else if (error.type == DioExceptionType.cancel) {
      return Strings.requestWasCanceled;
    } else {
      // For other DioError types or null response
      return Strings.anErrorOccurred;
    }*/

    if (error.response != null) {
      // If the server responded with an error status code
      return handleStatusCode(error.response?.statusCode ?? Dim.intZero);
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return Strings.connectionTimeOut;

      case DioExceptionType.receiveTimeout:
        return Strings.responseTimeOut;

      case DioExceptionType.sendTimeout:
        return Strings.requestTimeOuts;

      case DioExceptionType.cancel:
        return Strings.requestWasCanceled;

      default:
        // For other DioError types or null response
        return Strings.anErrorOccurred;
    }
  }
}
