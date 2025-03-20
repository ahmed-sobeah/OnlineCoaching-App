import 'Hints.dart';
import 'Links.dart';

class FoodResponse {
  FoodResponse({
      this.text, 
      this.count, 
      this.parsed, 
      this.hints, 
      this.links,});

  FoodResponse.fromJson(dynamic json) {
    text = json['text'];
    count = json['count'];
    // if (json['parsed'] != null) {
    //   parsed = [];
    //   json['parsed'].forEach((v) {
    //     parsed?.add(Dynamic.fromJson(v));
    //   });
    // }
    if (json['hints'] != null) {
      hints = [];
      json['hints'].forEach((v) {
        hints?.add(Hints.fromJson(v));
      });
    }
    links = json['_links'] != null ? Links.fromJson(json['_links']) : null;
  }
  String? text;
  num? count;
  List<dynamic>? parsed;
  List<Hints>? hints;
  Links? links;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['count'] = count;
    if (parsed != null) {
      map['parsed'] = parsed?.map((v) => v.toJson()).toList();
    }
    if (hints != null) {
      map['hints'] = hints?.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      map['_links'] = links?.toJson();
    }
    return map;
  }

}