import 'package:flutter/material.dart';
import 'package:autobuddy_asd_app/custom_widgets/progress_page/developer_series.dart';
import 'package:autobuddy_asd_app/custom_widgets/progress_page/developer_chart.dart';
import 'package:autobuddy_asd_app/custom_widgets/sign_up_page/theme.dart';

//custom function to update and read database
import 'package:autobuddy_asd_app/services/query.dart';
//auth service import
import 'package:autobuddy_asd_app/services/auth.dart';
//plugin
import 'package:charts_flutter/flutter.dart' as charts;
// for date
import 'package:intl/intl.dart';

class progress extends StatefulWidget {
  const progress({Key? key}) : super(key: key);

  @override
  State<progress> createState() => _progressState();
}

class _progressState extends State<progress> {
  late List<DeveloperSeries> final_data = [];

  //for dropdown menu for game selection
  var selection_of_game = [
    'Auti Spark',
  ];
  String selectedItem = 'Auti Spark';

  //for dropdown menu1
  var time_period = [
    'Past 1 Month',
    'Past 3 Month',
    'Past 6 Month',
    'Past 1 Year',
    'From Beginning'
  ];
  String selectedItem1 = 'Past 1 Month';

  //for dropdown menu2
  var level = ['2', '3', '4', '5', '6'];
  String selectedItem2 = '2';

  //to get data
  performance_data() async {
    final List<DeveloperSeries> data = [];
    List temp1 = []; //to save date and get unique date
    List all_data = await read_collection(user_uid);
    int length_of_all_data = all_data.length;
    // print(all_data[0]['Level']);
    for (int i = 0; i < length_of_all_data; i++) {
      if (selectedItem == 'Auti Spark' && all_data[i]['Game ID'] == 1) {
        //only if game is auti spark if want for some other game use other if condition
        if (selectedItem2 == all_data[i]['Level'].toString()) {
          temp1.add(all_data[i]['Date']);
          print(temp1);
          print(all_data[i]);
        }
      }
    }
    var temp2 = (temp1.toSet()).toList(); //list without repeated value
    // print(temp2);

    //list with x and y axis value just make it ascending
    List temp3 = [];

    for (int j = 0; j < temp2.length; j++) {
      int total_number = 0;
      num sum = 0;

      for (int i = 0; i < length_of_all_data; i++) {
        if (selectedItem == 'Auti Spark' && all_data[i]['Game ID'] == 1) {
          //only if game is auti spark if want for some other game use other if condition
          if (selectedItem2 == all_data[i]['Level'].toString()) {
            if (temp2[j] == all_data[i]['Date']) {
              total_number += 1;
              sum += all_data[i]['Time taken'];
            }
          }
        }
      }
      num daily_avg = sum / total_number;
      print(sum);
      print(total_number);
      print(daily_avg);
      temp3.add([temp2[j], daily_avg]);

      data.add(DeveloperSeries(
          year: new DateTime(
              int.parse(temp2[j].substring(0, 4)), //to enter year
              int.parse(temp2[j].substring(5, 7)), //to enter month
              int.parse(temp2[j].substring(8, 10)) //to enter day
              ),
          developers: daily_avg / 1000,
          barColor: charts.ColorUtil.fromDartColor(Colors.green)));
    }
    print(temp3);
    print(data.runtimeType);
    final_data = data;
    print(final_data.runtimeType);
  }

  @override
  void initState() {
    performance_data();
    super.initState();
  }

  // List<DeveloperSeries> tempData = [
  //   new DeveloperSeries(
  //       year: DateTime(2017, 9, 19),
  //       developers: 5,
  //       barColor: charts.ColorUtil.fromDartColor(Colors.green)),
  //   new DeveloperSeries(
  //       year: DateTime(2017, 9, 26),
  //       developers: 25,
  //       barColor: charts.ColorUtil.fromDartColor(Colors.green)),
  //   new DeveloperSeries(
  //       year: DateTime(2017, 10, 3),
  //       developers: 100,
  //       barColor: charts.ColorUtil.fromDartColor(Colors.green)),
  //   new DeveloperSeries(
  //       year: DateTime(2017, 10, 10),
  //       developers: 75,
  //       barColor: charts.ColorUtil.fromDartColor(Colors.green)),
  // ];

