// ignore_for_file: camel_case_types

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:task_assigned_app/models/User_Model.dart';

import '../Helper/Method_Helper.dart';
import '../Helper/String_Helper.dart';
import '../main.dart';
import '../models/Chat_room_model.dart';

class New_or_Old_Users extends StatefulWidget {
  const New_or_Old_Users({super.key});

  @override
  State<New_or_Old_Users> createState() => _New_or_Old_UsersState();
}

class _New_or_Old_UsersState extends State<New_or_Old_Users> {
  DatabaseReference databaseReference=FirebaseDatabase.instance.ref();
  List<Chat_room_model> list=[];
  List<User_Model> new_user_list=[];
  List<User_Model> old_user_list=[];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load_user();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
           resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text("New or Old Users"),
            bottom: TabBar(
                tabs: [
                  Tab(
                    child: Text("New Users"),
                  ),
                  Tab(
                    child: Text("Old Users"),
                  )
                ]
            ),
          ),

          body: TabBarView(
              children: [
                //new
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only( left: width * 10/ width,
                          right: width * 10 / width,
                          top: height * 10 / height,
                          bottom: height * 10/ height),
                    child: ListView.builder(
                      itemCount: new_user_list.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(top: height*10/height),
                            child: Container(
                              height: height*90/height,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(width*10/width)
                              ),
                              padding: EdgeInsets.only(left: width * 10/ width,
                          right: width * 10 / width,
                          top: height * 10 / height,
                          bottom: height * 10/ height),
                              child: Row(
                                children: [

                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(new_user_list[index].name,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                                      fontSize: height*20/height),),
                                      Text(new_user_list[index].email)

                                    ],
                                  ),
                                   SizedBox(width: width*20/width,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      // Text("Balance : ${new_user_list[index].balance}"),

                                      Text("Password : ${new_user_list[index].password}"),
                                      Text("City : ${new_user_list[index].city}"),

                                    ],
                                  )

                                ],
                              ),
                            ),
                          );
                        },
                    ),
                  ),
                ),
                
                
                //old
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 10/ width,
                          right: width * 10 / width,
                          top: height * 10 / height,
                          bottom: height * 10/ height),
                    child: ListView.builder(
                      itemCount: old_user_list.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(  top: height * 10 / height,),
                          child: Container(
                            height:    height * 90 / height,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(  width * 10 / width)
                            ),
                            padding: EdgeInsets.only(left: width * 10/ width,
                          right: width * 10 / width,
                          top: height * 10 / height,
                          bottom: height * 10/ height),
                            child: Row(
                              children: [

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(old_user_list[index].name,style:  TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                                        fontSize: height*20/height),),
                                    Text(old_user_list[index].email)

                                  ],
                                ),
                                 SizedBox(width: width * 20/ width,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    // Text("Balance : ${old_user_list[index].balance}"),

                                    Text("Password : ${old_user_list[index].password}"),
                                    Text("City : ${old_user_list[index].city}"),

                                  ],
                                )

                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ]
          ),

        )
    );
  }

  void load_user() {

    databaseReference.child(chat_room_table+my_id()).onValue.listen((event) {
      list.clear();
      new_user_list.clear();
      old_user_list.clear();
      if(event.snapshot.exists)
        {
          Map<dynamic,dynamic> map=event.snapshot.value as Map;
          map.forEach((key, value) {
            list.add(Chat_room_model.fromJson(value));
          });


          for(int i=0;i<list.length;i++)
            {
              String time=list[i].user_model.time;
              String days=get_hours(int.parse(time));


              if(int.parse(get_hours(get_time_miles()))>int.parse(days))
              {
                old_user_list.add(list[i].user_model);

              }
              else{
                new_user_list.add(list[i].user_model);

              }

            }


          setState(() {

          });
        }

    });


  }
}
