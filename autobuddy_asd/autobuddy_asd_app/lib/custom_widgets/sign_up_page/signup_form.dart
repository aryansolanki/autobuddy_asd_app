// real form
import 'package:flutter/material.dart';

import 'package:form_field_validator/form_field_validator.dart'; //for multi validation

import 'package:autobuddy_asd_app/text.dart';
import 'package:autobuddy_asd_app/colour.dart';
import 'package:autobuddy_asd_app/custom_widgets/sign_up_page/theme.dart';

import 'package:autobuddy_asd_app/screen/dashboard.dart'; //routing

import 'package:autobuddy_asd_app/services/auth.dart';

//loading widget
import 'package:autobuddy_asd_app/custom_widgets/mid_screen_loading.dart';

//custom function to update and read database
import 'package:autobuddy_asd_app/services/query.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  dynamic child_name;
  //for radio button
  dynamic gender;
  dynamic phone_number;
  dynamic email;
  dynamic password;
  dynamic check_box = false;

  TextEditingController child_name_controller = new TextEditingController();
  TextEditingController phone_number_controller = new TextEditingController();
  TextEditingController email_controller = new TextEditingController();
  TextEditingController password_controller = new TextEditingController();

//to select date of birth
  DateTime date = DateTime.now(); // variable to store dob in detail
  //to get in piece, use date.day, date.month, date.year
  int date_day = 31; //to store day
  int date_month = 10; //to store month
  int date_year = 2001; //to store year

  Future<Null> selectTimePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(1970),
        lastDate: DateTime(2023));
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
        date_day = date.day;
        date_month = date.month;
        date_year = date.year;
        print(date.toString());
      });
    }
  }

  //to save error if occure while auth
  String error = '';

  //instance of auth
  final AuthService _auth =
      AuthService(); // underscore to keep this variable to this file only

  //for checking when to show loading widget
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Form(
            key: formkey,
            child: Column(
              children: <Widget>[
                //name form feild
                TextFormField(
                  style: TextStyle(
                    color: Colors.black,
                    decorationColor: Colors.black, //Font color change
                  ),
                  controller: child_name_controller,
                  decoration: InputDecoration(
                    //normal border does not work so enableborder used
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.black87, width: 1.5),
                    ),
                    labelText: 'Name ',
                    labelStyle: TextStyle(color: Colors.black87),
                    hintText: 'Enter Name of Child',
                    hintStyle: TextStyle(color: Colors.black54),
                  ),
                  validator: RequiredValidator(errorText: "* Required"),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Gender?',
                      style: subTitle,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Transform.scale(
                      scale: 1.4,
                      child: Radio(
                        value: 'male',
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value;
                          });
                        },
                        activeColor: Colors.blue[700],
                      ),
                    ),
                    Text(
                      "Male",
                      style: subTitle,
                    ),
                    Transform.scale(
                      scale: 1.4,
                      child: Radio(
                        value: 'female',
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value;
                          });
                        },
                        activeColor: Colors.pink[400],
                      ),
                    ),
                    Text(
                      "Female",
                      style: subTitle,
                    ),
                    Transform.scale(
                      scale: 1.4,
                      child: Radio(
                        value: 'other',
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value;
                          });
                        },
                        // activeColor: Colors.deepPurple[500],
                        activeColor: Colors.white70,
                      ),
                    ),
                    Text(
                      "Other",
                      style: subTitle,
                    ),
                  ],
                ),
                //code for DOB
                //row is created in it for 1st cell column is created which has 2 text widget n 1 size box
                //row's 2nd cell has flatbutton DOB picker
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date of Birth?',
                          style: subTitle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Your DOB is ' +
                              date_day.toString() +
                              '/' +
                              date_month.toString() +
                              '/' +
                              date_year.toString(),
                          style: subTitle,
                        ),
                      ],
                    ),
                    FlatButton(
                      child: Text("Select your DOB", style: DOB_button),
                      color: Colors.lightBlue[700],
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        selectTimePicker(context);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                //mobile number form field
                TextFormField(
                    style: TextStyle(
                      color: Colors.black,
                      decorationColor: Colors.black, //Font color change
                    ),
                    controller: phone_number_controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      //normal border does not work so enableborder used
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide:
                            BorderSide(color: Colors.black87, width: 1.5),
                      ),
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(color: Colors.black87),
                      hintText: 'Enter your 10 digit phone number',
                      hintStyle: TextStyle(color: Colors.black54),
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Required"),
                      MinLengthValidator(10,
                          errorText: "Phone number should be of 10 digit only"),
                      MaxLengthValidator(10,
                          errorText: "Phone number should be of 10 digit only")
                    ])),
                SizedBox(
                  height: 10,
                ),

                //email form feild
                TextFormField(
                    style: TextStyle(
                      color: Colors.black,
                      decorationColor: Colors.black, //Font color change
                    ),
                    controller: email_controller,
                    decoration: InputDecoration(
                      //normal border does not work so enableborder used
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide:
                            BorderSide(color: Colors.black87, width: 1.5),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.black87),
                      hintText: 'Enter valid email id as abc@gmail.com',
                      hintStyle: TextStyle(color: Colors.black54),
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Required"),
                      EmailValidator(errorText: "Enter valid email id"),
                    ])),
                SizedBox(
                  height: 10,
                ),
                //password form feild
                TextFormField(
                    style: TextStyle(
                      color: Colors.black,
                      decorationColor: Colors.black, //Font color change
                    ),
                    controller: password_controller,
                    obscureText: true,
                    decoration: InputDecoration(
                      //normal border does not work so enableborder used
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide:
                            BorderSide(color: Colors.black87, width: 1.5),
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.black87),
                      hintText: 'Enter secure password',
                      hintStyle: TextStyle(color: Colors.black54),
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Required"),
                      MinLengthValidator(6,
                          errorText: "Password should be atleast 6 characters"),
                      MaxLengthValidator(15,
                          errorText:
                              "Password should not be greater than 15 characters"),
                      PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                          errorText:
                              'passwords must have at least one special character')
                    ])),
                //check box
                // SizedBox(
                //   height: 20,
                // ),
                CheckboxListTile(
                  title: Text(
                    "Agree to terms and conditions.",
                    style: subTitle,
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: check_box,
                  onChanged: (value) {
                    setState(() {
                      check_box =
                          value; // state to check box is in check_box variable
                    });
                  },
                ),

                //XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: RaisedButton(
                    onPressed: check_box
                        ? () async {
                            if (formkey.currentState!.validate()) {
                              print("Validated");
                              child_name = child_name_controller.text;
                              phone_number = phone_number_controller.text;
                              email = email_controller.text;
                              password = password_controller.text;
                              setState(
                                  () => loading = true); //for loading widget
                              //for sign in with email n password
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      email, password);
                              setState(
                                  () => loading = false); //for loading widget
                              if (result == null) {
                                setState(() {
                                  error = 'Please supply a valid Credentials';
                                });
                              } else {
                                await update_data(user_uid, 'Name', child_name);
                                await update_data(user_uid, 'Gender', gender);
                                await update_data(
                                    user_uid, 'Date of birth', date_day);
                                await update_data(
                                    user_uid, 'Month of birth', date_month);
                                await update_data(
                                    user_uid, 'Year of birth', date_year);
                                await update_data(
                                    user_uid, 'Contact number', phone_number);
                                await update_data(user_uid, 'E-mail ID', email);
                                await update_data(
                                    user_uid, 'Password', password);
                              }

                              print("$child_name");
                              print("$gender");
                              print("$date_day");
                              print("$date_month");
                              print("$date_year");
                              print("$phone_number");
                              print("$email");
                              print("$password");
                              Navigator.pop(context);

                              //Navigator.of(context).pushNamed("/dashboard"); //------------>enter routing here after login
//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                              //NOTE enter all custom function here to send and store and do all back end work with received data
                              //XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                            } else {
                              print(
                                  "Not Validated"); //front end validation failed
                            }
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
                    // color: Color(0xFF082933),
                    color: Colors.lightBlue[800],
                    // color: Color(0xFF0091EA),
                  ),
                ),

                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: error_colour, fontSize: 14.0),
                )
              ],
            ));
  }
}
