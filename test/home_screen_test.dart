import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_testing_api/home_screen.dart';
import 'package:widget_testing_api/user_model.dart';

void main() {
  testWidgets(
    'Displays list of users with name as title and email as subtitle',
    (tester) async {
      final users = [
        User(id: 1, name: 'Akshay', email: 'akshay@gmail.com'),
        User(id: 2, name: 'Mohan', email: 'mohan@gmail.com'),
      ];

      Future<List<User>> mockFetchUsers() {
        return Future.value(users);
      }

      await tester.pumpWidget(MaterialApp(
        home: HomeScreen(
          futureUsers: mockFetchUsers(),
        ),
      ));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pump();
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(users.length));

      for (var user in users) {
        expect(find.text(user.name), findsOneWidget);
        expect(find.text(user.email), findsOneWidget);
      }
    },
  );
}
