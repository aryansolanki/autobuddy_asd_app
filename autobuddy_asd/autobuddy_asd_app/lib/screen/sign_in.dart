import 'package:flutter/material.dart';

import 'package:autobuddy_asd_app/text.dart';
import 'package:autobuddy_asd_app/colour.dart';

//for basic sign in button
import 'package:flutter_signin_button/flutter_signin_button.dart';

//NOTE:- in this page first container present for background pic
//on that scaffold with all widget tree.
// scaffold has stack with 2 children
//one row which has all widget tree for welcome back!!
//and other is SingleChildScrollView
//thus both row and SingleChild have padding of their own from top

class sign_in extends StatefulWidget {
  const sign_in({Key? key}) : super(key: key);

  @override
  State<sign_in> createState() => _sign_inState();
}

class _sign_inState extends State<sign_in> {
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
        body: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 35, top: 130),
                  child: Text(
                    'Welcome Back !!',
                    style: TextStyle(
                        color: Colors.white, fontFamily: text2, fontSize: 53),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              // when we type and keyboard comes then widget need to be pushed up
              //if no space is available then error comes as widget cannot move and less space for keyboard
              //so to make widget that can be scrolled we use SingleChildScrollView
              //entire widget tree under this widget is scrollable
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.4),
                //MediaQuery.of(context).size.height gives total height of screen
                // in end  *0.4 means to take 4/10th of space
                //and that value is given to padding which is controlling
                //from where rest of widget tree starts from top

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // full page except welcome back in  this container
                      margin: EdgeInsets.only(
                          left: 35,
                          right:
                              35), //margin space for email and password field on right and left
                      child: Column(
                        children: [
                          //email text field
                          TextField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: text_field_backgroundcolour,
                                filled: true,
                                hintText: "Email",
                                hintStyle: TextStyle(color: hint_text_colour),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //password text field
                          TextField(
                            style: TextStyle(),
                            obscureText:
                                true, //to get dots when password entered
                            decoration: InputDecoration(
                                fillColor: text_field_backgroundcolour,
                                filled: true,
                                hintText: "Password",
                                hintStyle: TextStyle(color: hint_text_colour),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          //sign up and forgot password row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed("/sign_up1");
                                },
                                child: Text(
                                  'Sign Up',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.white,
                                      fontSize: 15),
                                ),
                                style: ButtonStyle(),
                              ),
                              TextButton(
                                  onPressed:
                                      () {}, //--------------------->enter routing here
                                  child: Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  )),
                            ],
                          ),

                          Divider(
                            color: Colors.cyan[900],
                            height: 0,
                            thickness: 2,
                          ),

                          SizedBox(
                            height: 10,
                          ),

                          //circular arrow
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: IconButton(
                                    color: Colors.black,
                                    onPressed:
                                        () {}, //--------------------->enter routing for auth with email and password here
                                    icon: Icon(
                                      Icons.arrow_forward,
                                    )),
                              )
                            ],
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          //Google sign in
                          SignInButton(
                            Buttons.Google,
                            text: "Continue with Google",
                            onPressed:
                                () {}, //--------------------->enter google auth routing here
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
