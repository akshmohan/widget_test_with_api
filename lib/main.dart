import 'package:flutter/material.dart';
import 'package:widget_testing_api/user_repository.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Users Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(
        futureUsers: UserRepository().fetchUsers(),
      ),
    );
  }
}
