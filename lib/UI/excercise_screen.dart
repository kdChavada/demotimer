import 'package:demotimer/UI/home_page.dart';
import 'package:demotimer/model/excercise_model.dart';
import 'package:demotimer/repo/resistance_details.dart';
import 'package:flutter/material.dart';

class ExcerciseScreen extends StatefulWidget {
  ExcerciseScreen({Key? key}) : super(key: key);

  @override
  State<ExcerciseScreen> createState() => _ExcerciseScreenState();
}

class _ExcerciseScreenState extends State<ExcerciseScreen> {
  late ExerciseListModel exerciseListModel;
  apiCall() async {
    exerciseListModel = await ExerciseRepo().getResistanceData();
  }

  @override
  void initState() {
    apiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: exerciseListModel.exercise?.length,
          itemBuilder: (context, i) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: exerciseListModel.exercise![i].sub?.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Card(
                    child: Row(children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.network(
                            "${exerciseListModel.exercise![i].sub![index].thumb}"),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                          "${exerciseListModel.exercise![i].sub![index].name}"),
                    ]),
                  ),
                );
              },
            );
          }),
    );
  }
}
