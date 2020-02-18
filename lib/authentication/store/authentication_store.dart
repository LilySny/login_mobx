import 'package:mobx/mobx.dart';
import 'package:mobx_course/user/model/user.dart';
part 'authentication_store.g.dart';

class AuthenticationStore extends _AuthenticationStoreBase with _$AuthenticationStore{
    static AuthenticationStore _instance;

    AuthenticationStore._();

    static AuthenticationStore getInstance(){
      _instance ??= AuthenticationStore._();
      return _instance;
    }
}

abstract class _AuthenticationStoreBase with Store {
  @observable
  ObservableFuture<User> currentUser;

  @action
  void authenticateUser(User user){
    currentUser = ObservableFuture.value(user);
  }

  @action
  void logout(){
    currentUser = null;
  }
}