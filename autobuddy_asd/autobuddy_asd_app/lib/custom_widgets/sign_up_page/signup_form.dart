// real form
import 'package:flutter/material.dart';

import 'package:form_field_validator/form_field_validator.dart'; //for multi validation

import 'package:autobuddy_asd_app/text.dart';
import 'package:autobuddy_asd_app/colour.dart';

import 'package:autobuddy_asd_app/screen/sign_in.dart'; //routing

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
        lastDate: DateTime(2030));
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

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formkey,
        child: Column(
          children: <Widget>[
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
                Text('Gender?'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 'male',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Male"),
                Radio(
                  value: 'female',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Female"),
                Radio(
                  value: 'other',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Other"),
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
                    Text('Date of Birth?'),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Your DOB is' +
                        date_day.toString() +
                        '/' +
                        date_month.toString() +
                        '/' +
                        date_year.toString()),
                  ],
                ),
                FlatButton(
                  child: Text("Show Time Picker"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    selectTimePicker(context);
                  },
                ),
              ],
            ),

            //mobile number form field
            TextFormField(
                controller: phone_number_controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                    hintText: 'Enter your 10 digit phone number'),
                validator: MultiValidator([
                  RequiredValidator(errorText: "* Required"),
                  MinLengthValidator(10,
                      errorText: "Phone number should be of 10 digit only"),
                  MaxLengthValidator(10,
                      errorText: "Phone number should be of 10 digit only")
                ])),

            //email form feild
            TextFormField(
                controller: email_controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
                validator: MultiValidator([
                  RequiredValidator(errorText: "* Required"),
                  EmailValidator(errorText: "Enter valid email id"),
                ])),
            //password form feild
            TextFormField(
                controller: password_controller,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
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
              title: const Text("Agree to terms and conditions."),
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
                    ? () {
                        if (formkey.currentState!.validate()) {
                          print("Validated");
                          child_name = child_name_controller.text;
                          phone_number = phone_number_controller.text;
                          email = email_controller.text;
                          password = password_controller.text;

                          print("$child_name");
                          print("$gender");
                          print("$date_day");
                          print("$date_month");
                          print("$date_year");
                          print("$phone_number");
                          print("$email");
                          print("$password");
                          Navigator.of(context).pushNamed(
                              "/sign_in"); //------------>enter routing here after login
                        } else {
                          print("Not Validated");
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
                color: option_button_colour,
              ),
            ),
          ],
        ));
  }
}
