import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:autobuddy_asd_app/colour.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Container(
        // color: Color.fromRGBO(24, 233, 111, 0.6), //for transparent background
        child: Center(
          child: SpinKitPouringHourGlassRefined(
            color: mid_screen_loading_colour,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
