import 'Food.dart';
import 'Measures.dart';

class Hints {
  Hints({
      this.food, 
      this.measures,});

  Hints.fromJson(dynamic json) {
    food = json['food'] != null ? Food.fromJson(json['food']) : null;
    if (json['measures'] != null) {
      measures = [];
      json['measures'].forEach((v) {
        measures?.add(Measures.fromJson(v));
      });
    }
  }
  Food? food;
  List<Measures>? measures;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (food != null) {
      map['food'] = food?.toJson();
    }
    if (measures != null) {
      map['measures'] = measures?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}