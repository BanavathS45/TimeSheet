import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class AllApiCalls {
  String? name;
  String? email;
  var password;

  AllApiCalls({this.name, this.email, this.password});
  String baseUrl = "https://api-generator.retool.com/AmsAhH/";
  String getUrl = "patientRegister";
  String filterUrl = "patientRegister?Name=value";
  String pageNation = "patientRegister?_page=2&_limit=10";

  Future<List> signupPatient() async {
    List patientData = [];
    try {
      final response = await http.get(Uri.parse(baseUrl + getUrl));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (var eachPatient in data) {
          patientData.add(eachPatient);
        }
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
    }
    return patientData;
  }

  Future<void> postPatient(AllApiCalls patientData) async {
    try {
      // Create a JSON object with the patient data
      var body = jsonEncode({
        'Name': patientData.name,
        'Email': patientData.email,
        'Password': patientData.password
      });

      // Sending the post request
      final response = await http.post(
        Uri.parse(baseUrl + getUrl),
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      // Checking the response status
      if (response.statusCode == 201 || response.statusCode == 200) {
        print("Data added successfully: ${response.body}");
      } else {
        print("Failed to add data: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }
  }
}

void main(List<String> args) {
  AllApiCalls newDa = AllApiCalls();
  newDa.signupPatient();
}
