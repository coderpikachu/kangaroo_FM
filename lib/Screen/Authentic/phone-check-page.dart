import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mysqltest/Api/Mysql/rsms-api.dart';
import 'package:mysqltest/Api/Mysql/user-api.dart';
import 'package:mysqltest/Screen/Authentic/LogIn/log-in-page.dart';
import 'package:mysqltest/Screen/Authentic/SignUp/Widget/sign-up-background.dart';
import 'package:mysqltest/Screen/Authentic/SignUp/Widget/sign-up-or-divider.dart';
import 'package:mysqltest/Screen/Authentic/SignUp/Widget/sign-up-social-icon.dart';
import 'package:mysqltest/Screen/TabPage/main-page.dart';
import 'package:mysqltest/Widget/already_have_an_account_acheck.dart';
import 'package:mysqltest/Widget/rounded-button.dart';
import 'package:mysqltest/Widget/rounded_input_field.dart';
import 'package:mysqltest/Widget/rounded_password_field.dart';

class PhoneCheckPage extends StatelessWidget {
  final String mode;
  final String telephone;
  final String flat;
  final String dormitory;
  final String pwd;
  PhoneCheckPage(
      {@required this.mode,
      this.telephone,
      this.flat,
      this.dormitory,
      this.pwd});
  @override
  Widget build(BuildContext context) {
    String code;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SignUpBackground(
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
                hintText: "Your Code",
                onChanged: (value) {
                  code = value;
                },
              ),

              RoundedButton(
                text: "Check",
                press: () async {
                  String fCode = await fetchSmsCode(this.telephone, context);
                  if (fCode != '-1' && fCode == code) {
                    if (mode == 's') {
                      //updateSmsCode(this.telephone, context);
                      print(this.telephone);
                      print(this.pwd);
                      print(this.flat);
                      print(this.dormitory);
                      createUser(this.telephone, this.pwd, this.flat,
                          this.dormitory, context);
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MainPage();
                        },
                      ),
                    );
                  } else {
                    print('error');
                  }
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
      ),
    );
  }
}
