

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
  ExerciseListModel exerciseListModel = ExerciseListModel();


  ExerciseRepo exerciseRepo =  ExerciseRepo();

  apiCall() async {
    exerciseListModel = await exerciseRepo.getResistanceData();
    setState(() {});
  }

  @override
  void initState() {
    apiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double  w =   MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("RESISTANCE"),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: exerciseListModel.exercise?.length,
          itemBuilder: (context, i) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: exerciseListModel.exercise![i].sub?.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
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
                      SizedBox(
                        width: w*0.3,
                        child: Text(
                         textScaleFactor: 0.85,
                        "${exerciseListModel.exercise![i].sub![index].name}"),
                      ),
                    ]),
                  ),
                );
              },
            );
          }),
    );
  }
}
