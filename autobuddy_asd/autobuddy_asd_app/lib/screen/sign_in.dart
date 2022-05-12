import 'package:flutter/material.dart';

import 'package:autobuddy_asd_app/text.dart';
import 'package:autobuddy_asd_app/colour.dart';
import 'package:form_field_validator/form_field_validator.dart'; //for multi validation

//routing
import 'package:autobuddy_asd_app/screen/forgot_password.dart';

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
  //global key for textform feild
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
//variable to store value
  dynamic email;
  dynamic password;
//controller
  TextEditingController email_controller = new TextEditingController();
  TextEditingController password_controller = new TextEditingController();

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
                      child: Form(
                        key: formkey,
                        child: Column(
                          children: [
                            //email text field
                            TextFormField(
                                style: TextStyle(
                                  color: Colors.black,
                                  decorationColor:
                                      Colors.black, //Font color change
                                ),
                                controller: email_controller,
                                decoration: InputDecoration(
                                  //normal border does not work so enableborder used
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(
                                        color: Colors.black87, width: 1.5),
                                  ),
                                  labelText: 'Email',
                                  labelStyle: TextStyle(color: Colors.black87),
                                  hintText:
                                      'Enter valid email id as abc@gmail.com',
                                  hintStyle: TextStyle(color: Colors.black54),
                                ),
                                validator: MultiValidator([
                                  RequiredValidator(errorText: "* Required"),
                                  EmailValidator(
                                      errorText: "Enter valid email id"),
                                ])),
                            SizedBox(
                              height: 20,
                            ),
                            //password text field
                            TextFormField(
                                style: TextStyle(
                                  color: Colors.black,
                                  decorationColor:
                                      Colors.black, //Font color change
                                ),
                                controller: password_controller,
                                obscureText: true,
                                decoration: InputDecoration(
                                  //normal border does not work so enableborder used
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    borderSide: BorderSide(
                                        color: Colors.black87, width: 1.5),
                                  ),
                                  labelText: 'Password',
                                  labelStyle: TextStyle(color: Colors.black87),
                                  hintText: 'Enter secure password',
                                  hintStyle: TextStyle(color: Colors.black54),
                                ),
                                validator: MultiValidator([
                                  RequiredValidator(errorText: "* Required"),
                                  MinLengthValidator(6,
                                      errorText:
                                          "Password should be atleast 6 characters"),
                                  MaxLengthValidator(15,
                                      errorText:
                                          "Password should not be greater than 15 characters"),
                                  PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                                      errorText:
                                          'passwords must have at least one special character')
                                ])),
                            //sign up and forgot password row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed("/sign_up1");
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
                                    onPressed: () {
                                      //enter any custon func if required
                                      Navigator.of(context)
                                          .pushNamed("/forgot_password");
                                    }, //--------------------->enter routing here
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
                                      onPressed: () {
                                        if (formkey.currentState!.validate()) {
                                          print("Validated");

                                          email = email_controller.text;
                                          password = password_controller.text;

                                          print("$email");
                                          print("$password");
                                          Navigator.of(context).pushNamed(
                                              "/dashboard"); //------------>enter routing here after login
                                          //XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                                          //NOTE check details and use custom function to do all validation n all
                                          //XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                                        } else {
                                          print("Not Validated");
                                        }
                                      },
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
                              onPressed: () {
                                // use custom func to see sign in with google if true then route
                                Navigator.of(context).pushNamed("/dashboard");
                              }, //--------------------->enter google auth routing here
                            ),
                          ],
                        ),
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
