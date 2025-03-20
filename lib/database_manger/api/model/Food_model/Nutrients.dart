class Nutrients {
  Nutrients({
      this.enerckcal, 
      this.procnt, 
      this.fat, 
      this.chocdf, 
      this.fibtg,});

  Nutrients.fromJson(dynamic json) {
    enerckcal = json['ENERC_KCAL'];
    procnt = json['PROCNT'];
    fat = json['FAT'];
    chocdf = json['CHOCDF'];
    fibtg = json['FIBTG'];
  }
  num? enerckcal;
  num? procnt;
  num? fat;
  num? chocdf;
  num? fibtg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ENERC_KCAL'] = enerckcal;
    map['PROCNT'] = procnt;
    map['FAT'] = fat;
    map['CHOCDF'] = chocdf;
    map['FIBTG'] = fibtg;
    return map;
  }

}