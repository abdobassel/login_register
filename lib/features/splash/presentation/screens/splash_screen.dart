import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project/core/colors_app.dart';
import 'package:project/core/components.dart';
import 'package:project/features/login/presentation/screens/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        context: context,
        title: 'Bassel App',
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.white.withOpacity(.1),
                    blurRadius: 40,
                    spreadRadius: 40,
                    offset: Offset(10, 5))
              ]),
              child: const Center(
                child: Text(
                  'Welcom To Our World',
                  style: TextStyle(
                      fontSize: 35,
                      color: ColorApp.hint,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            socialLogin(
                onTap: () {
                  Future.delayed(Duration(seconds: 1), () {
                    // بعد انقضاء الوقت، نقوم بالانتقال إلى صفحة اللوجين بشكل سلس
                    Navigator.of(context).push(PageTransition(
                      duration: Duration(seconds: 1),
                      child: LoginScreen(),
                      childCurrent: this,
                      type: PageTransitionType.rightToLeft,
                      // alignment: Alignment.center,
                    ));
                  });
                },
                iconData: FontAwesomeIcons.hand,
                text: 'Get Started Now!')
          ],
        ),
      ),
    );
  }
}
