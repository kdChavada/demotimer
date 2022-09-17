import 'dart:async';

import 'package:flutter/material.dart';

class NewTimerScreenDemo extends StatefulWidget {
  const NewTimerScreenDemo({Key? key}) : super(key: key);

  @override
  State<NewTimerScreenDemo> createState() => _NewTimerScreenDemoState();
}

class _NewTimerScreenDemoState extends State<NewTimerScreenDemo> {
  ValueNotifier<bool> startAndStopTimer = ValueNotifier(false);

  String timeString = "00:00:00";
  Stopwatch stopwatch = Stopwatch();
  Timer? timer;

  void start() {
    stopwatch.start();
    timer = Timer.periodic(const Duration(seconds: 1), update);
  }

  void update(Timer t) {
    if (stopwatch.isRunning) {
      setState(() {
        timeString =
            "${(stopwatch.elapsed.inHours).toString().padLeft(2, "0")}:${(stopwatch.elapsed.inMinutes % 60).toString().padLeft(2, "0")}:${(stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, "0")}";
      });
    }
  }

  void stop() {
    setState(() {
      timer!.cancel();
      stopwatch.stop();
    });
  }

  void reset() {
    timer!.cancel();
    stopwatch.reset();
    setState(() {
      timeString = "00:00:00";
    });
    stopwatch.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            timeString,
            style: const TextStyle(
                color: Color(0xffbbdbd2),
                fontSize: 30,
                fontWeight: FontWeight.w600),
          ),
          ValueListenableBuilder(
              valueListenable: startAndStopTimer,
              builder: (context, k, d) {
                return startAndStopTimer.value == true
                    ? ElevatedButton(
                        onPressed: () {
                          startAndStopTimer.value = false;
                          startAndStopTimer.notifyListeners();
                          start();
                        },
                        child: const Text("Start"),
                      )
                    : const SizedBox();
              }),
          ValueListenableBuilder(
              valueListenable: startAndStopTimer,
              builder: (context, k, d) {
                return startAndStopTimer.value == false
                    ? ElevatedButton(
                        onPressed: () {
                          startAndStopTimer.value = true;
                          startAndStopTimer.notifyListeners();
                          stop();
                        },
                        child: const Text(
                          "Stop",
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    : const SizedBox();
              }),
        ],
      ),
    );
  }
}
