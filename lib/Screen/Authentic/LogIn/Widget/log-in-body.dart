import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mysqltest/Screen/Authentic/SignUp/sign-up-page.dart';
import 'package:mysqltest/Widget/already_have_an_account_acheck.dart';
import 'package:mysqltest/Widget/rounded-button.dart';
import 'package:mysqltest/Widget/rounded_input_field.dart';
import 'package:mysqltest/Widget/rounded_password_field.dart';

import 'log-in-background.dart';

class LogInBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LogInBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
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
