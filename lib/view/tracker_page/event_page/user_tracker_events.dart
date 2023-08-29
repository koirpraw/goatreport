import 'package:flutter/material.dart';

class UserTrackerEvents extends StatelessWidget {
  const UserTrackerEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserTrackerEvents'),
      ),
      body: const Center(
        child: Text(
          'UserTrackerEvents',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
