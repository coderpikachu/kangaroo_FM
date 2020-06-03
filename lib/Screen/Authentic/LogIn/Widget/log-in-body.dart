import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mysqltest/Api/Mysql/user-api.dart';
import 'package:mysqltest/Screen/Authentic/SignUp/sign-up-page.dart';
import 'package:mysqltest/Screen/TabPage/main-page.dart';
import 'package:mysqltest/Widget/already_have_an_account_acheck.dart';
import 'package:mysqltest/Widget/rounded-button.dart';
import 'package:mysqltest/Widget/rounded_input_field.dart';
import 'package:mysqltest/Widget/rounded_password_field.dart';

import '../../../../constants.dart';
import '../../phone-check-page.dart';
import '../../phone-page.dart';
import 'log-in-background.dart';

class LogInBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String telephone, pwd;
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
              hintText: "Your Telephone",
              onChanged: (value) {
                telephone = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                pwd = value;
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () async {
                if (await correctUser(context, telephone, pwd)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MainPage();
                      },
                    ),
                  );
                } else {
                  print('no user or wrong pwd');
                }
              },
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Forget password ? ",
                  style: TextStyle(color: kPrimaryColor),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return PhonePage(
                            mode: 'l',
                          );
                        },
                      ),
                    );
                  },
                  child: Text(
                    "SMS",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
