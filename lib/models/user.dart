class User {
  int? id;
  String? name;
  String? email;
  String? mobile;
  // String? password;

  User();

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['phone'];
    // password = json['password'];
  }
}
