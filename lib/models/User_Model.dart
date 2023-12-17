// ignore_for_file: non_constant_identifier_names

class User_Model{

  late String id,name,email,dob,city,password,re_pass,time;

  User_Model(
      {required this.id,
      required this.name,
    
      required this.email,
      required this.city,
       required this.password,
        required this.re_pass,
      required this.time,
      });

  factory User_Model.fromJson(Map<dynamic, dynamic> json) {
    return User_Model(
      id: json["id"],
      name: json["name"],
      
      email: json["email"],
      city: json["city"],
       password: json["password"],
        re_pass: json["re_pass"],
      
      
      time: json["time"],
    
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "email": this.email,
      "password": this.password,
       "re_pass": this.re_pass,
         "city": this.city,
      "time": this.time,
    };
  }
//




}