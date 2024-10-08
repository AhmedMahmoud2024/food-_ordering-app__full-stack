import 'package:auth/src/domain/auth_service_contract.dart';
import 'package:auth/src/domain/signup_service_contract.dart';
import 'package:auth/src/domain/token.dart';
import 'package:async/async.dart';
class SignInUseCase{
  final ISignUpService _signUpService;

  SignInUseCase(this._signUpService);



  Future<Result<Token>> execute(
      String name,
      String email,
      String password
      ) async{
    return await _signUpService.signUp(name, email, password) ;
  }
}