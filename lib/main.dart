// ignore_for_file: use_key_in_widget_constructors

import 'package:abc/screens/signin.dart';
import 'package:abc/transaction_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
//import 'homepage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TransactionData(),
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignIn(),
      ),
    );
    //return MaterialApp(
    //debugShowCheckedModeBanner: false,
    //home: HomePage(),
    //);
  }
}
