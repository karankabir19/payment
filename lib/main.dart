import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:paymentgateway/common/common.dart';
import 'package:shared_preferences/shared_preferences.dart';



import 'LoginScreen.dart';
import 'home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final logindata =await SharedPreferences.getInstance();
  var so=  logindata.getString(userid);
  // await Stripe.instance.applySettings();
  runApp( MyApp(user: so,));
}

class MyApp extends StatelessWidget {
  var user;

  MyApp({required this.user}); // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: user==null? LoginScreen():home(),
    );
  }
}

