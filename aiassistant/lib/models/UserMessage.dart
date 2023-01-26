class UserMessage {
  String? userId;
  DateTime? time;
  String? request;
  String? response;

  UserMessage({this.userId, this.time, this.request, this.response});

  UserMessage.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    time = json['time'];
    request = json['request'];
    response = json['response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['time'] = this.time;
    data['request'] = this.request;
    data['response'] = this.response;
    return data;
  }
}
