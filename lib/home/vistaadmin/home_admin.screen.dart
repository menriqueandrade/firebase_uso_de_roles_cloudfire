import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_con_inicio_por_roles/auth/auth_helpers.dart';
import 'package:login_con_inicio_por_roles/login/login_screen.dart';

class HomeAdmin_Screen extends StatefulWidget {
  @override
  State<HomeAdmin_Screen> createState() => _HomeAdmin_ScreenState();
}

class _HomeAdmin_ScreenState extends State<HomeAdmin_Screen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Admin Home Principal'),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(children: <Widget>[
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('users').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  final docs = snapshot.data!.docs;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      final user = docs[index];
                      return ListTile(
                        title: Text(user['email']),
                      );
                    },
                  );
                }
                return Center(
                  child: CircularProgressIndicator(
                      backgroundColor: Colors.amberAccent),
                );
              },
            )
          ])),
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
