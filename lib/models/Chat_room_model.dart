

import 'package:task_assigned_app/models/Admin_Model.dart';
import 'package:task_assigned_app/models/User_Model.dart';

class Chat_room_model{

  late String id,sender_id,admin_id;
  late int time;
  late String msg;
  late User_Model user_model;

  Chat_room_model(
      {required this.id,
      required this.sender_id,
      required this.time,
      required this.msg,
        required this.admin_id,
      required this.user_model});

  factory Chat_room_model.fromJson(Map<dynamic, dynamic> json) {
    return Chat_room_model(
      id: json["id"],
      sender_id: json["sender_id"],
      time: json["time"],
      msg: json["msg"],
      admin_id: json["admin_id"],
      user_model: User_Model.fromJson(json["user_model"]),
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      "id": this.id,
      "sender_id": this.sender_id,
      "time": this.time,
      "msg": this.msg,
      "admin_id": this.admin_id,
      "user_model": this.user_model.toJson(),
    };
  }
//



}