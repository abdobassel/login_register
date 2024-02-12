import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project/core/bloc_observer.dart';
import 'package:project/core/cache_helper/cache_helper.dart';
import 'package:project/core/constants.dart';
import 'package:project/core/theme.dart';
import 'package:project/features/home/presentation/screens/home_screen.dart';
import 'package:project/features/login/presentation/screens/login_screen.dart';
import 'package:project/features/splash/presentation/screens/splash_screen.dart';
import 'package:project/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await cacheHelper.init();
  Bloc.observer = MyBlocObserver();

  bool splashSeen = cacheHelper.getData(key: 'SplashSeen') ?? false;

  uid = cacheHelper.getData(key: 'uId');
  Widget startScreen;
  if (splashSeen) {
    if (uid != null) {
      startScreen = HomeScreen();
    } else {
      startScreen = LoginScreen();
    }
  } else {
    startScreen = const SplashScreen();
  }
  print(uid);

  runApp(MyApp(
    startScreen: startScreen,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.startScreen});
  final Widget startScreen;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: dark(),
      debugShowCheckedModeBanner: false,
      home: startScreen,
    );
  }
}
