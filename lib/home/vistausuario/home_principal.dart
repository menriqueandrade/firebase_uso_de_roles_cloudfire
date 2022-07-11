import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_con_inicio_por_roles/auth/auth_helpers.dart';
import 'package:login_con_inicio_por_roles/login/login_screen.dart';

class Home_Principal extends StatefulWidget {
  @override
  State<Home_Principal> createState() => _Home_PrincipalState();
}

class _Home_PrincipalState extends State<Home_Principal> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home Principal'),
        ),
        body: Center(
          child: Container(
            child: Text('Esta es la vista del Usuario'),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.close),
          onPressed: () {
            AuthHelper.logOut();
           Get.to(LoginScreen());
          },
        ),
      ),
    );
  }
}
