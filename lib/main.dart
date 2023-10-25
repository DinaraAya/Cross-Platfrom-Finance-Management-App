import 'package:abc/screens/signin.dart';
import 'package:abc/transaction_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TransactionData(),
      builder: (context, child) => MaterialApp(
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
