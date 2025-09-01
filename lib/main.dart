// ignore_for_file: duplicate_import

import 'package:e_commerse_flutter_app/pages/register_page.dart';
import 'package:flutter/material.dart';
// ignore: 
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/account_page.dart';
import 'pages/cart_page.dart';

void main () {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'loginPage', // halaman pertama yg ditampilkan
      routes: {
        'loginPage': (context) => const LoginPage(),
        'registerPage': (context) => const RegisterPage(),
        'accountPage': (context) => const AccountPage(),
        'cartPage': (context) => const CartPage(),
      },
    );
  }
}