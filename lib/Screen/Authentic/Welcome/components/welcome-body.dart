import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mysqltest/Screen/Authentic/LogIn/log-in-page.dart';
import 'package:mysqltest/Screen/Authentic/LogIn/log-in.dart';
import 'package:mysqltest/Screen/Authentic/SignUp/sign-up-page.dart';
import 'package:mysqltest/Screen/Authentic/Welcome/components/welcome-background.dart';
import 'package:mysqltest/Widget/rounded-button.dart';

import '../../../../constants.dart';
import '../../sign-up.dart';

class WelcomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return WelcomeBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME TO KANGAROO",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LogInPage();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
