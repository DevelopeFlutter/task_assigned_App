// ignore_for_file: curly_braces_in_flow_control_structures, prefer_is_not_empty, prefer_const_constructors, non_constant_identifier_names, unused_local_variable

import 'dart:io';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:task_assigned_app/main.dart';
import 'package:task_assigned_app/models/User_Model.dart';
import 'package:voice_message_package/voice_message_package.dart';
import 'dart:ui' as ui;
import 'package:file_picker/file_picker.dart';
import '../Helper/Method_Helper.dart';
import '../Helper/String_Helper.dart';
import '../models/Chat_model.dart';
import '../models/Chat_room_model.dart';
import '../widegts/my_input_field.dart';
// import '../widegts/my_profile_container.dart';
import '../widegts/my_txt.dart';

class User_chat extends StatefulWidget {
  final Chat_room_model chat_room_model;
  const User_chat({super.key, required this.chat_room_model});

  @override
  State<User_chat> createState() => _User_chatState(chat_room_model);
}

class _User_chatState extends State<User_chat> {
  Chat_room_model chat_room_model;

  _User_chatState(this.chat_room_model);

  DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
  

  @override
  void initState() {
    super.initState();
  }

//  void _subscribeToChatUpdates() {
//     DatabaseReference chatReference = databaseReference
//         .child(chats_table + chat_room_model.admin_id)
//         .child(chat_room_model.id);

//     _subscription = chatReference.onChildAdded.listen((Event event) {
//       // Handle new chat messages here
//       // ...
//     });
//   }

  var msg = TextEditingController();
  RecorderController controller = RecorderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shadowColor: Colors.white,

