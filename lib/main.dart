import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:authentication_page/main.dart';
import 'package:authentication_page/ui/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());

  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyAV8RgiZPMIuUPcTOpd0uNFvSNGW6yJcK4", // Your apiKey
        appId: "authentication-page-2fa98", // Your appId
        messagingSenderId: "925642860152", // Your messagingSenderId
        projectId: "authentication-page-2fa98"),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Authentication',
      home: Authentication(),
    );
  }
}
