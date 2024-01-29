import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/core/components.dart';

class SocialAuthLogin extends StatelessWidget {
  const SocialAuthLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        socialLogin(
            iconData: FontAwesomeIcons.apple,
            text: 'login With Apple',
            onTap: () {}),
        socialLogin(
            iconData: FontAwesomeIcons.google,
            text: 'login With Google',
            onTap: () {}),
        socialLogin(
            iconData: FontAwesomeIcons.twitter,
            text: 'login With Twiter',
            onTap: () {}),
        socialLogin(
            iconData: FontAwesomeIcons.facebook,
            text: 'login With FaceBook',
            onTap: () {}),
      ],
    );
  }
}
