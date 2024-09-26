import 'package:flutter/material.dart';
import 'package:flutter_basic_app/CURD/company_screen.dart';
import 'package:flutter_basic_app/Drawer.dart';
import 'package:flutter_basic_app/ListViewWidgets/ListView.dart';
import 'package:flutter_basic_app/SurecareLogin/LoginS.dart';
import 'package:flutter_basic_app/TimeSheet/login/Login.dart';
import 'package:flutter_basic_app/loginScreen/DashBoard.dart';
import 'package:flutter_basic_app/screens/LoginScreen/components/forgetPassword.dart';
import 'package:flutter_basic_app/screens/LoginScreen/components/login_body.dart';
import 'package:flutter_basic_app/userData/Registration.dart';

var onGenerateRoute = (RouteSettings settings) {
  print('my routs: ${settings.name}');
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (builder) => RegistrationScreen());
      // return MaterialPageRoute(builder: (builder) => CompanyScreen());
    // return MaterialPageRoute(builder: (builder) => TimeSheetLogin());
    case "/listViewWidget":
      return MaterialPageRoute(builder: (builder) => ListViewWidget());
    case "/loginBody":
      return MaterialPageRoute(builder: (builder) => login_body());
    case "/dashboard":
      return MaterialPageRoute(
          builder: (builder) => DashBorad(
                message: settings.arguments.toString(),
              ));
    case "/signup":
      return MaterialPageRoute(builder: (builder) => RegistrationScreen());
    case "/forgetPassword":
      return MaterialPageRoute(builder: (builder) => ForgetPassword());

    case "/providerlogin":
      return MaterialPageRoute(builder: (builder) => DrawerScreen());
       case "/companyScreen":
           return MaterialPageRoute(builder: (builder) => CompanyScreen());


    default:
  }
};
// SignUp forgetPassword /dashboard