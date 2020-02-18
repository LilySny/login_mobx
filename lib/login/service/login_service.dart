import 'package:mobx_course/login/dto/login_dto.dart';
import 'package:mobx_course/login/service/ilogin_service.dart';
import 'package:mobx_course/user/model/user.dart';

class LoginService implements ILoginService {

  @override
  Future<User> login(LoginDto loginDto) async {
    return User(1, "tchan", "12345678");
  }
}





