import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:onyx/data/model/user_model.dart';
import 'package:onyx/utils/routes/routes_name.dart';
import 'package:onyx/view_model/user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();
  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) {
      if (kDebugMode) {
        print(value.token);
      }
      if (value.token == 'null' || value.token == "") {
        Future.delayed(const Duration(seconds: 10));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        Future.delayed(const Duration(seconds: 10));
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
