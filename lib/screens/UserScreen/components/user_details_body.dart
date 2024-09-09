import 'package:flutter/material.dart';
import 'userData.dart'; // Ensure this import path is correct

class UserCard extends StatelessWidget {
  final User user;
  final Future<void> Function(int) onDelete; // Callback for delete action

  UserCard({required this.user, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(user.avatar),
        ),
        title: Text('${user.firstName} ${user.lastName}'),
        subtitle: Text(user.email),
        trailing: IconButton(
          icon: Icon(Icons.delete_forever),
          onPressed: () async {
            await onDelete(user.id); // Call the delete function
          },
        ),
      ),
    );
  }
}
