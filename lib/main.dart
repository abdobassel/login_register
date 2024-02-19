import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/core/bloc_observer.dart';
import 'package:project/core/cache_helper/cache_helper.dart';
import 'package:project/core/constants.dart';
import 'package:project/core/theme.dart';
import 'package:project/features/home/presentation/screens/home_screen.dart';
import 'package:project/features/login/presentation/screens/login_screen.dart';
import 'package:project/features/splash/presentation/screens/splash_screen.dart';
import 'package:project/firebase_options.dart';
import 'package:firebase_core_web/firebase_core_web.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCbFxSHhx4XGrR2GXaYW0cGzZxIsoHEnKE",
          authDomain: "bassel-app.firebaseapp.com",
          projectId: "bassel-app",
          storageBucket: "bassel-app.appspot.com",
          messagingSenderId: "281207052407",
          appId: "1:281207052407:web:9ed20d8d35af8879048e72",
          measurementId: "G-8CGJ2NVLQ8"),
    );
  } else {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  await cacheHelper.init();
  Bloc.observer = MyBlocObserver();

  bool splashSeen = cacheHelper.getData(key: 'SplashSeen') ?? false;

  uid = cacheHelper.getData(key: 'uId') as String?;
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
