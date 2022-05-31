import 'package:flutter/material.dart';
import 'package:autobuddy_asd_app/custom_widgets/sign_up_page/theme.dart';
import 'package:autobuddy_asd_app/services/auth.dart';
import 'package:autobuddy_asd_app/custom_widgets/profile_page/profile_form.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: kDefaultPadding,
                    child: Text(
                      'Update Profile',
                      style: titleText,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: kDefaultPadding,
                child: ProfileForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