  //
  // final List<DeveloperSeries> data = [
  //   DeveloperSeries(
  //     year: 2017,
  //     developers: 40000,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.green),
  //   ),
  //   DeveloperSeries(
  //     year: 2018,
  //     developers: 5000,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.green),
  //   ),
  //   DeveloperSeries(
  //     year: 2019,
  //     developers: 40000,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.green),
  //   ),
  //   DeveloperSeries(
  //     year: 2020,
  //     developers: 35000,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.green),
  //   ),
  //   DeveloperSeries(
  //     year: 2021,
  //     developers: 45000,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.green),
  //   ),
  // ];

  // final List<DeveloperSeries> data2 = [
  //   DeveloperSeries(
  //     year: 14,
  //     developers: 6000,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.green),
  //   ),
  //   DeveloperSeries(
  //     year: 15,
  //     developers: 5000,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.green),
  //   ),
  //   DeveloperSeries(
  //     year: 16,
  //     developers: 40000,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.green),
  //   ),
  //   DeveloperSeries(
  //     year: 17,
  //     developers: 35000,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.green),
  //   ),
  //   DeveloperSeries(
  //     year: 18,
  //     developers: 45000,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.green),
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // scaffold does not have background image property so used container
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/new_bg.png'),
            fit: BoxFit.cover), //fit to resize image and cover full screen
      ),
      child: Scaffold(
        backgroundColor: Colors
            .transparent, //default colour is white which will hide background pic so set it as transparent
        appBar: AppBar(
          elevation: 0.0,
          // backgroundColor: Colors.lightBlue[400],
          backgroundColor: Colors.transparent, //appbar colour is tran
          title: Text(
            '    Progress Check', //space to get title in middle of screen
            style: titleText,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //dropdown menu 1
                  Text(
                    "Game Name",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: DropdownButtonHideUnderline(
                      //to hide underline from drop down
                      child: DropdownButton(
                        value: selectedItem, //currently selected item
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: selection_of_game.map((String items) {
                          //to make elements of selection_of_game variable to dropdown
                          return DropdownMenuItem(
                            child: Text(items),
                            value: items,
                          );
                        }).toList(),
                        onChanged: (dynamic newValue) {
                          //to show new value selected
                          setState(() {
                            selectedItem = newValue;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  //dropdown menu 1
                  Text(
                    "Duration",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: DropdownButtonHideUnderline(
                      //to hide underline from drop down
                      child: DropdownButton(
                        value: selectedItem1, //currently selected item
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: time_period.map((String items) {
                          //to make elements of time_period variable to dropdown
                          return DropdownMenuItem(
                            child: Text(items),
                            value: items,
                          );
                        }).toList(),
                        onChanged: (dynamic newValue) {
                          //to show new value selected
                          setState(() {
                            selectedItem1 = newValue;
                          });
                        },
                      ),
                    ),
                  ),
                  //dropdown menu2
                  Text(
                    "Level",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: DropdownButtonHideUnderline(
                      //to hide underline from drop down
                      child: DropdownButton(
                        value: selectedItem2, //currently selected item
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: level.map((String items) {
                          //to make elements of level variable to dropdown
                          return DropdownMenuItem(
                            child: Text(items),
                            value: items,
                          );
                        }).toList(),
                        onChanged: (dynamic newValue) {
                          //to show new value selected
                          setState(() {
                            selectedItem2 = newValue;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              RaisedButton(
                onPressed: () async {
                  print("hehe");
                  print(final_data);
                  print("hehe");
                  await performance_data();

                  print(final_data);
                },
                child: Text("update data with doc id"),
              ),
              RaisedButton(
                onPressed: () {
                  // await performance_data();
                  initState();
                },
                child: Text("rebuild"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Change in performance",
                style: graph_heading,
              ),
              Center(
                child: DeveloperChart(
                  data: final_data,
                ),
              ),
              Text(
                "Change in Accuracy",
                style: graph_heading,
              ),
              // Center(
              //   child: DeveloperChart(
              //     data: data,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
