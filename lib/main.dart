import 'package:provider/provider.dart';
import 'package:secondtry/pages/Home_page.dart';
import 'package:secondtry/pages/Login_page.dart';
import 'package:secondtry/pages/Register_page.dart';
import 'package:secondtry/services/auth/auth_gate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:secondtry/themes/dark_mode.dart';
import 'package:secondtry/themes/light_mode.dart';
import 'package:secondtry/themes/theme_provider.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(create: (context) => ThemeProvider(),
    child: const MyApp(),)
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData
      //theme: lightMode,
    );
  }
}





