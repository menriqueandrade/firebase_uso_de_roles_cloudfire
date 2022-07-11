import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_con_inicio_por_roles/auth/auth_helpers.dart';

import 'package:login_con_inicio_por_roles/home/vistausuario/home_principal.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Registrar'),
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

                  // ignore: deprecated_member_use
                  RaisedButton(
                    child: Text('Registrar'),
                    onPressed: () async {
                      print('Registrar');

                      try {
                        final user =
                            await AuthHelper.signupWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text);
                        if (user != null) {
                          Get.back();
                        }
                      } catch (e) {
                        Get.snackbar('Error:', e.toString(),
                            snackPosition: SnackPosition.BOTTOM);

                        // print(e);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
