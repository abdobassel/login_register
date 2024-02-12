import 'package:flutter/material.dart';
import 'package:project/core/cache_helper/cache_helper.dart';
import 'package:project/features/login/presentation/screens/login_screen.dart';

String uid = '';

void signOut(context) {
  cacheHelper.removeData(key: 'uId').then((value) {
    if (value != null) {
      if (value) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
            (route) => false);
      }
    }
  });
}
