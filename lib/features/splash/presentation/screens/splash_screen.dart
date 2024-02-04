import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project/core/cache_helper/cache_helper.dart';
import 'package:project/core/colors_app.dart';
import 'package:project/core/components.dart';
import 'package:project/features/login/presentation/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controlerAnimation;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();
    controlerAnimation =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    slideAnimation = Tween<Offset>(begin: const Offset(2, 0), end: Offset.zero)
        .animate(controlerAnimation);
    controlerAnimation.forward();
    //  slideAnimation.addListener(() {
    //  setState(() {});
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controlerAnimation.dispose();
  }

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
              child: Center(
                child: AnimatedBuilder(
                    animation: slideAnimation,
                    builder: (context, _) {
                      return SlideTransition(
                        position: slideAnimation,
                        child: Text(
                          'Welcom To Our World',
                          style: TextStyle(
                              fontSize: 35,
                              color: ColorApp.hint,
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    }),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            AnimatedBuilder(
                animation: slideAnimation,
                builder: (context, _) {
                  return SlideTransition(
                    position: slideAnimation,
                    child: socialLogin(
                        onTap: () {
                          cacheHelper
                              .saveData(key: 'SplashSeen', value: true)!
                              .then((value) {
                            if (value != null) {
                              if (value) {
                                Future.delayed(Duration(seconds: 1), () {
                                  // بعد انقضاء الوقت، نقوم بالانتقال إلى صفحة اللوجين بشكل سلس
                                  Navigator.of(context).pushAndRemoveUntil(
                                    PageTransition(
                                      duration: Duration(seconds: 1),
                                      child: LoginScreen(),
                                      childCurrent: const SplashScreen(),
                                      type: PageTransitionType.rightToLeft,
                                    ),
                                    (route) => false,
                                  );
                                });
                              }
                            }
                          });
                        },
                        iconData: FontAwesomeIcons.hand,
                        text: 'Get Started Now!'),
                  );
                })
          ],
        ),
      ),
    );
  }
}
