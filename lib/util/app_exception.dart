
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AppException implements Exception {
  final String message;

  AppException(this.message);

  factory AppException.fromDioException(Exception exception) {
    String message;
    try {
      if (exception is DioException) {
        switch (exception.type) {
          case DioExceptionType.cancel:
            message = 'Request cancelled prematurely';
            break;

          case DioExceptionType.connectionTimeout:
            message = 'Connection not established';
            break;

          case DioExceptionType.sendTimeout:
            message = 'Failed to send';
            break;

          case DioExceptionType.receiveTimeout:
            message = 'Failed to receive';
            break;

          case DioExceptionType.badResponse:
            message = exception.response != null ? exception.response!.data['message'] : 'Bad response';
            debugPrint('AppException : BadResponse Dio Exception >> $message');
            break;

          case DioExceptionType.connectionError:
            message = 'Bad connection';
            break;

          case DioExceptionType.unknown:
            message = 'Unknown error';
            debugPrint('AppException : Unknown Dio Exception >> ${exception.message}');
            break;

          default:
            message = 'Error unrecognized';
            debugPrint('AppException : Unrecognized Dio Exception >> ${exception.message}');
        }
      } else {
        message = 'Error unrecognized';
      }
    } on FormatException catch (e) {
      message = 'Unable to process the data';
      debugPrint('AppException : FormatException >> ${e.message}');
    } on Exception catch (e) {
      message = 'Error unrecognized';
      debugPrint('AppException : UnknownException >> ${e.toString()}');
    }
    return AppException(message);
  }
}
