class ExerciseListModel {
  bool? success;
  String? message;
  bool? isOldEntry;
  int? userDailyId;
  List<Eqipment>? eqipment;
  Warmup? warmup;
  List<Mobility>? mobility;
  List<Exercise>? exercise;
  List<Cardio>? cardio;

  ExerciseListModel(
      {this.success,
      this.message,
      this.isOldEntry,
      this.userDailyId,
      this.eqipment,
      this.warmup,
      this.mobility,
      this.exercise,
      this.cardio});

  ExerciseListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    isOldEntry = json['isOldEntry'];
    userDailyId = json['user_daily_id'];
    if (json['eqipment'] != null) {
      eqipment = <Eqipment>[];
      json['eqipment'].forEach((v) {
        eqipment!.add(new Eqipment.fromJson(v));
      });
    }
    warmup =
        json['warmup'] != null ? new Warmup.fromJson(json['warmup']) : null;
    if (json['mobility'] != null) {
      mobility = <Mobility>[];
      json['mobility'].forEach((v) {
        mobility!.add(new Mobility.fromJson(v));
      });
    }
    if (json['exercise'] != null) {
      exercise = <Exercise>[];
      json['exercise'].forEach((v) {
        exercise!.add(new Exercise.fromJson(v));
      });
    }
    if (json['cardio'] != null) {
      cardio = <Cardio>[];
      json['cardio'].forEach((v) {
        cardio!.add(new Cardio.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['isOldEntry'] = this.isOldEntry;
    data['user_daily_id'] = this.userDailyId;
    if (this.eqipment != null) {
      data['eqipment'] = this.eqipment!.map((v) => v.toJson()).toList();
    }
    if (this.warmup != null) {
      data['warmup'] = this.warmup!.toJson();
    }
    if (this.mobility != null) {
      data['mobility'] = this.mobility!.map((v) => v.toJson()).toList();
    }
    if (this.exercise != null) {
      data['exercise'] = this.exercise!.map((v) => v.toJson()).toList();
    }
    if (this.cardio != null) {
      data['cardio'] = this.cardio!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Eqipment {
  List<EquipmentList>? equipmentList;

  Eqipment({this.equipmentList});

  Eqipment.fromJson(Map<String, dynamic> json) {
    if (json['equipment_list'] != null) {
      equipmentList = <EquipmentList>[];
      json['equipment_list'].forEach((v) {
        equipmentList!.add(new EquipmentList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.equipmentList != null) {
      data['equipment_list'] =
          this.equipmentList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EquipmentList {
  int? id;
  String? name;
  String? image;

  EquipmentList({this.id, this.name, this.image});

  EquipmentList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class Warmup {
  int? id;
  String? title;
  String? duration;
  String? typeOfCardio;
  String? thumb;
  EquipmentList? eqipment;
  int? set;
  int? completedSets;
  bool? isCardioCompleted;
  String? work;
  String? workUnit;
  String? workRpe;
  String? rest;
  String? restUnit;
  String? restRpe;
  String? low;
  String? lowRpe;
  String? mod;
  String? modRpe;
  String? high;
  String? highRpe;
  String? rpe;

  Warmup(
      {this.id,
      this.title,
      this.duration,
      this.typeOfCardio,
      this.thumb,
      this.eqipment,
      this.set,
      this.completedSets,
      this.isCardioCompleted,
      this.work,
      this.workUnit,
      this.workRpe,
      this.rest,
      this.restUnit,
      this.restRpe,
      this.low,
      this.lowRpe,
      this.mod,
      this.modRpe,
      this.high,
      this.highRpe,
      this.rpe});

  Warmup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    duration = json['duration'];
    typeOfCardio = json['type_of_cardio'];
    thumb = json['thumb'];
    eqipment = json['eqipment'] != null
        ? new EquipmentList.fromJson(json['eqipment'])
        : null;
    set = json['set'];
    completedSets = json['completed_sets'];
    isCardioCompleted = json['is_cardio_completed'];
    work = json['work'];
    workUnit = json['work_unit'];
    workRpe = json['work_rpe'];
    rest = json['rest'];
    restUnit = json['rest_unit'];
    restRpe = json['rest_rpe'];
    low = json['low'];
    lowRpe = json['low_rpe'];
    mod = json['mod'];
    modRpe = json['mod_rpe'];
    high = json['high'];
    highRpe = json['high_rpe'];
    rpe = json['rpe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['duration'] = this.duration;
    data['type_of_cardio'] = this.typeOfCardio;
    data['thumb'] = this.thumb;
    if (this.eqipment != null) {
      data['eqipment'] = this.eqipment!.toJson();
    }
    data['set'] = this.set;
    data['completed_sets'] = this.completedSets;
    data['is_cardio_completed'] = this.isCardioCompleted;
    data['work'] = this.work;
    data['work_unit'] = this.workUnit;
    data['work_rpe'] = this.workRpe;
    data['rest'] = this.rest;
    data['rest_unit'] = this.restUnit;
    data['rest_rpe'] = this.restRpe;
    data['low'] = this.low;
    data['low_rpe'] = this.lowRpe;
    data['mod'] = this.mod;
    data['mod_rpe'] = this.modRpe;
    data['high'] = this.high;
    data['high_rpe'] = this.highRpe;
    data['rpe'] = this.rpe;
    return data;
  }
}

class Mobility {
  String? title;
  List<Sub>? sub;

  Mobility({this.title, this.sub});

  Mobility.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['sub'] != null) {
      sub = <Sub>[];
      json['sub'].forEach((v) {
        sub!.add(new Sub.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.sub != null) {
      data['sub'] = this.sub!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sub {
  int? id;
  String? name;
  bool? isMobilitySet;
  bool? isSuperSet;
  bool? isWorkoutRevertable;
  bool? isLogRemoveEnabled;
  String? duration;
  String? durationTiming;
  int? sets;
  int? completedSets;
  bool? isExerciseCompleted;
  List<PreviousLogs>? previousLogs;
  String? reps;
  int? tempo;
  String? rest;
  int? restTime;
  int? rpe;
  String? thumb;
  String? video;

  Sub(
      {this.id,
      this.name,
      this.isMobilitySet,
      this.isSuperSet,
      this.isWorkoutRevertable,
      this.isLogRemoveEnabled,
      this.duration,
      this.durationTiming,
      this.sets,
      this.completedSets,
      this.isExerciseCompleted,
      this.previousLogs,
      this.reps,
      this.tempo,
      this.rest,
      this.restTime,
      this.rpe,
      this.thumb,
      this.video});

  Sub.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isMobilitySet = json['is_mobility_set'];
    isSuperSet = json['is_super_set'];
    isWorkoutRevertable = json['is_workout_revertable'];
    isLogRemoveEnabled = json['isLogRemoveEnabled'];
    duration = json['duration'];
    durationTiming = json['duration_timing'];
    sets = json['sets'];
    completedSets = json['completed_sets'];
    isExerciseCompleted = json['is_exercise_completed'];
    if (json['previous_logs'] != null) {
      previousLogs = <PreviousLogs>[];
      json['previous_logs'].forEach((v) {
        previousLogs!.add(new PreviousLogs.fromJson(v));
      });
    }
    reps = json['reps'];
    tempo = json['tempo'];
    rest = json['rest'];
    restTime = json['rest_time'];
    rpe = json['rpe'];
    thumb = json['thumb'];
    video = json['video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['is_mobility_set'] = this.isMobilitySet;
    data['is_super_set'] = this.isSuperSet;
    data['is_workout_revertable'] = this.isWorkoutRevertable;
    data['isLogRemoveEnabled'] = this.isLogRemoveEnabled;
    data['duration'] = this.duration;
    data['duration_timing'] = this.durationTiming;
    data['sets'] = this.sets;
    data['completed_sets'] = this.completedSets;
    data['is_exercise_completed'] = this.isExerciseCompleted;
    if (this.previousLogs != null) {
      data['previous_logs'] =
          this.previousLogs!.map((v) => v.toJson()).toList();
    }
    data['reps'] = this.reps;
    data['tempo'] = this.tempo;
    data['rest'] = this.rest;
    data['rest_time'] = this.restTime;
    data['rpe'] = this.rpe;
    data['thumb'] = this.thumb;
    data['video'] = this.video;
    return data;
  }
}

class PreviousLogs {
  String? previousLogWeight;
  String? previousLogNote;

  PreviousLogs({this.previousLogWeight, this.previousLogNote});

  PreviousLogs.fromJson(Map<String, dynamic> json) {
    previousLogWeight = json['previous_log_weight'];
    previousLogNote = json['previous_log_note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['previous_log_weight'] = this.previousLogWeight;
    data['previous_log_note'] = this.previousLogNote;
    return data;
  }
}

class Cardio {
  int? id;
  String? title;
  String? duration;
  String? thumb;
  String? typeOfCardio;
  EquipmentList? eqipment;
  int? set;
  int? completedSets;
  bool? isCardioCompleted;
  int? work;
  String? workUnit;
  String? workRpe;
  int? rest;
  String? restUnit;
  String? restRpe;
  String? low;
  String? lowRpe;
  String? mod;
  String? modRpe;
  String? high;
  String? highRpe;
  String? rpe;

  Cardio(
      {this.id,
      this.title,
      this.duration,
      this.thumb,
      this.typeOfCardio,
      this.eqipment,
      this.set,
      this.completedSets,
      this.isCardioCompleted,
      this.work,
      this.workUnit,
      this.workRpe,
      this.rest,
      this.restUnit,
      this.restRpe,
      this.low,
      this.lowRpe,
      this.mod,
      this.modRpe,
      this.high,
      this.highRpe,
      this.rpe});

  Cardio.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    duration = json['duration'];
    thumb = json['thumb'];
    typeOfCardio = json['type_of_cardio'];
    eqipment = json['eqipment'] != null
        ? new EquipmentList.fromJson(json['eqipment'])
        : null;
    set = json['set'];
    completedSets = json['completed_sets'];
    isCardioCompleted = json['is_cardio_completed'];
    work = json['work'];
    workUnit = json['work_unit'];
    workRpe = json['work_rpe'];
    rest = json['rest'];
    restUnit = json['rest_unit'];
    restRpe = json['rest_rpe'];
    low = json['low'];
    lowRpe = json['low_rpe'];
    mod = json['mod'];
    modRpe = json['mod_rpe'];
    high = json['high'];
    highRpe = json['high_rpe'];
    rpe = json['rpe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['duration'] = this.duration;
    data['thumb'] = this.thumb;
    data['type_of_cardio'] = this.typeOfCardio;
    if (this.eqipment != null) {
      data['eqipment'] = this.eqipment!.toJson();
    }
    data['set'] = this.set;
    data['completed_sets'] = this.completedSets;
    data['is_cardio_completed'] = this.isCardioCompleted;
    data['work'] = this.work;
    data['work_unit'] = this.workUnit;
    data['work_rpe'] = this.workRpe;
    data['rest'] = this.rest;
    data['rest_unit'] = this.restUnit;
    data['rest_rpe'] = this.restRpe;
    data['low'] = this.low;
    data['low_rpe'] = this.lowRpe;
    data['mod'] = this.mod;
    data['mod_rpe'] = this.modRpe;
    data['high'] = this.high;
    data['high_rpe'] = this.highRpe;
    data['rpe'] = this.rpe;
    return data;
  }
}

class Exercise {
  String? title;
  List<Sub>? sub;

  Exercise({this.title, this.sub});

  Exercise.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['sub'] != null) {
      sub = <Sub>[];
      json['sub'].forEach((v) {
        sub!.add(new Sub.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.sub != null) {
      data['sub'] = this.sub!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
