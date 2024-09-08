// ignore_for_file: unused_import, duplicate_ignore

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/services/auth/auth_gate.dart';
import 'package:food_delivery/services/auth/login_or_register.dart';
import 'package:food_delivery/firebase_options.dart';
import 'package:food_delivery/model/restaurant.dart';
// ignore: unused_import
import 'package:food_delivery/pages/login_page.dart';
import 'package:food_delivery/pages/register_page.dart';
import 'package:food_delivery/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ChangeNotifierProvider(create: (context) => Restaurant()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery',
      theme: Provider.of<ThemeProvider>(context).getTheme,
      home: const AuthGate(),
    );
  }
}
