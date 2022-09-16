import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainTimer extends StatefulWidget {
  const MainTimer({Key? key}) : super(key: key);

  @override
  State<MainTimer> createState() => _MainTimerState();
}

class _MainTimerState extends State<MainTimer> {


  ValueNotifier<bool> startAndStopTimer =  ValueNotifier(false);

  String timeString = "00:00:00";
  Stopwatch stopwatch = Stopwatch();
    Timer? timer;

  void start(){
    stopwatch.start();
    timer = Timer.periodic(const Duration(seconds: 1), update);
  }

  void update(Timer t){
    if(stopwatch.isRunning){
      setState(() {
        timeString =
            "${(stopwatch.elapsed.inHours).toString().padLeft(2, "0")}:${(stopwatch.elapsed.inMinutes % 60).toString().padLeft(2, "0")}:${(stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, "0")}";
      });
    }
  }

  void stop(){
    setState(() {
      timer!.cancel();
      stopwatch.stop();
    });

  }

  void reset(){
    timer!.cancel();
    stopwatch.reset();
    setState((){
      timeString = "00:00:00";

    });
    stopwatch.stop();
  }


  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      height: h * 0.1,
      width: w,
      decoration: BoxDecoration(
        color: const Color(0xff3b4245),
        borderRadius: BorderRadius.circular(35),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ValueListenableBuilder(valueListenable: startAndStopTimer, builder: (context,v,c){
              return startAndStopTimer.value == true ?  GestureDetector(
                onTap: (){
                  startAndStopTimer.value = false;
                  startAndStopTimer.notifyListeners();
                  print(startAndStopTimer.value);
                  start();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xffbbdbd2), width: 3)),
                  child: const Center(
                    child: Icon(
                        CupertinoIcons.play_arrow_solid,
                      color: Color(0xffbbdbd2),
                      size: 30,
                    ),
                  ),
                ),
              ) : GestureDetector(
                onTap: (){
                  startAndStopTimer.value = true;
                  startAndStopTimer.notifyListeners();
                  print(startAndStopTimer.value);
                  stop();

                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xffbbdbd2), width: 3)),
                  child: const Center(
                    child: Icon(
                      CupertinoIcons.pause_fill,
                      color: Color(0xffbbdbd2),
                      size: 30,
                    ),
                  ),
                ),
              ) ;

            }),


             Text(
              "$timeString",
              style: TextStyle(
                  color: Color(0xffbbdbd2),
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),

            GestureDetector(
              onTap: (){
                startAndStopTimer.value = true;
                startAndStopTimer.notifyListeners();
                reset();
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xffbbdbd2), width: 3)),
                child: const Center(
                  child: Icon(
                    Icons.stop,
                    color: Color(0xffbbdbd2),
                    size: 35,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
