import 'package:flutter/material.dart';

import 'package:autobuddy_asd_app/custom_widgets/sign_up_page/signup_form.dart';
import 'package:autobuddy_asd_app/custom_widgets/sign_up_page/theme.dart';

import 'package:autobuddy_asd_app/colour.dart';
import 'package:autobuddy_asd_app/text.dart';

class sign_up1 extends StatefulWidget {
  const sign_up1({Key? key}) : super(key: key);

  @override
  State<sign_up1> createState() => _sign_up1State();
}

class _sign_up1State extends State<sign_up1> {
  dynamic check_box = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: kDefaultPadding,
              child: Text(
                'Create Account',
                style: titleText,
              ),
            ),
            SizedBox(
              height: 5,
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
                    width: 5,
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
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: RaisedButton(
                onPressed: check_box
                    ? () {
                        Navigator.of(context).pushNamed("/sign_in");
                      }
                    : null,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: text1,
                      color: Colors.white,
                    ),
                  ),
                ),
                color: option_button_colour,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
