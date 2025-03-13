class ExerciseDm{
  static ExerciseDm? currentUser;
  static const String collectionName = 'exercise';
  String id;
  String videoId;
  String workoutTitle;
  int? sets;
  int? reps;
  int? workoutDurationSec;
  int? workoutDurationMin;
  int? restSec;
  int? restMin;
  ExerciseDm({required this.id, required this.videoId,required this.workoutTitle,  this.sets, this.reps, this.workoutDurationSec,this.workoutDurationMin, this.restSec,this.restMin});
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
      };
  ExerciseDm.fromFireStore(Map<String,dynamic> data): this(
    id: data['id'],
    videoId: data['videoId'],
    workoutTitle: data['workoutTitle'],
    sets: data['sets'],
    reps: data['reps'],
    workoutDurationSec: data['workoutDurationSec'],
    workoutDurationMin: data['workoutDurationMin'],
    restSec: data['restSec'],
    restMin: data['restMin'],
  );
}