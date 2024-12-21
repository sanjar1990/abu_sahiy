import 'package:abu_sahiy/domain/data/login_data/login_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  int? code;
  bool? isError;
  String? message;
  LoginData? date;
  LoginResponse(this.code, this.isError,this.message, this.date);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
