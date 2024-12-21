
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_data.g.dart';

@JsonSerializable()
class LoginData {
  String? id;
  String? phone;
  String? name;
  String? username;
  String? jwt;
  String? createdDate;

  LoginData(this.id, this.phone, this.name,this.username,this.jwt,this.createdDate);

  factory LoginData.fromJson(Map<String, dynamic> json) =>
  _$LoginDataFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}


