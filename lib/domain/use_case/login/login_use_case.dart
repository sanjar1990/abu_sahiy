import 'package:abu_sahiy/data/server/api/api_service.dart';
import 'package:abu_sahiy/data/server/error_parser.dart';
import 'package:abu_sahiy/domain/data/result/result.dart';
import 'package:abu_sahiy/domain/entities/login/login_request.dart';
import 'package:abu_sahiy/domain/entities/login/login_response.dart';
import 'package:rxdart/rxdart.dart';

class LoginUseCase {
  final ApiService _service;

  LoginUseCase(this._service);

  Stream<Result<LoginResponse>> invoke(LoginRequest request) => _service
      .login(request)
      .map((response) {
        return Result.content(response);
      })
      .onErrorReturnWith(
          (error, stackTrace) => Result.error(ErrorParser.parse(error)))
      .startWith(const Result.loading());
}
