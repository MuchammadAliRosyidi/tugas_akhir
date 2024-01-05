import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tugas_akhir/pages/home.dart';
import 'package:tugas_akhir/pages/login_screen.dart';
import 'package:tugas_akhir/pages/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyAnXaObU-uocXCmZjk3mP45DQG0BgpbJU0",
        appId: "1:628255971234:web:d457d84371dafb7ad244fb",
        messagingSenderId: "628255971234",
        projectId: "proyek-akhir-9c8f8",
      ),
    );
  }

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
