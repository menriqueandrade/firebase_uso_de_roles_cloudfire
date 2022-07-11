import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_con_inicio_por_roles/login/login_screen.dart';
import 'package:login_con_inicio_por_roles/login/signup_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                ElevatedButton(
                  child: Text('Registrar'),
                  onPressed: () {
                     Get.to(SignupScreen());
                  },
                  
                ),
                ElevatedButton(
                  child: Text('Login'),
                  onPressed: () {
                    Get.to(LoginScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
