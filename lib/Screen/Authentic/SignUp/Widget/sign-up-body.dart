import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mysqltest/Screen/Authentic/LogIn/log-in-page.dart';
import 'package:mysqltest/Screen/Authentic/SignUp/Widget/sign-up-background.dart';
import 'package:mysqltest/Screen/Authentic/SignUp/Widget/sign-up-or-divider.dart';
import 'package:mysqltest/Screen/Authentic/SignUp/Widget/sign-up-social-icon.dart';
import 'package:mysqltest/Widget/already_have_an_account_acheck.dart';
import 'package:mysqltest/Widget/rounded-button.dart';
import 'package:mysqltest/Widget/rounded_input_field.dart';
import 'package:mysqltest/Widget/rounded_password_field.dart';

import '../../phone-check-page.dart';
import '../../phone-page.dart';

class SignUpBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String flat;
    String dormitory;
    String pwd;
    Size size = MediaQuery.of(context).size;
    return SignUpBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Your Flat",
              onChanged: (value) {
                flat = value;
              },
            ),
            RoundedInputField(
              hintText: "Your Dormitory",
              onChanged: (value) {
                dormitory = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                pwd = value;
              },
            ),
            RoundedButton(
              text: "CONTINUE",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PhonePage(
                        mode: 's',
                        flat: flat,
                        dormitory: dormitory,
                        pwd: pwd,
                      );
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
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
//            SignUpOrDivider(),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                SignUpSocialIcon(
//                  iconSrc: "assets/icons/facebook.svg",
//                  press: () {},
//                ),
//                SignUpSocialIcon(
//                  iconSrc: "assets/icons/twitter.svg",
//                  press: () {},
//                ),
//                SignUpSocialIcon(
//                  iconSrc: "assets/icons/google-plus.svg",
//                  press: () {},
//                ),
//              ],
//            )
          ],
        ),
      ),
    );
  }
}
