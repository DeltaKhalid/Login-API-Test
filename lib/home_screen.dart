import 'dart:convert';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:login_test_project/dashboard_screen.dart';

import 'login_response.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  /// Form Validation
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  final TextEditingController _userNameTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  // String username = "khalid@gmail.com";
  // String password = "123456";

  // String username = "jm_hasan";
  // String password = "hasan";



  // void login() async {
  //   // Set your POSTMAN URL
  //   String postmanUrl = "http://192.168.1.189/api/v1/account/login/";
  //
  //   // Create a map with form parameters (username and password)
  //   Map<String, String> body = {
  //     "username": "jm_hasan",
  //     "password": "hasan",
  //   };
  //
  //   // Make the POST request
  //   http.Response response = await http.post(
  //     Uri.parse(postmanUrl),
  //     body: body,
  //   );
  //
  //   // Check if the request was successful (status code 200)
  //   if (response.statusCode == 200) {
  //     // Parse the JSON response using the LoginResponse class
  //     LoginResponse loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
  //
  //     // Access the data from the POJO
  //     print("Status: ${loginResponse.status}");
  //     print("Token: ${loginResponse.token}");
  //     print("User ID: ${loginResponse.data.id}");
  //     print("Username: ${loginResponse.data.username}");
  //     // ... and so on for other fields
  //   } else {
  //     // Handle errors
  //     print("Error: ${response.statusCode}");
  //   }
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity, // Set your desired width
            height: 450, // Set your desired height
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              //border: Border.all(width: 1, color: Colors.black), // Optional: Add a border
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 0),
              child: Form(
                key: _formState,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30,),
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Divider(
                      height: 1,
                      color: Colors.redAccent,
                    ),
                    const SizedBox(height: 50,),
                    TextFormField(
                      controller: _userNameTEController,
                      validator: ( String? value){
                        if (value?.trim().isEmpty ?? true){
                          return 'Enter Your User Name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: 'Enter Your Email'
                      ),
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      controller: _passwordTEController,
                      validator: ( String? value){
                        if (value?.isEmpty ?? true){
                          return 'Enter Your Password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: 'Enter Your Password'
                      ),
                    ),
                    const SizedBox(height: 20,),
                    TextButton(onPressed: (){}, child: Text('Change Password', style: TextStyle(
                      color: Colors.black,
                    ),),),
                    const SizedBox(height: 10,),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 12),

                          ),
                          onPressed: () async{      ///*** must use "async" for working "await"


                            //login();
                            print('Button is Pressed');
                            Response response = await post(
                                Uri.parse(
                                    'https://task.teamrabbil.com/api/v1/login'
                                    //'http://192.168.1.189/api/v1/account/login/'),
                                    //'http://103.231.177.98/api/v1/account/login/'
                                ),
                                // headers: {
                                //   'Content-type': 'application/json',
                                // },
                                body: jsonEncode({
                                  "username": _userNameTEController.text.trim(),
                                  "password": _passwordTEController.text,
                                  // "ProductName": _productNameTEController.text.trim(),
                                  // "Qty": _productQuentityTEController.text.trim(),
                                  // "TotalPrice": _productPriceTEController.text.trim(),
                                  // "UnitPrice": _productTotalPriceTEController.text.trim()
                                }));
                            print('massage statusCode : ${response.statusCode}');
                            print(response.body);
                            setState(() {});

                          }, child: Text("Add")


                      ),
                    ),
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: ElevatedButton(
                    //     onPressed: () async{
                    //       // String username = "jm_hasan";
                    //       // String password = "hasan";
                    //
                    //       // login(username, password);
                    //       //String? token = await login(username, password);
                    //
                    //       // if (token != null) {
                    //       //   print("Login successful. Token: $token");
                    //       //   Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen(),),);
                    //       // } else {
                    //       //   print("Login failed.");
                    //       // }
                    //     },
                    //     child: Text('Login'),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            // Your content goes here
          ),
        ),
        // Container(
        //   height: 200,
        //   width: double.infinity,
        //   color: Colors.white,
        //   child: Text('Lognpage'),
        // )
      ),
    );
  }
}

class ScreenBackground extends StatelessWidget {
  final Widget child;

  ScreenBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.redAccent, Colors.orange],
        ),
      ),
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.6,
          child: child, // Display the provided child widget
        ),
      ),
    );
  }
}