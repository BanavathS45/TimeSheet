import 'dart:io';
 

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
 
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
 

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  // input fileds

  bool visibilityPassword = true;
  bool visibilityPasswordCon = true;
  String? password;
  bool isEmailValid = false;

  var _formKey = GlobalKey<FormState>();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController CpasswordTextEditingController =
      TextEditingController();
  String defaultImageUrl =
      "https://photoexpress.in/labdata/photoexpressin/assets/testimonial/1710322444926.png";

  XFile? pickedImageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Registration Screen',
            style: GoogleFonts.lato(),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2.0),
                        decoration: const BoxDecoration(
                            color: Colors.teal, shape: BoxShape.circle
                            // border: Border.all(
                            // color: Color.fromARGB(255, 255, 247, 0), // Border color
                            // width: 2.0, // Border width
                            //     ),
                            ),
                        child: pickedImageFile != null
                            ? CircleAvatar(
                                radius: 40.0,
                                backgroundColor: Colors.teal,
                                backgroundImage:
                                    FileImage(File(pickedImageFile!.path)))
                            : CircleAvatar(
                                radius: 40.0,
                                backgroundColor: Colors.teal,
                                backgroundImage: CachedNetworkImageProvider(
                                  defaultImageUrl,
                                ),
                              ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(
                              4.0), // Adjust the padding as needed
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255,
                                255), // Set the background color for the icon
                            shape:
                                BoxShape.circle, // Make the background circular
                            border: Border.all(
                              color: Colors.teal, // Border color
                              width: 2.0, // Border width
                            ),
                          ),

                          child: InkWell(
                            onTap: () async {
                              ImagePicker imagepicker = ImagePicker();
                              pickedImageFile = await imagepicker.pickImage(
                                source: ImageSource.camera,
                                imageQuality: 50,
                                preferredCameraDevice: CameraDevice.front,
                              );
                              if (pickedImageFile != null) {
                                print("picked image");
                                setState(() {});
                              } else {
                                print("Not Picked Image");
                              }
                            },
                            child: Icon(Icons.photo_camera,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ), // Add Icon styling if needed
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text("Registration Form",
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      controller: nameTextEditingController,
                      // onChanged: (value) {
                      //   _formKey.currentState!.validate();
                      // },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter Name";
                        } else if (value.length < 3) {
                          return "Please Enter More then 3 Characters ";
                        }
                        return null;
                      },
                      maxLength: 100,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Name",
                          label: Text("Name"),
                          prefixIcon: Icon(Icons.person),
                          counterText: ""),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      controller: emailTextEditingController,

                      // onChanged: (value) {
                      //   _formKey.currentState!.validate();
                      // },
                      validator: (value) {
                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value ?? "");
                        if (value == null || value.isEmpty) {
                          setState(() {
                            isEmailValid = false;
                          });
                          return "Please enter Email id";
                        } else if (!emailValid) {
                          setState(() {
                            isEmailValid = false;
                          });
                          return "Please enter a valid Email id";
                        } else {
                          setState(() {
                            isEmailValid = true;
                          });
                          Text(
                            isEmailValid
                                ? "Valid Email Id"
                                : "Invalid Email Id",
                            style: TextStyle(
                              color: isEmailValid ? Colors.green : Colors.red,
                            ),
                          );
                          return null; // No error
                        }
                      },
                      maxLength: 100,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Email",
                          label: Text("Email"),
                          prefixIcon: Icon(Icons.email),
                          counterText: ""),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      controller: passwordTextEditingController,
                      onChanged: (value) {
                        setState(() {
                          password = value; // Store the password in the state
                        });
                      },
                      validator: (value) {
                        RegExp regex = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        } else {
                          if (!regex.hasMatch(value)) {
                            return 'Enter valid password';
                          } else {
                            return null;
                          }
                        }
                      },
                      maxLength: 100,
                      keyboardType: TextInputType.text,
                      obscureText: visibilityPassword,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Password",
                          label: Text("Password"),
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
                          counterText: ""),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      controller: CpasswordTextEditingController,
                      validator: (value) {
                        RegExp regex = RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        } else if (value !=
                            passwordTextEditingController.text) {
                          return 'Passwords do not match';
                        } else {
                          if (!regex.hasMatch(value)) {
                            return 'Enter valid password';
                          } else {
                            return null;
                          }
                        }
                      },
                      maxLength: 100,
                      keyboardType: TextInputType.text,
                      obscureText: visibilityPasswordCon,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Confirm Password",
                          label: Text("Confirm Password"),
                          prefixIcon: Icon(Icons.password),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                visibilityPasswordCon = !visibilityPasswordCon;
                              });
                            },
                            child: Icon(!visibilityPasswordCon
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined),
                          ),
                          counterText: ""),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 120,
                        child: FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              nameTextEditingController.clear();
                              emailTextEditingController.clear();
                              passwordTextEditingController.clear();
                              CpasswordTextEditingController.clear();
                              _formKey.currentState?.reset();
                            });
                          },
                          child: Text(
                            "Clear".toUpperCase(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          backgroundColor: Colors.teal,
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        child: FloatingActionButton(
                          onPressed: () {
                            // if (pickedImageFile == null) {
                            //   Fluttertoast.showToast(msg: "Not image added");
                            // }

                            // if (_formKey.currentState!.validate()) {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (ctx) => login_body(
                            //       email: emailTextEditingController.text,
                            //       name: nameTextEditingController.text,
                            //     ),
                            //   ),
                            Navigator.pushNamed(context, "/loginBody");
                            Fluttertoast.showToast(
                                msg: "SignUp Successfully...!");
                            print("You clicked loginBody");
                            // );
                            //   print("Data Added....!");
                            // } else {
                            //   print("Data Not Added...!");
                            // }
                          },
                          child: Text(
                            "Register".toUpperCase(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          backgroundColor: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(Icons.login,
                                    size: 18, color: Colors.blue),
                              ),
                              TextSpan(
                                text: " You Have Alredy Register ",
                                style: TextStyle(color: Colors.black),
                              ),
                              TextSpan(
                                text: "Login",
                                style: TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Navigate to the registration page
                                    Navigator.pushNamed(context, '/loginBody');
                                  },
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
