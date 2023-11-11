import 'package:freezed_annotation/freezed_annotation.dart';

part 'jsend_response.g.dart';

@JsonSerializable()
class JSendResponse {
  final int status;
  final dynamic data;
  final String? message;

  JSendResponse({
    required this.status,
    required this.data,
    this.message,});
  
  factory JSendResponse.fromJson(Map<String, dynamic> json) =>
      _$JSendResponseFromJson(json);
}
