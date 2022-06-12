class ItemModel {
  final String value;
  final String icon;
  bool accepting;

  ItemModel({required this.value, required this.icon, this.accepting = false});
}

List<ItemModel> question = [
  ItemModel(icon: 'assets/game_1/question_database/apple.jpg', value: "apple"),
  ItemModel(
      icon: 'assets/game_1/question_database/banana.jpg', value: "banana"),
  ItemModel(
      icon: 'assets/game_1/question_database/cherry.jpg', value: "cherry"),
  ItemModel(icon: 'assets/game_1/question_database/lime.jpg', value: "lime"),
  ItemModel(
      icon: 'assets/game_1/question_database/orange.jpg', value: "orange"),
  ItemModel(
      icon: 'assets/game_1/question_database/strawberry.jpg',
      value: "strawberry"),
];
