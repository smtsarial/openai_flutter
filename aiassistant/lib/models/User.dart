class User {
  String? name;
  String? surname;
  String? email;
  String? type;
  int? weight;
  String? status;

  User({this.name, this.surname, this.email, this.type, this.weight});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    surname = json['surname'];
    email = json['email'];
    type = json['type'];
    weight = json['weight'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['email'] = this.email;
    data['type'] = this.type;
    data['weight'] = this.weight;
    data['status'] = this.status;
    return data;
  }
}


/*


{
    "name": "Ram",
    "surname": "ame",
    "email": "Ram@gmail.com",
    "type": "Student",
    "weight": 56
}


*/