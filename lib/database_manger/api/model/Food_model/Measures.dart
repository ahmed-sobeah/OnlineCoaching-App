class Measures {
  Measures({
      this.uri, 
      this.label, 
      this.weight,});

  Measures.fromJson(dynamic json) {
    uri = json['uri'];
    label = json['label'];
    weight = json['weight'];
  }
  String? uri;
  String? label;
  num? weight;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uri'] = uri;
    map['label'] = label;
    map['weight'] = weight;
    return map;
  }

}