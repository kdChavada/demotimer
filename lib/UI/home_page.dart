import 'dart:async';

import 'package:demotimer/UI/second_screen_timer.dart';
import 'package:demotimer/constant.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _maxSeconds = int.parse(storeTime);
  int _currentSecond = 0;
  late Timer _timer;

  String get _timerText {
    const secondsPerMinute = 60;
    final secondsLeft = _maxSeconds - _currentSecond;

    final formattedMinutesLeft =
        (secondsLeft ~/ secondsPerMinute).toString().padLeft(2, '0');
    final formattedSecondsLeft =
        (secondsLeft % secondsPerMinute).toString().padLeft(2, '0');

    print('--$formattedMinutesLeft : $formattedSecondsLeft');

    storeTime = "$formattedSecondsLeft";

    return '$formattedMinutesLeft : $formattedSecondsLeft';
  }

  @override
  void initState() {
    super.initState();
    isTimeStart.value == true ?   _startTimer() : null;
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Demo Timer"),
        actions: [
          isTimeStart.value == true ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: _timerText == "00 : 00"
                ? Container()
                : GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CustomTimer(),
                        ),
                      );
                    },
                    child: Center(
                        child: Text(
                      _timerText,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    )),
                  ),
          ) :  Container(),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            // ElevatedButton(
            //   onPressed: () {
            //     debugPrint("$storeTime");
            //     print(isTimeStart.value);
            //   },
            //   child: const Text("Timer Value"),
            // ),
            //
            //
            // Text("$storeTime"),

            ValueListenableBuilder(
                valueListenable: isTimeStart,
                builder: (context, k, d) {
                  return isTimeStart.value == false
                      ? GestureDetector(
                          onTap: () {
                            storeTime == "00" ? "60" : storeTime;
                            isTimeStart.value = false;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CustomTimer(),
                              ),
                            );
                          },
                          child: Container(
                            height: 50,
                            width: w,
                            margin: const EdgeInsets.all(20),
                            color: Colors.blue,
                            child: const Center(
                              child: Text(
                                "REST",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      : Container();
                }),
          ],
        ),
      ),
    );
  }

  void _startTimer() {
    const duration = Duration(seconds: 1);
    _timer = Timer.periodic(duration, (Timer timer) {
      setState(() {
        _currentSecond = timer.tick;
        if (timer.tick >= _maxSeconds) {
          timer.cancel();
          isTimeStart.value = false;
          // Navigator.pushAndRemoveUntil(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => const HomeScreen(),
          //     ),
          //         (route) => false);
        }
        ;
      });
    });
  }
}
