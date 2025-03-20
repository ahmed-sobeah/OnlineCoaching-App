import 'Next.dart';

class Links {
  Links({
      this.next,});

  Links.fromJson(dynamic json) {
    next = json['next'] != null ? Next.fromJson(json['next']) : null;
  }
  Next? next;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (next != null) {
      map['next'] = next?.toJson();
    }
    return map;
  }

}