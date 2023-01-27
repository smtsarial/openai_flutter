class User {
  String? name;
  String? surname;
  String? email;
  String? type;
  String? status;

  User({this.name, this.surname, this.email, this.type});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    surname = json['surname'];
    email = json['email'];
    type = json['type'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['email'] = this.email;
    data['type'] = this.type;
    data['status'] = this.status;
    return data;
  }
}
