import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class UserData extends StatefulWidget {
  UserData({super.key});

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  List patientData = [];

  @override
  void initState() {
    super.initState();
    signupPatient();
  }

  Future<void> signupPatient() async {
    try {
      final response = await http.get(
          Uri.parse("https://api-generator.retool.com/AmsAhH/patientRegister"));
      if (response.statusCode == 200) {
        setState(() {
          patientData = jsonDecode(response.body);
        });
      } else {
        print('Error: ${response.statusCode}');
        Fluttertoast.showToast(
          msg: "Failed to load data. Please try again later.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    } catch (e) {
      print('Exception: $e');
      Fluttertoast.showToast(
        msg: "An error occurred. Please check your connection.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
              onPressed: () {
                signupPatient();
                Fluttertoast.showToast(msg: "Updated");
              },
              icon: Icon(Icons.refresh),
            ),
          ),
        ],
        title: Text("User Data Records"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: patientData.isNotEmpty
            ? ListView.builder(
                itemCount: patientData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(patientData[index]['Name'] ?? "No Name"),
                      subtitle: TextButton(
                          onPressed: () {
                            launchUrl(Uri.parse(
                                "https://fonts.google.com/selection/embed"));
                          },
                          child: Text("Website")));
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
