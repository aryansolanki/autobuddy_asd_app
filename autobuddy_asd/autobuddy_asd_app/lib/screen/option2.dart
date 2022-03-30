import 'package:flutter/material.dart';

import 'package:autobuddy_asd_app/colour.dart';
import 'package:autobuddy_asd_app/text.dart';

class option2 extends StatefulWidget {
  const option2({Key? key}) : super(key: key);

  @override
  State<option2> createState() => _option2State();
}

class _option2State extends State<option2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appbar_colour,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image(
                image: AssetImage('assets/Name.png'),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/sign_in");
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Sign In',
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
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
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
        ));
  }
}
