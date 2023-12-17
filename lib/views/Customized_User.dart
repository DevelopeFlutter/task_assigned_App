import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_assigned_app/models/User_Model.dart';
import '../Chat/Admin_chat.dart';
import '../Helper/Method_Helper.dart';
import '../Helper/String_Helper.dart';
import '../main.dart';
import '../models/Chat_room_model.dart';
import '../widegts/my_container.dart';
import '../widegts/my_txt.dart';

class customized_user extends StatefulWidget {
  const customized_user({super.key});

  @override
  State<customized_user> createState() => _customized_userState();
}

class _customized_userState extends State<customized_user> {
  DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: databaseReference.child(chat_room_table + my_id()).onValue,
      builder: (context, snapshot) {
        if (!snapshot.hasData || !snapshot.data!.snapshot.exists) {
          return const Center(child: Text("No Massage "));
        } else {
          List<Chat_room_model> list = [];
          Map<dynamic, dynamic> map = snapshot.data!.snapshot.value as Map;
          map.forEach((key, value) {
            Chat_room_model model = Chat_room_model.fromJson(value);
            list.add(model);
          });

          list.sort(
            (a, b) => a.time.compareTo(b.time),
          );

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              Chat_room_model model = list[index];

              return Padding(
                padding: EdgeInsets.only(
                    left: width * 10 / width,
                    right: width * 10 / width,
                    top: height * 10 / height,
                    bottom: height * 10 / height),
                child: my_container(
                    height: height * 120 / height,
                    Width: Get.width,
                    widget: Padding(
                      padding: EdgeInsets.only(
                          left: width * 10 / width,
                          right: width * 10 / width,
                          top: height * 10 / height,
                          bottom: height * 10 / height),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                my_txt(
                                  txt: model.user_model.name,
                                  fontWeight: FontWeight.bold,
                                  txt_size: height * 15 / height,
                                ),
                                Text(
                                  model.sender_id == my_id().toString()
                                      ? 'by me'
                                      : model.msg,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: width * 10 / width,
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: width * 5 / width,
                                    right: width * 5 / width,
                                    top: height * 5 / height,
                                    bottom: height * 5 / height),
                                child: my_txt(
                                    txt: get_formated_time(
                                        'dd/MM/yyyy hh:mm a', model.time)),
                              )),
                          SizedBox(
                            width: width * 10 / width,
                          ),
                          Column(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    show_dialog(model.user_model);
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.green,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    databaseReference
                                        .child(user_table)
                                        .child(model.user_model.id)
                                        .remove();
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ))
                            ],
                          ),
                        ],
                      ),
                    )),
              );
            },
          );
        }
      },
    );
  }

  Future show_dialog(User_Model user_model) {
    var name = TextEditingController(),
        pass = TextEditingController(),
        balance = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Padding(
            padding: EdgeInsets.only(
                left: width * 10 / width,
                right: width * 10 / width,
                top: height * 10 / height,
                bottom: height * 10 / height),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Edit",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: height * 20 / height),
                ),
                SizedBox(
                  height: height * 20 / height,
                ),
                TextField(
                  controller: name,
                  decoration: InputDecoration(
                      label: Text("Name"),
                      hintText: user_model == null ? "" : user_model.name,
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(width * 10 / width))),
                ),
                SizedBox(
                  height: height * 10 / height,
                ),
                TextField(
                  controller: pass,
                  decoration: InputDecoration(
                      label: Text("Password"),
                      hintText: user_model == null ? "" : user_model.password,
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(width * 10 / width))),
                ),
                SizedBox(height: height * 10 / height),
                TextField(
                  controller: balance,
                  decoration: InputDecoration(
                      label: Text("Balance"),
                      // hintText: user_model==null?"":user_model.balance,
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(width * 10 / width))),
                ),
                SizedBox(
                  height: height * 30 / height,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                    onPressed: () {
                      EasyLoading.show();
                      Map<String, dynamic> map = {
                        'name': name.text.isEmpty
                            ? user_model.name
                            : name.text.toString(),
                        'password': pass.text.isEmpty
                            ? user_model.password
                            : pass.text.toString(),
                        // 'balance' : balance.text.isEmpty ? user_model.balance : balance.text.toString()
                      };
                      databaseReference
                          .child(user_table)
                          .child(user_model.id)
                          .update(map);
                      EasyLoading.dismiss();
                      EasyLoading.showSuccess("Successfully updated.");
                    },
                    child: const Center(
                        child: Text(
                      "Upload",
                      style: TextStyle(color: Colors.white),
                    )))
              ],
            ),
          ),
        );
      },
    );
  }
}
