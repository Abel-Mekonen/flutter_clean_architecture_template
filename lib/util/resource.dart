import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:homme/util/app_exception.dart';
import 'package:retrofit/dio.dart';

abstract class Resource<T> {
  final T? data;
  final Exception? error;

  const Resource({this.data, this.error});
}

class Success<T> extends Resource<T> {
  const Success(T data) : super(data: data);
}

class Error<T> extends Resource<T> {
  const Error(AppException e) : super(error: e);
}

Future<Resource<T>> handleApiCall<T>(Future<HttpResponse<T>> service) async {
  try {
    var httpResponse = await service;
    return Success(httpResponse.data);
  } on DioException catch (e) {
    return Error(AppException.fromDioException(e));
  }
}

extension ResourceExtensions<T> on Resource<T> {
  void fold<Exception>({
    required Function(T) onSuccess,
    required Function(AppException) onError,
  }) {
    if (this is Success<T>) {
      onSuccess(data as T);
    } else if (this is Error<T>) {
      onError(error as AppException);
    } else {
      debugPrint('Unknown Resource Type $runtimeType');
    }
  }
}
