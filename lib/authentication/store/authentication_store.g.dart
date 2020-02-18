// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthenticationStore on _AuthenticationStoreBase, Store {
  final _$currentUserAtom = Atom(name: '_AuthenticationStoreBase.currentUser');

  @override
  ObservableFuture<User> get currentUser {
    _$currentUserAtom.context.enforceReadPolicy(_$currentUserAtom);
    _$currentUserAtom.reportObserved();
    return super.currentUser;
  }

  @override
  set currentUser(ObservableFuture<User> value) {
    _$currentUserAtom.context.conditionallyRunInAction(() {
      super.currentUser = value;
      _$currentUserAtom.reportChanged();
    }, _$currentUserAtom, name: '${_$currentUserAtom.name}_set');
  }

  final _$_AuthenticationStoreBaseActionController =
      ActionController(name: '_AuthenticationStoreBase');

  @override
  void authenticateUser(User user) {
    final _$actionInfo =
        _$_AuthenticationStoreBaseActionController.startAction();
    try {
      return super.authenticateUser(user);
    } finally {
      _$_AuthenticationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void logout() {
    final _$actionInfo =
        _$_AuthenticationStoreBaseActionController.startAction();
    try {
      return super.logout();
    } finally {
      _$_AuthenticationStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
