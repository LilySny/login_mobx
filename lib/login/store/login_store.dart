import 'package:mobx/mobx.dart';
import 'package:mobx_course/login/dto/login_dto.dart';
import 'package:mobx_course/login/service/ilogin_service.dart';

part 'login_store.g.dart';


class LoginStore = _LoginStore with _$LoginStore;


abstract class _LoginStore with Store {

LoginDto loginDto = LoginDto();
final ILoginService _loginService;

  _LoginStore(this._loginService);

@observable
ObservableFuture request = ObservableFuture.value(null);

@computed
bool get loading => request.status == FutureStatus.pending;


@action
void login(){
  request = _loginService.login(loginDto).asObservable();
}

void setUsername(v){
loginDto.username = v;
}

void setPassword(v){
  loginDto.password = v;
}

}


