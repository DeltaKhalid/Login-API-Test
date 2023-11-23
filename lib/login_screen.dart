import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_test_project/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> loginUser() async {
    print('login function is called');
    final String apiUrl = "http://192.168.1.189/api/v1/account/login/";
    final String username = emailController.text.trim();
    final String password = passwordController.text.trim();

    final response = await http.post(
      Uri.parse(apiUrl),
      body: {'username': username, 'password': password},
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);

      // Check if the username and password match your conditions
      if (responseData['username'] == 'jm_hasan' && responseData['password'] == 'hasan') {
        // Navigate to HomeScreenTwo
        //Navigator.pushReplacementNamed(context, '/home_two');
        Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen(),),);
      } else {
        // Handle incorrect username or password
        // You can show a snackbar or other UI feedback
        print('Invalid username or password');
      }
    } else {
      // Handle error, show error message, etc.
      print('Failed to login. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'UserName'),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                loginUser();
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen Two'),
      ),
      body: Center(
        child: Text('Welcome to Home Screen Two!'),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/home_two': (context) => HomeScreenTwo(),
      },
    ),
  );
}
