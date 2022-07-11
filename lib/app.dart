import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_con_inicio_por_roles/database/userdb_helps.dart';
import 'package:login_con_inicio_por_roles/home/home_screen.dart';
import 'package:login_con_inicio_por_roles/home/vistaadmin/home_admin.screen.dart';
import 'package:login_con_inicio_por_roles/home/vistausuario/home_principal.dart';
import 'package:login_con_inicio_por_roles/login/login_screen.dart';
import 'package:login_con_inicio_por_roles/login/signup_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Autenticacion Firebase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      // routes: {
      //   '/Home': (context) => HomeScreen(),
      //   '/Signup': (context) => SignupScreen(),
      //   '/Login': (context) => LoginScreen(),
      // },
      home: RolesScreen(),
    );
  }
}

class RolesScreen extends StatefulWidget {
  @override
  State<RolesScreen> createState() => _RolesScreenState();
}

class _RolesScreenState extends State<RolesScreen> {
  @override
  Widget build(BuildContext context) {
    

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.hasData && snapshot.data != null) {
          UserHelper.saveUser(snapshot.data!);
          return StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance.collection("users").doc(snapshot.data!.uid).snapshots() ,
            builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
              if(snapshot.hasData && snapshot.data != null) {
                final userDoc = snapshot.data;
                final user = userDoc;
                if(user!['role'] == 'admin') {
                  return HomeAdmin_Screen();
                }else{
                  return Home_Principal();
                }
              }else{
                return Material(
                  child: Center(child: CircularProgressIndicator(),),
                );
              }
            },
          );
        }
        return LoginScreen();
      }
    );
  }
}
