import 'dart:convert';
import 'package:flutter_basic_app/screens/UserScreen/components/userData.dart';
import 'package:http/http.dart' as http;

Future<List<User>> fetchUsers() async {
  final response = await http.get(Uri.parse('https://reqres.in/api/users'));

  if (response.statusCode == 200) {
    final List<dynamic> usersJson = jsonDecode(response.body)['data'];
    print('Users Data: $usersJson'); // Print the list of user data
    return usersJson.map((json) => User.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}

Future<void> deleteUser(int id) async {
  print('Attempting to delete user with id: $id');
  final response =
      await http.delete(Uri.parse('https://reqres.in/api/users/$id'));

  if (response.statusCode == 204) {
    print('User deleted successfully.');
  } else {
    print('Failed to delete user. Status code: ${response.statusCode}');
    throw Exception('Failed to delete user.');
  }
}


// Future<List<User>> fetchUsers() async {
//   final response = await http.get(Uri.parse('http://192.168.1.2:4000/'));

//   if (response.statusCode == 200) {
//     final List<dynamic> usersJson = jsonDecode(response.body);
//     print('Users Data: $usersJson'); // Print the list of user data
//     return usersJson.map((json) => User.fromJson(json)).toList();
//   } else {
//     throw Exception('Failed to load users');
//   }
// }
