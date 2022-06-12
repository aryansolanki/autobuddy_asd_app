import 'package:flutter/material.dart';

//file where custom model is created and question are formed
import 'package:autobuddy_asd_app/game_1/question_set.dart';

//auth service import
//to get and use user uid
import 'package:autobuddy_asd_app/services/auth.dart';

//for using DatabaseService
import 'package:autobuddy_asd_app/services/database.dart';

//custom function to update and read database
import 'package:autobuddy_asd_app/services/query.dart';

//loading widget
import 'package:autobuddy_asd_app/custom_widgets/mid_screen_loading.dart';

class Game_1 extends StatefulWidget {
  @override
  _Game_1State createState() => _Game_1State();
}

class _Game_1State extends State<Game_1> {
  //game id specific to this game
  int game_id = 1;

  //initial question number=2, if matched in less than threshold time then number of question will be increased by 1 to max 6
  int difficulty = 2;

  //stopwatch
  final stopwatch = Stopwatch();

  start_stopwatch() {
    stopwatch.start();
  }

  value_of_stopwatch() {
    int elapsed = stopwatch.elapsedMilliseconds;
    return elapsed;
  }

  stop_stopwatch() {
    stopwatch.stop();
  }

  reset_stopwatch() {
    stopwatch.reset();
  }

  late List<ItemModel> items;
  late List<ItemModel> items2;

  late int score;
  late int wrong_attempt;
  late bool gameOver;

  @override
  void initState() {
    super.initState();
    initGame();
  }

  initGame() {
    gameOver = false;
    // time();
    start_stopwatch();
    score = 0;
    wrong_attempt = 0;

    items = random_question();
    // items = [
    //   ItemModel(icon: 'assets/Name.png',  value: "Coffee"),
    //   ItemModel(icon: 'assets/Name.png',  value: "dog"),
    //   ItemModel(icon: 'assets/Name.png',  value: "Cat"),
    //   ItemModel(icon: 'assets/Name.png',  value: "Cake"),
    //   ItemModel(icon: 'assets/Name.png',  value: "bus"),
    // ];
    items2 = List<ItemModel>.from(items);
    items.shuffle();
    items2.shuffle();
  }

  //currently implementing without this time function
  time() {
    if (!gameOver) start_stopwatch();
    if (gameOver) {
      stop_stopwatch();
      value_of_stopwatch();
      reset_stopwatch();
    }
  }

  //difficulty setter
  difficulty_setter(dynamic time_taken_for_current_level) {
    if (time_taken_for_current_level < 120000 && difficulty == 2) {
      //answer from value_of_stopwatch is in milisecond so to set time less than 2 minutes, 2*60*1000
      difficulty = 3;
    } else if (time_taken_for_current_level < 180000 && difficulty == 3) {
      //answer from value_of_stopwatch is in milisecond so to set time less than 3 minutes, 3*60*1000
      difficulty = 4;
    } else if (time_taken_for_current_level < 240000 && difficulty == 4) {
      //answer from value_of_stopwatch is in milisecond so to set time less than 4 minutes, 4*60*1000
      difficulty = 5;
    } else if (time_taken_for_current_level < 300000 && difficulty == 5) {
      //answer from value_of_stopwatch is in milisecond so to set time less than 5 minutes, 5*60*1000
      difficulty = 6;
    }
  }

  random_question() {
    List<int> list = List.generate(
        question.length, (i) => i); //so as to take any number from question set

    // shuffle it
    list.shuffle();

    // take the numbers now, they are always unique
    List<int> question_number = list.sublist(0, difficulty);

    // print(question_number);
    List<ItemModel> shuffled_question = [];
    for (int i in question_number) {
      shuffled_question.add(question[i]);
    }
    // print(shuffled_question);
    return shuffled_question;
  }

  //for checking when to show loading widget
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    if (items.length == 0) gameOver = true;
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.amber,
            appBar: AppBar(
              centerTitle: true,
              title: Text('Matching Game'),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Text.rich(TextSpan(children: [
                    TextSpan(text: "Score: "),
                    TextSpan(
                        text: "$score",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ))
                  ])),
                  if (!gameOver)
                    Row(
                      children: <Widget>[
                        Column(
                            children: items.map((item) {
                          return Container(
                            margin: const EdgeInsets.all(8.0),
                            child: Draggable<ItemModel>(
                              data: item,
                              childWhenDragging: Image.asset(
                                item.icon,
                                height: 75.0,
                                width: 75.0,
                              ),
                              feedback: Image.asset(
                                item.icon,
                                height: 75.0,
                                width: 75.0,
                              ),
                              child: Image.asset(
                                item.icon,
                                height: 75.0,
                                width: 75.0,
                              ),
                            ),
                          );
                        }).toList()),
                        Spacer(),
                        Column(
                            children: items2.map((item) {
                          return Container(
                            margin: const EdgeInsets.all(8.0),
                            child: DragTarget<ItemModel>(
                              onAccept: (receivedItem) {
                                if (item.value == receivedItem.value) {
                                  setState(() {
                                    items.remove(receivedItem);
                                    items2.remove(item);
                                    score += 10;
                                    item.accepting = false;
                                  });
                                } else {
                                  setState(() {
                                    score -= 5;
                                    wrong_attempt += 1;
                                    item.accepting = false;
                                  });
                                }
                              },
                              onLeave: (receivedItem) {
                                setState(() {
                                  item.accepting = false;
                                });
                              },
                              onWillAccept: (receivedItem) {
                                setState(() {
                                  item.accepting = true;
                                });
                                return true;
                              },
                              builder: (context, acceptedItems, rejectedItem) =>
                                  Image.asset(
                                item.icon,
                                height: 75.0,
                                width: 75.0,
                              ),
                            ),
                          );
                        }).toList()),
                      ],
                    ),
                  if (gameOver)
                    GestureDetector(
                      onTap: () async {
                        setState(() => loading = true); //for loading widget
                        stop_stopwatch();
                        print(value_of_stopwatch());

                        // time();
                        print(wrong_attempt);
                        //to push to database time, number of wrong attempt, difficulty ,game_id
                        await DatabaseService(uid: user_uid).add_record(game_id,
                            difficulty, value_of_stopwatch(), wrong_attempt);
                        difficulty_setter(value_of_stopwatch());
                        reset_stopwatch();
                        setState(() => loading = false); //for loading widget
                        initGame();
                        setState(() {});
                      },
                      child: AlertDialog(
                          title: Column(
                        children: <Widget>[
                          Image.asset(
                            'assets/game_1/yay.gif',
                            height: 250.0,
                            width: 250.0,
                          ),
                          const Text(
                            'Shall we go to the next game ?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )),
                    )

                  // Text(
                  //   "GameOver",
                  //   style: TextStyle(
                  //     color: Colors.red,
                  //     fontWeight: FontWeight.bold,
                  //     fontSize: 24.0,
                  //   ),
                  // ),
                  // if (gameOver)
                  //   Center(
                  //     child: RaisedButton(
                  //       textColor: Colors.white,
                  //       color: Colors.pink,
                  //       child: Text("New Game"),
                  //       onPressed: () {
                  //         time();
                  //         initGame();
                  //         setState(() {});
                  //       },
                  //     ),
                  //   )
                ],
              ),
            ),
          );
  }
}
