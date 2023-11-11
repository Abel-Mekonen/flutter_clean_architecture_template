import 'package:freezed_annotation/freezed_annotation.dart';

part 'jsend_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class JSendResponse<T> {
  final int status;
  final T? data;
  final String? message;

  JSendResponse({
    required this.status,
    required this.data,
    this.message,
  });

  factory JSendResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$JSendResponseFromJson(json, fromJsonT);
}
