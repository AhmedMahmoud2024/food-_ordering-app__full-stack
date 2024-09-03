
import 'package:auth/src/domain/credential.dart';
import 'package:auth/src/domain/auth_service_contract.dart';
import 'package:auth/src/domain/signup_service_contract.dart';
import 'package:auth/src/domain/token.dart';
import 'package:async/async.dart';
import '../api/auth_api_contract.dart';

class EmailAuth implements IAuthService, ISignUpService{

  final IAuthApi _api ;

  final Credential _credential;

  EmailAuth(this._api,this._credential) ;

  @override
  Future<Result<Token>> signIn()async {
  var result = await _api.signIn(_credential);
  if(result.isError) {
    return result.asError!;
  }
  return Result.value(Token(result.asValue!.value));
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Result<Token>> signUp(String name, String email, String password) async {
    Credential credential= Credential(
        type:AuthType.email,
        email:email,
        name:name,
        password:password
    );
    var result = await _api.signIn(credential);
   if(result.isError){
     return result.asError!;
   }
   return Result.value(Token(result.asValue!.value));
  }

}