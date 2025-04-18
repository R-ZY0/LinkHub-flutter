import 'package:firebase_core/firebase_core.dart';
import 'package:linkhub/screens/crud/create_profile.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:linkhub/shared/themes/theme.dart';
import 'screens/screens.dart';
void main() async{
   WidgetsFlutterBinding.ensureInitialized();
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
      debugShowCheckedModeBanner: false,
         theme: appTheme,
         home: MyNetworkScreen(),
      );
     
    
  }
}

