import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:watiq/screens/auth_screens/forget_pass_screen.dart';
import 'package:watiq/screens/auth_screens/launch_screen.dart';
import 'package:watiq/screens/auth_screens/login_screen.dart';
import 'package:watiq/screens/auth_screens/register_screen.dart';
import 'package:watiq/screens/auth_screens/verify_otp_screen.dart';
import 'package:watiq/screens/home_screens/home_screen.dart';
import 'package:watiq/shared_pref/shared_pref_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPref();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/launch_screen',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar'), // English
      ],
      locale: Locale('ar'),
      routes: {
        '/launch_screen':(context)=>LaunchScreen(),
        '/login_screen':(context)=>LoginScreen(),
        '/register_screen':(context)=>RegisterScreen(),
        '/forget_pass_screen':(context)=>ForgetPassScreen(),
        '/home_screen':(context)=>HomeScreen(),
      },
    );
  }
}
