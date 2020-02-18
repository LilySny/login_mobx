import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_course/authentication/store/authentication_store.dart';
import 'package:mobx_course/login/dto/login_dto.dart';
import 'package:mobx_course/login/service/login_service.dart';
import 'package:mobx_course/login/store/login_store.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  LoginStore _loginStore;
  AuthenticationStore _authenticationStore;
  ReactionDisposer _reaction;


  @override
  void initState() {
    _loginStore = LoginStore(LoginService());
    _authenticationStore = AuthenticationStore.getInstance();
    _reaction = reaction((_) => _loginStore.request.status, (_) {
      final status = _loginStore.request.status;
      if (status == FutureStatus.rejected)
        _errorDialog();
      else if (status == FutureStatus.fulfilled) _acceptedDialog();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Observer(
        builder: (BuildContext context) => Form(
      key: _formKey,
      child: Column(children: [
        TextFormField(
          onSaved: (v) => _loginStore.setUsername(v),
          decoration: InputDecoration(
              labelText: "Username", suffixIcon: Icon(Icons.person)),
        ),
        TextFormField(
          onSaved: (v) => _loginStore.setPassword(v),
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Password",
            suffixIcon: Icon(Icons.lock),
          ),
        ),
        RaisedButton(
            child: Text("Submit"),
            onPressed: () {
              _loginStore.login();
            })
      ]),
        ),
      ),
    );
  }

  void _errorDialog() {
    showDialog(
        context: context,
        child: AlertDialog(
          content: Text("O usuário não conseguiu logar!",
              style: TextStyle(color: Colors.green)),
        ));
  }

  void _acceptedDialog() {
    showDialog(
        context: context,
        child: AlertDialog(
          content: Text(
            "O usuário foi logado com sucesso!",
            style: TextStyle(color: Colors.green),
          ),
        ));
  }
}