        backgroundColor: Colors.white, // Set AppBar background color
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            'assets/images/arrow.png',
            scale: height / 350,
            color: Color(0xFF182a48),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: width * 0.03),
            child: Image.asset(
              'assets/images/menu.png',
              scale: height / 350,
              color: Color(0xFF182a48),
            ),
          ),
        ],
        title: Text(
          'Admin',
          style: TextStyle(
            decoration: TextDecoration.underline,
            color: Color(0xFF182a48), // Set text color
            fontSize: height * 18 / height,
            decorationColor: Color(0xFF182a48),
            fontWeight: FontWeight.bold, // Set text size (customizeable)
          ),
        ),
        centerTitle: true,
        // bottom: PreferredSize(
        //     preferredSize: Size.fromHeight(1.0),
        //     child: Container(
        //       color: Colors.white,
        //       height: 1.0,
        //     )), // Center align title
      ),
      body: Stack(
        children: [
          Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/chat_bg.png'), // Replace with your image path
                  fit: BoxFit.cover,
                ),
              )),
          Column(
            children: [
              Expanded(
                child:
                
                 FirebaseAnimatedList(
                  // reverse: true,
                  query: databaseReference
                      .child(chats_table + chat_room_model.admin_id)
                      .child(chat_room_model.id),
                  itemBuilder: (context, snapshot, animation, index) {
                    if (!snapshot.exists) return Container();

                    Chat_model model =
                        Chat_model.fromJson(snapshot.value as Map);

                    if (model.sender_id == chat_room_model.user_model.id) {
                      return Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: width * 20 / width,
                              right: width * 20 / width,
                              bottom: height * 10 / height),
                          child: Card(
                            color: Colors.white,
                            elevation: height * 5 / height,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(width * 20 / width)),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: width * 8 / width,
                                  right: width * 8 / width,
                                  top: height * 8 / height,
                                  bottom: height * 8 / height),
                              child: Column(
                                children: [
                                  Visibility(
                                    visible: !model.pdf.isEmpty,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: width * 8 / width,
                                          right: width * 8 / width,
                                          top: height * 8 / height,
                                          bottom: height * 8 / height),
                                      child: InkWell(
                                        onTap: () {},
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(
                                              Icons.picture_as_pdf,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: width * 5 / width,
                                            ),
                                            Text(
                                              'pdf file',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !model.img.isEmpty,
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: width * 8 / width,
                                            right: width * 8 / width,
                                            top: height * 8 / height,
                                            bottom: height * 8 / height),
                                        child: Image.network(model.img)),
                                  ),
                                  Visibility(
                                    visible: !model.msg.isEmpty,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: width * 8 / width,
                                          right: width * 8 / width,
                                          top: height * 8 / height,
                                          bottom: height * 8 / height),
                                      child: my_txt(
                                          txt: model.msg,
                                          txt_color: Color(0xFF182a48)),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !model.voice.isEmpty,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: width * 8 / width,
                                          right: width * 8 / width,
                                          top: height * 8 / height,
                                          bottom: height * 8 / height),
                                      child: VoiceMessage(
                                        audioSrc: model.voice,
                                        played:
                                            true, // To show played badge or not.
                                        me: false, // Set message side.
                                        onPlay:
                                            () {}, // Do something when voice played.
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: width * 8 / width,
                                        right: width * 8 / width,
                                        top: height * 8 / height,
                                        bottom: height * 8 / height),
                                    child: my_txt(
                                        txt: get_formated_time(
                                            'dd/MM/yyyy hh:mm a', model.time),
                                        txt_color: Color(0xFF182a48)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }

                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Card(
                        color: Colors.white,
                        elevation: height * 5 / height,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(width * 10 / width)),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: width * 10 / width,
                              right: width * 10 / width,
                              top: height * 10 / height,
                              bottom: height * 10 / height),
                          child: Column(
                            children: [
                              Visibility(
                                visible: !model.pdf.isEmpty,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: width * 8 / width,
                                      right: width * 8 / width,
                                      top: height * 8 / height,
                                      bottom: height * 8 / height),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.picture_as_pdf,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: width * 5 / width,
                                        ),
                                        Text(
                                          'pdf file',
                                          style: TextStyle(color: Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: !model.img.isEmpty,
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: width * 8 / width,
                                        right: width * 8 / width,
                                        top: height * 8 / height,
                                        bottom: height * 8 / height),
                                    child: Image.network(model.img)),
                              ),
                              Visibility(
                                visible: !model.msg.isEmpty,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: width * 8 / width,
                                      right: width * 8 / width,
                                      top: height * 8 / height,
                                      bottom: height * 8 / height),
                                  child: my_txt(
                                      txt: model.msg, txt_color: Colors.black),
                                ),
                              ),
                              Visibility(
                                visible: !model.voice.isEmpty,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: width * 8 / width,
                                      right: width * 8 / width,
                                      top: height * 8 / height,
                                      bottom: height * 8 / height),
                                  child: VoiceMessage(
                                    audioSrc: model.voice,
                                    played:
                                        true, // To show played badge or not.
                                    me: false, // Set message side.
                                    onPlay:
                                        () {}, // Do something when voice played.
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width * 8 / width,
                                    right: width * 8 / width,
                                    top: height * 8 / height,
                                    bottom: height * 8 / height),
                                child: my_txt(
                                    txt: get_formated_time(
                                        'dd/MM/yyyy hh:mm a', model.time),
                                    txt_color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),



              Padding(
                padding: EdgeInsets.only(bottom: height * 10 / height),
                child: Row(
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.all(2.0),
                    //   child: IconButton(
                    //       onPressed: () async {

                    //         FilePickerResult? filePicker = await FilePicker.platform
                    //             .pickFiles(
                    //                 type: FileType.custom,
                    //                 allowedExtensions: ['pdf']);

                    //         if (filePicker == null) return;

                    //         File file = File(filePicker.files.single.path!);

                    //         EasyLoading.show();
                    //         String img = await upload_img(file);
                    //         EasyLoading.dismiss();

                    //         chat_room_model.sender_id = my_id();
                    //         chat_room_model.time = get_time_miles();
                    //         chat_room_model.msg = 'pdf';

                    //         databaseReference
                    //             .child(chat_room_table)
                    //             .child(chat_room_model.id)
                    //             .set(chat_room_model.toJson());

                    //         Chat_model chat_model = Chat_model(
                    //             id: get_time_miles().toString(),
                    //             sender_id: my_id(),
                    //             time: get_time_miles(),
                    //             msg: '',
                    //             voice: '',
                    //             user_model: chat_room_model.user_model,
                    //             img: '',
                    //             pdf: img);

                    //         databaseReference
                    //             .child(chats_table + chat_room_model.admin_id)
                    //             .child(chat_room_model.id)
                    //             .child(chat_model.id)
                    //             .set(chat_model.toJson());

                    //       },
                    //       icon: Icon(Icons.picture_as_pdf)
                    //       ),
                    // ),

                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 2 / width,
                          right: width * 2 / width,
                          top: height * 2 / height,
                          bottom: height * 2 / height),
                      child: IconButton(
                          onPressed: () async {
                            XFile? x = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);
                            if (x == null) return;

                            File file = File(x.path);

                            EasyLoading.show();
                            String img = await upload_img(file);
                            EasyLoading.dismiss();

                            chat_room_model.sender_id =
                                chat_room_model.user_model.id;
                            chat_room_model.time = get_time_miles();
                            chat_room_model.msg = 'iamge';

                            databaseReference
                                .child(
                                    chat_room_table + chat_room_model.admin_id)
                                .child(chat_room_model.id)
                                .set(chat_room_model.toJson());

                            Chat_model chat_model = Chat_model(
                              id: get_time_miles().toString(),
                              sender_id: chat_room_model.user_model.id,
                              time: get_time_miles(),
                              msg: '',
                              voice: '',
                              user_model: chat_room_model.user_model,
                              img: img,
                              pdf: '',
                            );

                            databaseReference
                                .child(chats_table + chat_room_model.admin_id)
                                .child(chat_room_model.id)
                                .child(chat_model.id)
                                .set(chat_model.toJson());
                          },
                          icon: Icon(Icons.image, color: Colors.white)),
                    ),

                    Visibility(
                      visible: !controller.isRecording,
                      child: Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: width * 4 / width,
                              right: width * 4 / width,
                              top: height * 4 / height,
                              bottom: height * 4 / height),
                          child:
                              my_input_field(label: 'Message', controler: msg),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: controller.isRecording,
                      child: Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: width * 8 / width,
                              right: width * 8 / width,
                              top: height * 8 / height,
                              bottom: height * 8 / height),
                          child: AudioWaveforms(
                            size: Size(MediaQuery.of(context).size.width,
                                width * 20 / width),
                            recorderController: controller,
                            enableGesture: true,
                            waveStyle: WaveStyle(
                              waveColor: Colors.black,
                              showDurationLabel: true,
                              spacing: width * 8 / width,
                              showBottom: false,
                              extendWaveform: true,
                              showMiddleLine: false,
                              // gradient: ui.Gradient.linear(
                              //   // const Offset(70, 50),
                              //   // Offset(
                              //   //     MediaQuery.of(context).size.width / 2, 0),
                              //   // [Colors.red, Colors.green],
                              // ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 2 / width,
                          right: width * 2 / width,
                          top: height * 2 / height,
                          bottom: height * 2 / height),
                      child: GestureDetector(
                          onTap: () async {
                            if (controller.isRecording) {
                              final path = await controller
                                  .stop(); // Stop recording and get the path
                              controller.refresh();

                              print(path);

                              File file = File(path.toString());
                              EasyLoading.show();
                              String location = await upload_img(file);
                              EasyLoading.dismiss();

                              chat_room_model.sender_id =
                                  chat_room_model.user_model.id;
                              chat_room_model.time = get_time_miles();
                              chat_room_model.msg = 'voice';

                              databaseReference
                                  .child(chat_room_table +
                                      chat_room_model.admin_id)
                                  .child(chat_room_model.id)
                                  .set(chat_room_model.toJson());

                              Chat_model chat_model = Chat_model(
                                  id: get_time_miles().toString(),
                                  sender_id: chat_room_model.user_model.id,
                                  time: get_time_miles(),
                                  msg: '',
                                  voice: location,
                                  user_model: chat_room_model.user_model,
                                  img: '',
                                  pdf: '');

                              databaseReference
                                  .child(chats_table + chat_room_model.admin_id)
                                  .child(chat_room_model.id)
                                  .child(chat_model.id)
                                  .set(chat_model.toJson());

                              setState(() {});
                            } else {
                              final hasPermission =
                                  await controller.checkPermission();

                                  
                              final directory =
                                  await getApplicationDocumentsDirectory();
                              final path = '${directory.path}/myFile.mp3';
                              await controller.record(path: path);
                              setState(() {});
                            }
                          },
                          child: Icon(
                            controller.isRecording
                                ? Icons.stop_circle
                                : Icons.mic,
                            color: Colors.white,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 2 / width,
                          right: width * 2 / width,
                          top: height * 2 / height,
                          bottom: height * 2 / height),
                      child: IconButton(
                        onPressed: () {
                          chat_room_model.sender_id =
                              chat_room_model.user_model.id;
                          chat_room_model.time = get_time_miles();
                          chat_room_model.msg = msg.text;

                          databaseReference
                              .child(chat_room_table + chat_room_model.admin_id)
                              .child(chat_room_model.id)
                              .set(chat_room_model.toJson());

                          Chat_model chat_model = Chat_model(
                              id: get_time_miles().toString(),
                              sender_id: chat_room_model.user_model.id,
                              time: get_time_miles(),
                              msg: msg.text,
                              voice: '',
                              user_model: chat_room_model.user_model,
                              img: '',
                              pdf: '');

                          databaseReference
                              .child(chats_table + chat_room_model.admin_id)
                              .child(chat_room_model.id)
                              .child(chat_model.id)
                              .set(chat_model.toJson());

                          msg.text = '';
                          setState(() {});
                        },
                        icon: Icon(
                          size: height * 30 / height,
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
