import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// Đảm bảo file firebase_options.dart được tạo sau khi chạy flutterfire configure
import 'firebase_options.dart'; 
import 'views/home_page.dart';

void main() async {
  // Đảm bảo Flutter Widgets được khởi tạo
  WidgetsFlutterBinding.ensureInitialized();
  
  // Khởi tạo Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note App CRUD',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}