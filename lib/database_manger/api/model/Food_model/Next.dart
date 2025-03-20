class Next {
  Next({
      this.href, 
      this.title,});

  Next.fromJson(dynamic json) {
    href = json['href'];
    title = json['title'];
  }
  String? href;
  String? title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['href'] = href;
    map['title'] = title;
    return map;
  }

}