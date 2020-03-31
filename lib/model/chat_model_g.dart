class ChatModel_g {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;

  ChatModel_g({this.name, this.message, this.time, this.avatarUrl});
}

List<ChatModel_g> dummyData = [
  new ChatModel_g(
      name: "Create New Group Chat Here",
      message: "Create group chat by clicking the button below",
      time: "",
      avatarUrl:
          ""),
];
