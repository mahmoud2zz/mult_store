import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mult_store/auth/supplier_login.dart';
import 'package:mult_store/auth/supplier_signup.dart';
import 'package:mult_store/providers/cart_providers.dart';
import 'package:mult_store/providers/wish_provider.dart';
import 'package:provider/provider.dart';

import 'auth/customer_login.dart';
import 'auth/customer_signup.dart';
import 'firebase_options.dart';
import 'main_screens/customer_home_screen.dart';
import 'main_screens/suppler_home.dart';
import 'main_screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

  runApp(MultiProvider(


      providers: [
        ChangeNotifierProvider(create: (_)=>Cart()),
        ChangeNotifierProvider(create: (_)=>Wish())
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/welcome_screen',
      routes: {
        '/welcome_screen': (context) => const WelcomeScreen(),
        '/customer_home': (context) =>   const CustomerHomeScreen(),
        '/suppler_home': (context) => const SupplerHomeScreen(),
        '/customer_signup': (context) => const CustomerRegister(),
        '/customer_login': (context) => const CustomerLogin(),
        '/supplier_login': (context) => const SupplierLogin(),
        '/supplier_signup': (context) => const SupplierRegister(),
      },
    );
  }
}
