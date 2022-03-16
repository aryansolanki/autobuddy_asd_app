import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {
  void delay() {
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        Navigator.of(context).pushNamed("/option");
      });
    });
  }

  @override
  void initState() {
    super.initState();
    delay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent, // ==========>Change colour later
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/Name.png'),
              ),
              Container(
                child: SpinKitPumpingHeart(
                  color: Colors.red[600],
                  size: 75.0,
                ),
              )
            ],
          ),
        ));
  }
}
