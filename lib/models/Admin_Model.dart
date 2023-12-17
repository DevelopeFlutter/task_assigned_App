// ignore_for_file: camel_case_types, unnecessary_this

class Admin_Model {
  late String id, name, password, email;

  Admin_Model(
      {required this.id,
      required this.name,
      required this.password,
      required this.email});

  factory Admin_Model.fromJson(Map<dynamic, dynamic> json){
    return Admin_Model(
      id: json["id"],
      name: json["name"],
      password: json["password"],
      email: json["email"],
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "password": this.password,
      "email": this.email,
    };
  }

}
