import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:task_assigned_app/Chat/Admin_chat.dart';
import 'package:task_assigned_app/Helper/Method_Helper.dart';
import 'package:task_assigned_app/main.dart';

import '../Helper/String_Helper.dart';
import '../models/Chat_room_model.dart';
import '../widegts/my_container.dart';
// import '../widegts/my_profile_container.dart';
import '../widegts/my_txt.dart';

class Chat_rooms extends StatefulWidget {
  const Chat_rooms({super.key});

  @override
  State<Chat_rooms> createState() => _Chat_roomsState();
}

class _Chat_roomsState extends State<Chat_rooms> {
  DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: databaseReference.child(chat_room_table + my_id()).onValue,
      builder: (context, snapshot) {
        if (!snapshot.hasData || !snapshot.data!.snapshot.exists) {
          return const Center(child: Text("No Massage "));
        }

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
                  left: width * 5 / width,
                  right: width * 5 / width,
                  top: height * 5 / height,
                  bottom: height * 5 / height),
              child: InkWell(
                onTap: () {
                  nxt_page(Admin_chat(chat_room_model: model));
                },
                child: my_container(
                    height: height * 70 / height,
                    Width: Get.width,
                    widget: Row(
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
                        // Spacer(),
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
                      ],
                    )),
              ),
            );
          },
        );
      },
    );
  }
}
