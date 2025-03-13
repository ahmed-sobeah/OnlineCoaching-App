import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class WorkoutDm{
  static WorkoutDm? currentUser;
  static const String collectionName = 'workout';
  String id;
  String videoId;
  String workoutTitle;
  int? sets;
  int? reps;
  int? workoutDurationSec;
  int? workoutDurationMin;
  int? restSec;
  int? restMin;
  DateTime dateTime;
  WorkoutDm({required this.id, required this.videoId,required this.workoutTitle,  required this.dateTime,this.sets, this.reps, this.workoutDurationSec,this.workoutDurationMin, this.restSec,this.restMin});
  Map<String, dynamic> toFireStore()=>
      {
        'id' : id,
        'videoId' : videoId,
        'workoutTitle' : workoutTitle,
        'sets': sets,
        'reps':reps,
        'workoutDurationSec':workoutDurationSec,
        'workoutDurationMin':workoutDurationMin,
        'restSec': restSec,
        'restMin': restMin,
        'dateTime': dateTime,
      };
  WorkoutDm.fromFireStore(Map<String,dynamic> data): this(
    id: data['id'],
    videoId: data['videoId'],
    workoutTitle: data['workoutTitle'],
    sets: data['sets'],
    reps: data['reps'],
    workoutDurationSec: data['workoutDurationSec'],
    workoutDurationMin: data['workoutDurationMin'],
    restSec: data['restSec'],
    restMin: data['restMin'],
    dateTime: data['dateTime'].toDate(),
  );

}