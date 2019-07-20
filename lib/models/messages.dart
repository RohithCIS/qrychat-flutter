class Message {
  final String name;
  final String message;
  final DateTime date;
  final String type;

  Message({this.type, this.name, this.message, this.date});

  factory Message.fromJSON(Map<String, dynamic> json) {
    return Message(
      type: json['mtype'],
      name: json['name'],
      message: json['message'],
      date: DateTime.parse(json['date']),
    );
  }
}
