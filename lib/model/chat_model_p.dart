class ChatModel {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;

  ChatModel({this.name, this.message, this.time, this.avatarUrl});
}

List<ChatModel> dummyData = [
  new ChatModel(
      name: "Tarun",
      message: "Desing team meeting at 5",
      time: "15:30",
      avatarUrl:
          ""),
  new ChatModel(
      name: "Prince",
      message: "When is your lab today ?",
      time: "17:30",
      avatarUrl:
          "https://cdn.nextgov.com/media/img/upload/2019/11/22/NGiot20191122/860x394.jpg"),
  new ChatModel(
      name: "Yashi",
      message: "I will be sending you pdf in a min",
      time: "5:00",
      avatarUrl:
          ""),
  new ChatModel(
      name: "SPORTS",
      message: "Dheeraj: Kshitij Chess trials todat at 5:30pm",
      time: "10:30",
      avatarUrl:
          "https://en.unesco.org/sites/default/files/styles/commemoration_header/public/commemorations/shutterstock_599738306.jpg?itok=uwCK97T9"),
  new ChatModel(
      name: "FOOD",
      message: "Alia: Can someone pick my parcel at the gate?",
      time: "12:30",
      avatarUrl:
          "https://image.shutterstock.com/image-photo/healthy-food-clean-eating-selection-260nw-722718097.jpg"),
  new ChatModel(
      name: "TRAVEL",
      message: "Pawan: Leaving for station at 4pm",
      time: "15:30",
      avatarUrl:
          "https://content3.jdmagicbox.com/comp/def_content/travel_agents/default-travel-agents-6.jpg"),
];
