import 'package:flutter/material.dart';
import 'package:flutter_basic_app/CURD/company_screen.dart';
import 'package:flutter_basic_app/Navigations/onGenerateRouts.dart';
import 'package:flutter_basic_app/loginScreen/DashBoard.dart';
import 'package:flutter_basic_app/userData/Registration.dart';
import 'package:flutter_basic_app/userData/userScreen.dart';
import 'package:flutter_basic_app/userData/Counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Demo App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // initialRoute: '/',
        // routes: {
        //   '/': (context) => RegistrationScreen(),
        //   '/Counter': (context) => Counter()
        // },
        onGenerateRoute: onGenerateRoute);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text('Home'),
    ));
  }
}
