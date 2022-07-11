import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_con_inicio_por_roles/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // ConnectivityController connectivityController =
  //     Get.put(ConnectivityController());
  // Connectivity().onConnectivityChanged.listen((connectivityStatus) {
  //   connectivityController.connectivity = connectivityStatus;
  // });

  runApp(MyApp());
}
