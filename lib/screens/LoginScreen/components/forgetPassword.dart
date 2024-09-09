//  i want gradiant background colour with text feilds name user name ,email,password and confirm password and one login button with green color and functionality when i click the login button and give sign up button and give forgot password buton and functionality
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/loginScreen/DashBoard.dart';
import 'package:flutter_basic_app/userData/Counter.dart';

class ForgetPassword extends StatefulWidget {
  String? email;
  String? name;

  ForgetPassword({this.email = "NA", this.name = "NA"});
  @override
  _forgetPasswordState createState() => _forgetPasswordState();
}

class _forgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  bool visibilityPassword = true;
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Forget Password"),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 40.0,
                      backgroundColor: Colors.transparent,
                      backgroundImage: CachedNetworkImageProvider(
                          "https://th.bing.com/th/id/R.02a07991f13f2ba8915f2f3165bb9a3c?rik=stZdjsYm7DbrWQ&pid=ImgRaw&r=0"),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: _usernameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter User Name",
                          label: Text("Old Password"),
                          prefixIcon: Icon(Icons.person),
                          counterText: ""),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      obscureText: visibilityPassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'New Password',
                        prefixIcon: Icon(Icons.password),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              visibilityPassword = !visibilityPassword;
                            });
                          },
                          child: Icon(!visibilityPassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      obscureText: visibilityPassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirm New Password',
                        prefixIcon: Icon(Icons.password),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              visibilityPassword = !visibilityPassword;
                            });
                          },
                          child: Icon(!visibilityPassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 150.0,
                          child: FloatingActionButton(
                            onPressed: () {
                              // if (_formKey.currentState!.validate()) {
                              // Perform login functionality
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (ctx) => forgetPassword(),
                              //   ),
                              // );
                              // }
                              Navigator.pushNamed(context, "/dashboard");
                            },
                            child: Text('Update Password'.toUpperCase()),
                            backgroundColor: Colors.teal,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
