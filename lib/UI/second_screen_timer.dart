import 'dart:async';
import 'package:flutter/material.dart';

import '../constant.dart';
import 'home_page.dart';

class CustomTimer extends StatefulWidget {
  const CustomTimer({Key? key}) : super(key: key);

  @override
  _CustomTimerState createState() => _CustomTimerState();
}

class _CustomTimerState extends State<CustomTimer> {
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
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
          onPressed: () {
            isTimeStart.value = true;

            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
                (route) => false);
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_timerText),
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
        Navigator.pop(context);
          // Navigator.pushAndRemoveUntil(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => const HomeScreen(),
          //     ),
          //         (route) => false);
        }

      });
    });
  }
}
