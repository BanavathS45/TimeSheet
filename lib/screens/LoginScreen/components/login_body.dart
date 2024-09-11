//  i want gradiant background colour with text feilds name user name ,email,password and confirm password and one login button with green color and functionality when i click the login button and give sign up button and give forgot password buton and functionality
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/loginScreen/DashBoard.dart';
import 'package:flutter_basic_app/staticData/about.dart';
import 'package:url_launcher/url_launcher.dart';

class login_body extends StatefulWidget {
  String? email;
  String? name;
  static const url = 'https://www.google.com';

  void _launchURL() async {
    final Uri url = Uri.parse('https://www.google.com');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  login_body({this.email = "NA", this.name = "NA"});
  @override
  _login_bodyState createState() => _login_bodyState();
}

class _login_bodyState extends State<login_body> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  bool visibilityPassword = true;
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          centerTitle: true,
          actions: [
            IconButton(onPressed: widget._launchURL, icon: Icon(Icons.help))
          ],
        ),
        body: Container(
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
                        "https://cdn3.iconfinder.com/data/icons/business-insurance-8/64/business_insurance-10-512.png"),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "Login Using Email And Password",
                    style: TextStyle(fontSize: 20.0),
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
                        hintText: "Enter Username",
                        label: Text("Username"),
                        prefixIcon: Icon(Icons.person),
                        counterText: ""),
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
                      labelText: 'Password',
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(Icons.person_add,
                                    size: 18, color: Colors.blue),
                              ),
                              TextSpan(
                                text: " You Don't Have Accont",
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: " SignUp",
                                style: TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Navigate to the registration page
                                    Navigator.pushNamed(context, '/signup');
                                    print("You tab signup");
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 100.0,
                        child: FloatingActionButton(
                          onPressed: () {
                            // if (_formKey.currentState!.validate()) {
                            // Perform login functionality
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                DashBorad.routeName, (route) => false,
                                arguments: _usernameController.text);
                            // );
                            // }
                            // Navigator.pushNamed(context, "/dashboard");
                          },
                          child: Text('Login'.toUpperCase()),
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "forgetPassword");
                      // Perform forgot password functionality
                    },
                    child: Text('Forgot password'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
