import 'package:flutter/material.dart';

class TimeSheetLogin extends StatefulWidget {
  List<String> list = <String>['Superadmin', 'Admin', 'Employee'];
  TimeSheetLogin({super.key});
  @override
  State<TimeSheetLogin> createState() => _TimeSheetLoginState();
}

class _TimeSheetLoginState extends State<TimeSheetLogin> {
  String? selectedRole; // To keep track of the selected role

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Sheet Login'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Positioned(
            top: 200.0,
            child: Form(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      // Dropdown field for selecting role
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Select Role',
                        ),
                        value: selectedRole,
                        items: widget.list.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedRole = newValue; // Update the selected role
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Username',
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Password',
                        ),
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
              ],
            )),
          )
        ],
      ),
    );
  }
}
