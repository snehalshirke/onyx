import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:onyx/repository/auth_repository.dart';
import 'package:onyx/utils/routes/routes_name.dart';
import 'package:onyx/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  final _myRepo = AuthRepository();
  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then(
      (value) {
        setLoading(false);
        Navigator.pushNamed(context, RoutesName.home);
        if (kDebugMode) {
          //Utils.flushbarErrorMessage(value.toString(), context);
          Utils.flushbarErrorMessage("Login Successful", context);
          print(value.toString());
        }
      },
    ).onError(
      (error, stackTrace) {
        setLoading(false);
        if (kDebugMode) {
          Utils.flushbarErrorMessage(error.toString(), context);
          print(error.toString());
        }
      },
    );
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);
    _myRepo.signUpApi(data).then(
      (value) {
        setSignUpLoading(false);
        Navigator.pushNamed(context, RoutesName.home);
        if (kDebugMode) {
          //Utils.flushbarErrorMessage(value.toString(), context);
          Utils.flushbarErrorMessage("SignUp Successful", context);
          Navigator.pushNamed(context, RoutesName.home);
          print(value.toString());
        }
      },
    ).onError(
      (error, stackTrace) {
        setSignUpLoading(false);
        if (kDebugMode) {
          Utils.flushbarErrorMessage(error.toString(), context);
          print(error.toString());
        }
      },
    );
  }
}
