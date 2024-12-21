
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  String? firebaseId;
  String? password;
  String? username;

  LoginRequest(this.firebaseId, this.password, this.username);

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
