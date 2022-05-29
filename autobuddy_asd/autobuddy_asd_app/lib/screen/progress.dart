import 'package:flutter/material.dart';

class progress extends StatefulWidget {
  const progress({Key? key}) : super(key: key);

  @override
  State<progress> createState() => _progressState();
}

class _progressState extends State<progress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('progress'),
        ],
      ),

      //Remove entire column widget when page ready
    );
  }
}
