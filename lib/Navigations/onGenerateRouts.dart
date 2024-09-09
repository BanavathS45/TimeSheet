import 'package:flutter/material.dart';
import 'package:flutter_basic_app/loginScreen/DashBoard.dart';
import 'package:flutter_basic_app/screens/LoginScreen/components/forgetPassword.dart';
import 'package:flutter_basic_app/screens/LoginScreen/components/login_body.dart';
import 'package:flutter_basic_app/userData/Registration.dart';

var onGenerateRoute = (RouteSettings settings) {
  print('my routs: ${settings.name}');
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (builder) => RegistrationScreen());
    case "/loginBody":
      return MaterialPageRoute(builder: (builder) => login_body());
    case "/dashboard":
      return MaterialPageRoute(
          builder: (builder) => DashBorad(message: "Your custom message"));
    case "/signup":
      return MaterialPageRoute(builder: (builder) => RegistrationScreen());
    case "/forgetPassword":
      return MaterialPageRoute(builder: (builder) => ForgetPassword());
    default:
  }
};
// SignUp forgetPassword