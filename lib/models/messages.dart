class Message {
  final String name;
  final String message;
  final DateTime date;

  Message({this.name, this.message, this.date});

  factory Message.fromJSON(Map<String, dynamic> json) {
    return Message(
      name: json['name'],
      message: json['message'],
      date: json['date'],
    );
  }
}
