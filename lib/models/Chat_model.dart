import 'package:task_assigned_app/models/Admin_Model.dart';
import 'package:task_assigned_app/models/User_Model.dart';


class Chat_model{

  late String id,sender_id;
  late int time;
  late String msg,voice,img,pdf;
  late User_Model user_model;

  Chat_model(
      {required this.id,
      required this.sender_id,
      required this.time,
      required this.msg,
      required this.voice,
      required this.img,
      required this.pdf,
      required this.user_model,});

  factory Chat_model.fromJson(Map<dynamic, dynamic> json) {
    return Chat_model(
      id: json["id"],
      sender_id: json["sender_id"],
      time: json["time"],
      msg: json["msg"],
      voice: json["voice"],
      img: json["img"],
      pdf: json["pdf"],

      user_model: User_Model.fromJson(json["user_model"]),
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      "id": this.id,
      "sender_id": this.sender_id,
      "time": this.time,
      "msg": this.msg,
      "voice": this.voice,
      "img": this.img,
      "pdf": this.pdf,
      "user_model": this.user_model.toJson(),
    };
  }
//



}
