import 'package:flutter/material.dart';

import 'package:autobuddy_asd_app/custom_widgets/sign_up_page/signup_form.dart';
import 'package:autobuddy_asd_app/custom_widgets/sign_up_page/theme.dart';

import 'package:autobuddy_asd_app/colour.dart';
import 'package:autobuddy_asd_app/text.dart';

import 'package:autobuddy_asd_app/services/auth.dart';

class sign_up1 extends StatefulWidget {
  const sign_up1({Key? key}) : super(key: key);

  @override
  State<sign_up1> createState() => _sign_up1State();
}

class _sign_up1State extends State<sign_up1> {
  //instance of auth
  final AuthService _auth =
      AuthService(); // underscore to keep this variable to this file only

  @override
  Widget build(BuildContext context) {
    return Container(
      // scaffold does not have background image property so used container
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/background1.png'),
            fit: BoxFit.cover), //fit to resize image and cover full screen
      ),
      child: Scaffold(
        backgroundColor: Colors
            .transparent, //default colour is white which will hide background pic so set it as transparent
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: kDefaultPadding,
                child: Text(
                  'Create Account',
                  style: titleText,
                ),
              ),
              Padding(
                padding: kDefaultPadding,
                child: Row(
                  children: [
                    Text(
                      'Already a member?',
                      style: subTitle,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed("/sign_in");
                      },
                      child: Text(
                        'Log In',
                        style: textButton.copyWith(
                          decoration: TextDecoration.underline,
                          decorationThickness: 1,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: kDefaultPadding,
                child: SignUpForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
