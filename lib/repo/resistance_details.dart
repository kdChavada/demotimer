import 'package:demotimer/dummy_data.dart';
import 'package:demotimer/model/excercise_model.dart';

class ExerciseRepo {
  Future<ExerciseListModel> getResistanceData() async {
    return ExerciseListModel.fromJson(data);
  }
}
