class UserDm{
  static UserDm? currentUser;
  static const String collectionName = 'user';
  String id;
  String fullName;
  String email;
  int age;
  int height;
  double weight;
  bool gender;
  int? cal;
  int? protein;
  int? fats;
  UserDm({required this.id, required this.fullName,required this.email, required this.age, required this.height, required this.weight, required this.gender,this.cal,this.protein, this.fats});
  Map<String, dynamic> toFireStore()=>
      {
        'id' : id,
        'fullName' : fullName,
        'email' : email,
        'age': age,
        'height':height,
        'weight':weight,
        'gender': gender,
        'cal' : cal,
        'protein' : protein,
        'fats':fats,
      };
  UserDm.fromFireStore(Map<String,dynamic> data): this(
    id: data['id'],
    fullName: data['fullName'],
    email: data['email'],
    age: data['age'],
    height: data['height'],
    weight: data['weight'],
    gender: data['gender'],
    cal: data['cal'],
    protein: data['protein'],
    fats: data['fats']
  );
}