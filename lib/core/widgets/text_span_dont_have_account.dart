import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          const TextSpan(
            text: "Don't have an account? ",
            style: TextStyle(
                fontSize: 13,
                color: Color(0xff939393),
                fontWeight: FontWeight.bold),
          ),
          TextSpan(
              text: 'Sign Up',
              style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xff939393),
                  fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()..onTap = () {}),
        ]));
  }
}
