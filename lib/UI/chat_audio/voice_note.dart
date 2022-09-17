
import 'package:demotimer/UI/chat_audio/record_button.dart';
import 'package:demotimer/constant.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'audio_player_message.dart';

class VoiceNote extends StatefulWidget {
  const VoiceNote({Key? key}) : super(key: key);

  @override
  State<VoiceNote> createState() => _VoiceNoteState();
}

class _VoiceNoteState extends State<VoiceNote> {
  String? audioPath;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Voice Note"),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            width: w,
            color: Colors.white,
            child: Center(
              child: AudioRecorder(
                onStop: (String path) {
                  audioPath = path;
                  print(audioPath);
                },
              ),
            ),
          ),
          ValueListenableBuilder(
              valueListenable: myVoiceData,
              builder: (
                context,
                v,
                c,
              ) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: myVoiceData.value.length,
                    itemBuilder: (_, pos) {
                      return AudioPlayerMessage(
                        source:
                            AudioSource.uri(Uri.parse(myVoiceData.value[pos])),
                      );
                    });
              }),
        ],
      ),
    );
  }
}
