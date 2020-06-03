import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mysqltest/Api/Mysql/rsms-api.dart';
import 'package:mysqltest/Api/Mysql/user-api.dart';
import 'package:mysqltest/Screen/Authentic/SignUp/sign-up-page.dart';
import 'package:mysqltest/Screen/Authentic/phone-check-page.dart';
import 'package:mysqltest/Widget/already_have_an_account_acheck.dart';
import 'package:mysqltest/Widget/rounded-button.dart';
import 'package:mysqltest/Widget/rounded_input_field.dart';
import 'package:mysqltest/Widget/rounded_password_field.dart';

import '../../constants.dart';
import 'SignUp/Widget/sign-up-background.dart';

class PhonePage extends StatelessWidget {
  final String mode;
  final String flat;
  final String dormitory;
  final String pwd;
  PhonePage({this.mode, this.flat, this.dormitory, this.pwd});
  @override
  Widget build(BuildContext context) {
    String telephone;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SignUpBackground(
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
              RoundedButton(
                text: "GET SMS",
                press: () async {
                  bool exist = await existUser(context, telephone);
                  if (mode == 's' && exist) {
                    print('exist user');
                  } else {
                    postRsms(context, telephone);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          if (mode == 's') {
                            return PhoneCheckPage(
                              mode: 's',
                              telephone: telephone,
                              flat: flat,
                              dormitory: dormitory,
                              pwd: pwd,
                            );
                          }
                          return PhoneCheckPage(
                            mode: 'l',
                            telephone: telephone,
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
