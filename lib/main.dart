import 'package:demotimer/UI/excercise_screen.dart';
import 'package:flutter/material.dart';

import 'UI/chat_audio/chat_record.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     // home: ExcerciseScreen(),
      home: const ChatRecordAudio(),
    );
  }
}
