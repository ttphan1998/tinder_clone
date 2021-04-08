class ChatUser {
  String name;
  String imageURL;
  String message;
  String date;
  String time;
  bool seen;
  bool sent;
  bool received;
  int newMessages;
  ChatUser(
      {this.name,
        this.imageURL,
        this.message,
        this.date,
        this.time,
        this.seen,
        this.sent,
        this.received,
        this.newMessages});
}

List<ChatUser> dummyMsg = [
  new ChatUser(
      name: "Ayo",
      imageURL: 'assets/images/girls/img_1.jpeg',
      message:
      "How are you doing?",
      date: "11/20",
      time: "17:30",
      seen: true,
      sent: false,
      received: false,
      newMessages: 2),
  new ChatUser(
      name: "Rondeau",
      imageURL: 'assets/images/girls/img_2.jpeg',
      message: "Long time no see!!",
      date: "11/20",
      time: "17:30",
      seen: true,
      sent: false,
      received: false,
      newMessages: 2),
  new ChatUser(
      name: "Valerie",
      imageURL: 'assets/images/girls/img_3.jpeg',
      message: "Glad to know you in person!",
      date: "11/20",
      time: "17:30",
      seen: true,
      sent: false,
      received: false,
      newMessages: 2),
  new ChatUser(
      name: "Mary",
      imageURL: 'assets/images/girls/img_4.jpeg',
      message: "I'm doing fine and how about you?",
      date: "11/20",
      time: "17:30",
      seen: true,
      sent: false,
      received: false,
      newMessages: 2),
  new ChatUser(
      name: "Angie",
      imageURL: 'assets/images/girls/img_5.jpeg',
      message: "What is your real name?",
      date: "11/20",
      time: "17:30",
      seen: true,
      sent: false,
      received: false,
      newMessages: 2),
  new ChatUser(
      name: "Anne",
      imageURL: 'assets/images/girls/img_6.jpeg',
      message: "I'm happy to be your friend",
      date: "11/20",
      time: "17:30",
      seen: true,
      sent: false,
      received: false,
      newMessages: 2),
  new ChatUser(
      name: "Fineas",
      imageURL: 'assets/images/girls/img_7.jpeg',
      message: "What is your real name?",
      date: "11/20",
      time: "17:30",
      seen: true,
      sent: false,
      received: false,
      newMessages: 2),
  new ChatUser(
      name: "Atikh",
      imageURL: 'assets/images/girls/img_8.jpeg',
      message: "I'm doing fine and how about you?",
      date: "11/20",
      time: "17:30",
      seen: true,
      sent: false,
      received: false,
      newMessages: 2),
  new ChatUser(
      name: "Campbell",
      imageURL: 'assets/images/girls/img_9.jpeg',
      message: "Glad to know you in person!",
      date: "11/20",
      time: "17:30",
      seen: true,
      sent: false,
      received: false,
      newMessages: 2),
  new ChatUser(
      name: "Maya",
      imageURL: 'assets/images/girls/img_10.jpeg',
      message:
      "Long time no see!!",
      date: "11/20",
      time: "17:30",
      seen: true,
      sent: false,
      received: false,
      newMessages: 2),
];