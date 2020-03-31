class ChatModel {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;

  ChatModel({this.name, this.message, this.time, this.avatarUrl});
}

List<ChatModel> dummyData = [
  new ChatModel(
      name: "NOTICE BOARD",
      message: "TRDDC interviews to be held next week",
      time: "15:30",
      avatarUrl:
          "https://previews.123rf.com/images/dinozzo/dinozzo1105/dinozzo110500078/9636395-cork-board-with-blank-notes.jpg"),
  new ChatModel(
      name: "TECHNICAL",
      message: "Amit: Hey I have hacked whatsapp!",
      time: "17:30",
      avatarUrl:
          "https://cdn.nextgov.com/media/img/upload/2019/11/22/NGiot20191122/860x394.jpg"),
  new ChatModel(
      name: "CULTURAL",
      message: "Ritu: EBSB event schedule for the day!",
      time: "5:00",
      avatarUrl:
          "https://cdn.i.haymarketmedia.asia/?n=campaign-asia%2Fcontent%2Fsocmed-20200102120811425.jpg&h=570&w=855&q=100&v=20170226&c=1"),
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
