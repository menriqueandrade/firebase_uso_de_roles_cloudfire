import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_con_inicio_por_roles/auth/auth_helpers.dart';
import 'package:login_con_inicio_por_roles/home/vistausuario/home_principal.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Center(
          child: Container(
            child: Column(
              children: [
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  child: Text('Login'),
                  onPressed: () async {
                    if (_emailController.text.isEmpty ||
                        _passwordController.text.isEmpty) {
                      print("Email and password cannot be empty");
                      return;
                    }

                    try {
                      final user = await AuthHelper.signInWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text);
                      if (user != null) {
                        print("signup successful");
                        Get.back();
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
                // ignore: deprecated_member_use
              ],
            ),
          ),
        ),
      ),
    );
  }
}
