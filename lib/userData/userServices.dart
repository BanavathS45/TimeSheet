import 'dart:convert';
import 'package:flutter_basic_app/userData/uesrEntites.dart';
import 'package:http/http.dart' as http;

class userServices {
  String baseUrl = "https://reqres.in/api/";
// https://reqres.in/api/users
  Future<List<Employee>> getAllEmployeeData() async {
    List<Employee> allEmp = [];
    try {
      var response = await http.get(Uri.parse(baseUrl + "users"));
      if (response.statusCode == 200) {
        var data = response.body;
        var decodedata = jsonDecode(data);
        var emp = decodedata['data']; //decodedata.data
        print(emp);

        for (var emps in emp) {
          Employee newEmp = Employee.fromJson(emps);
          allEmp.add(newEmp);
        }
        return allEmp;
      }
    } catch (e) {
      throw Exception("users not found");
    }
    return allEmp;
  }

  // Delete an employee by ID
  Future<void> deleteEmployee(int id) async {
    try {
      var response = await http.delete(Uri.parse(baseUrl + "users/$id"));
      if (response.statusCode == 204) {
        print("Employee with id $id deleted successfully");
      } else {
        throw Exception("Failed to delete employee with id $id");
      }
    } catch (e) {
      throw Exception("Failed to delete employee: $e");
    }
  }
}
