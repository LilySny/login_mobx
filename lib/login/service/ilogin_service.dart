import 'package:mobx_course/login/dto/login_dto.dart';
import 'package:mobx_course/user/model/user.dart';

abstract class ILoginService {
  Future<User> login(LoginDto loginDto);
}