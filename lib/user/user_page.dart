import 'package:flutter/material.dart';
import 'package:ibmq/user/model/user.dart';

class UserPage extends StatelessWidget {
  final User user;
  const UserPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Text("${user.firstName} ${user.lastName}"),
            Text(user.email),
            Text(user.institution),
          ],
        ),
      ),
    );
  }
}
