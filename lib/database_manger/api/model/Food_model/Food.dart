import 'Nutrients.dart';

class Food {
  Food({
      this.foodId, 
      this.label, 
      this.knownAs, 
      this.nutrients, 
      this.category, 
      this.categoryLabel, 
      this.image,});

  Food.fromJson(dynamic json) {
    foodId = json['foodId'];
    label = json['label'];
    knownAs = json['knownAs'];
    nutrients = json['nutrients'] != null ? Nutrients.fromJson(json['nutrients']) : null;
    category = json['category'];
    categoryLabel = json['categoryLabel'];
    image = json['image'];
  }
  String? foodId;
  String? label;
  String? knownAs;
  Nutrients? nutrients;
  String? category;
  String? categoryLabel;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['foodId'] = foodId;
    map['label'] = label;
    map['knownAs'] = knownAs;
    if (nutrients != null) {
      map['nutrients'] = nutrients?.toJson();
    }
    map['category'] = category;
    map['categoryLabel'] = categoryLabel;
    map['image'] = image;
    return map;
  }

}