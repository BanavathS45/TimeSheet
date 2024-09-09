import 'package:flutter/material.dart';
import 'package:flutter_basic_app/userData/uesrEntites.dart';
import 'package:flutter_basic_app/userData/userServices.dart';

class EmployeeData extends StatefulWidget {
  const EmployeeData({super.key});

  @override
  _EmployeeDataState createState() => _EmployeeDataState();
}

class _EmployeeDataState extends State<EmployeeData> {
  late Future<List<Employee>> _employeeData;

  @override
  void initState() {
    super.initState();
    _loadEmployeeData(); // Load data when the widget is first created
  }

  void _loadEmployeeData() {
    setState(() {
      _employeeData = userServices().getAllEmployeeData();
    });
  }

  void _deleteEmployee(int id) async {
    await userServices().deleteEmployee(id);
    _loadEmployeeData(); // Reload the data after deletion
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Data'),
        actions: [
          IconButton(
            onPressed: () {
              _loadEmployeeData(); // Refresh data when the button is clicked
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder<List<Employee>>(
        future: _employeeData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while the data is being fetched
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            // Handle the error by showing an error message
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.hasData) {
            var empData = snapshot.data;

            if (empData == null || empData.isEmpty) {
              // Handle the case where there is no data or the list is empty
              return const Center(
                child: Text('No employee data available.'),
              );
            }

            return ListView.builder(
              itemCount: empData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: empData[index].avatar != null
                        ? NetworkImage(empData[index].avatar!)
                        : const AssetImage('assets/images/placeholder.png')
                            as ImageProvider, // Provide a local placeholder image
                  ),
                  title: Text(
                      '${empData[index].firstName} ${empData[index].lastName}'),
                  subtitle: Text(empData[index].email ?? 'No Position'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // Confirm before deleting
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Delete Employee"),
                            content: const Text(
                                "Are you sure you want to delete this employee?"),
                            actions: [
                              TextButton(
                                child: const Text("Cancel"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text("Delete"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  _deleteEmployee(empData[index]
                                      .id!); // Delete the employee
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                );
              },
            );
          }

          // Handle the case where there's no data but no error (possible edge case)
          return const Center(child: Text('No data available.'));
        },
      ),
    );
  }
}
