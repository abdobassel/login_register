import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:project/core/bloc_observer.dart';
import 'package:project/core/theme.dart';
import 'package:project/features/login/presentation/screens/login_screen.dart';
import 'package:project/features/splash/presentation/screens/splash_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: dark(),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
