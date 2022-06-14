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

class progress extends StatefulWidget {
  const progress({Key? key}) : super(key: key);

  @override
  State<progress> createState() => _progressState();
}

class _progressState extends State<progress> {
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
    'Past 3 Years'
  ];
  String selectedItem1 = 'Past 1 Month';

  //for dropdown menu2
  var level = ['2', '3', '4', '5', '6'];
  String selectedItem2 = '2';

  //to get data
  performance_data() async {
    List all_data = await read_collection(user_uid);
    int length_of_all_data = all_data.length;
    // print(all_data[0]['Level']);
    for (int i = 0; i < length_of_all_data; i++) {
      if (selectedItem == 'Auti Spark' && all_data[i]['Game ID'] == 1) {
        //only if game is auti spark if want for some other game use other if condition
        if (selectedItem2 == all_data[i]['Level'].toString()) {
          print(all_data[i]);
        }
      }
    }
  }

  //
  final List<DeveloperSeries> data = [
    DeveloperSeries(
      year: 2017,
      developers: 40000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: 2018,
      developers: 5000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: 2019,
      developers: 40000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: 2020,
      developers: 35000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: 2021,
      developers: 45000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
  ];

  final List<DeveloperSeries> data2 = [
    DeveloperSeries(
      year: 5,
      developers: 60000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: 6,
      developers: 5000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: 7,
      developers: 40000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: 8,
      developers: 35000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    DeveloperSeries(
      year: 9,
      developers: 45000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
  ];
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
                  performance_data();
                },
                child: Text("update data with doc id"),
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
                  data: data,
                ),
              ),
              Text(
                "Change in Accuracy",
                style: graph_heading,
              ),
              Center(
                child: DeveloperChart(
                  data: data2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
