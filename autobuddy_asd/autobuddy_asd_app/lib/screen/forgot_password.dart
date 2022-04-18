import 'package:flutter/material.dart';

class forgot_password extends StatefulWidget {
  const forgot_password({Key? key}) : super(key: key);

  @override
  State<forgot_password> createState() => _forgot_passwordState();
}

class _forgot_passwordState extends State<forgot_password> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('forgot password'),
          RaisedButton(
            onPressed: () {},
            child: Text("OTP using number "),
          ),
        ],
      ),

      //Remove entire column widget when page ready
    );
  }
}
