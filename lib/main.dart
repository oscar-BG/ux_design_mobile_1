import 'package:flutter/material.dart';
import 'package:ux_design_mobile_1/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login UI',
      initialRoute: 'login',
      routes: {
        'login': ( _ ) => LoginScreen(),
        'register': ( _ ) => RegisterScreen(),
        'home': ( _ ) => HomeScreen(),
      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300]
      ),
    );
  }
}
