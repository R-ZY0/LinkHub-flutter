import 'package:flutter/material.dart';
import 'package:linkhub/shared/themes/theme.dart';
import 'screens/screens.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
         theme: appTheme,
         home: Onboarding1Screen(),
      );
     
    
  }
}

