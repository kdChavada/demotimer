import 'package:demotimer/UI/chat_audio/audio_wave_form.dart';
import 'package:demotimer/UI/chat_audio/voice_note.dart';
import 'package:demotimer/UI/multipleImage/multiple_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../multipleImage/TBC_Small_widget.dart';
import '../multipleImage/file_pick_demo.dart';
import '../multipleImage/uxpicker.dart';
import '../timerUI/timer_new_screen.dart';

class ChatRecordAudio extends StatefulWidget {
  const ChatRecordAudio({Key? key}) : super(key: key);

  @override
  State<ChatRecordAudio> createState() => _ChatRecordAudioState();
}

class _ChatRecordAudioState extends State<ChatRecordAudio> {
  List<String> list = [];

  TextEditingController con = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Chat'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const VoiceNote(),
                //   ),
                // );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                );
              },
              child: Container(
                height: h * 0.1,
                width: w * 0.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber,
                    border: Border.all(
                      color: Colors.black,
                      width: 5,
                    )),
                child: const Center(
                  child: Text(
                    "Voice Note",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: GestureDetector(
              onTap: () async {
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>    const ImagePickerForGallery()));
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> const MultipleImage()));
                // Navigator.push(context, MaterialPageRoute(builder: (context)=> const UxPickerVIew()));
                //  Navigator.push(
                //    context,
                //    MaterialPageRoute(
                //      builder: (context) => const TBCSmallScreen(),
                //    ),
                //  );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NewTimerScreen(),
                  ),
                );
                // FilePickerResult? result = await FilePicker.platform
                //     .pickFiles(
                //     allowMultiple: true,
                //     type: FileType.image);
                // print(result!.files.length);
              },
              child: Container(
                height: h * 0.1,
                width: w * 0.5,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 5)),
                child: const Center(
                  child: Text(
                    "Multiple Image",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
          // Expanded(
          //   child: ListView.builder(
          //       itemCount: list.length,
          //       itemBuilder: (_, pos) {
          //         return Column(
          //           children: [
          //         Container(
          //               decoration: BoxDecoration(
          //                 borderRadius: const BorderRadius.only(
          //                     bottomLeft: Radius.circular(22),
          //                     bottomRight: Radius.circular(5),
          //                     topRight: Radius.circular(22),
          //                     topLeft: Radius.circular(22)),
          //                 border: Border.all(color: Colors.redAccent, width: 1),
          //               ),
          //               height: h * 0.1,
          //               // width: w * 0.7,
          //               child: VoiceMessage(
          //                 noiseCount: 10,
          //                 meBgColor: Colors.black,
          //                 meFgColor: Colors.blue,
          //                 mePlayIconColor: Colors.white,
          //                 audioSrc: list[pos],
          //                 played: false,
          //                 // To show played badge or not.
          //                 me: true,
          //                 // Set message side.
          //                 onPlay: () {}, // Do something when voice played.
          //               ),
          //             ),
          //
          //             const SizedBox(
          //               height: 20,
          //             ),
          //           ],
          //         );
          //       }),
          // ),
          // ChatComposer(
          //   controller: con,
          //   onReceiveText: (str) {
          //     setState(() {
          //       list.add(str!);
          //       con.text = '';
          //       print(str);
          //     });
          //   },
          //   onRecordEnd: (path) {
          //     setState(() {
          //       list.add(path!);
          //       print(path);
          //     });
          //   },
          //   textPadding: EdgeInsets.zero,
          //   leading: const  SizedBox(
          //     height: 20,
          //     width: 15,
          //   ),
          //   actions: [
          //     CupertinoButton(
          //       padding: EdgeInsets.zero,
          //       child: const Icon(
          //         Icons.attach_file_rounded,
          //         size: 25,
          //         color: Colors.grey,
          //       ),
          //       onPressed: () {},
          //     ),
          //     CupertinoButton(
          //       padding: EdgeInsets.zero,
          //       child: const Icon(
          //         Icons.camera_alt_rounded,
          //         size: 25,
          //         color: Colors.grey,
          //       ),
          //       onPressed: () {},
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
