import 'package:flutter/material.dart';
import 'package:flutter_basic_app/screens/UserScreen/components/user_details_body.dart';
import 'package:flutter_basic_app/screens/UserScreen/user_details.dart';
import 'userData.dart';
// Ensure this import path is correct

class UserDetails extends StatefulWidget {
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  late Future<List<User>> _usersFuture;

  @override
  void initState() {
    super.initState();
    _usersFuture = fetchUsers(); // Initialize the future
  }

  Future<void> _handleDelete(int id) async {
    try {
      await deleteUser(id); // Call the delete function
      setState(() {
        // Update the future to refresh the list
        _usersFuture = fetchUsers();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User deleted successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete user')),
      );
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Builder(
          builder: (context) {
            // Access the FutureBuilder's snapshot in the title
            return FutureBuilder<List<User>>(
              future: _usersFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('User Details');
                } else if (snapshot.hasData) {
                  // Display the user list length
                  return Text('User Details (${snapshot.data!.length})');
                } else {
                  return const Text('User Details');
                }
              },
            );
          },
        ),
      ),
      body: FutureBuilder<List<User>>(
        future: _usersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            // Display the list of UserCard widgets
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final user = snapshot.data![index];
                return UserCard(
                  user: user,
                  onDelete: _handleDelete, // Call the _handleDelete function
                );
              },
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
