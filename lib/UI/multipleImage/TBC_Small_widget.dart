import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TBCSmallScreen extends StatefulWidget {
  const TBCSmallScreen({Key? key}) : super(key: key);

  @override
  State<TBCSmallScreen> createState() => _TBCSmallScreenState();
}

class _TBCSmallScreenState extends State<TBCSmallScreen> {
  DateFormat? format;
  String day = "";

  @override
  void initState() {
    DateTime currentDate = DateTime.now();
    format = DateFormat('EEEEE');
    String date = format!.format(currentDate);
    day = date;
    debugPrint(date);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TBC"),
      ),
      body: Column(
        children: [
          ///--------------- This  Code Are Show Hide  Button for Every Friday -------
          day == "Friday"
              ? Center(
                  child: Container(
                    width: 374,
                    height: 97,
                    decoration: BoxDecoration(
                        color: const Color(0xff1a9ce3),
                        borderRadius: BorderRadius.circular(7)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Checking unlocked!",
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: -0.567,
                                )),
                            Text("honest reflection of how your week went. ",
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  color: Color(0xffbae1f6),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                )
              : const SizedBox(),
          Container(
            margin: const EdgeInsets.all(19),
            decoration: BoxDecoration(
              color: const Color(0x261a9ce3),
              borderRadius: BorderRadius.circular(7),
            ),
            height: h * 0.2,
            width: w,
            child: Column(
              children: [
                const Expanded(
                  child: Text(
                    "Strength Hyper \nHybrid Phase 1",
                    style: TextStyle(
                      fontFamily: 'BankGothic',
                      color: Color(0xff1a9ce3),
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      letterSpacing: 0.888889,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 165,
                      height: 60,
                      decoration: BoxDecoration(
                          color: const Color(0xffc3e8fd),
                          borderRadius: BorderRadius.circular(7)),
                      child: Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("My Programs",
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  color: Color(0xff020210),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 188,
                      height: 60,
                      decoration: BoxDecoration(
                          color: const Color(0xff1a9ce3),
                          borderRadius: BorderRadius.circular(7)),
                      child: Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Progress",
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.play_arrow_rounded,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //***************** New Part ********************//
          const SizedBox(height: 30,),
          GestureDetector(
            onTap: (){
              BottomSheet(
                enableDrag: true,
                builder: (context){
                return  Container(
                  child: Text("123456"),
                );
              }, onClosing: () {  },);
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                color: Colors.yellowAccent,
                shape: BoxShape.circle
              ),

            ),
          ),
        ],
      ),
    );
  }
}
