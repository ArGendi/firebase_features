class User{
  String? name;
  int? age;
  String? gender;

  User({this.name, this.age, this.gender});
  User.fromMap(Map<String, dynamic> map){
    name = map['name'];
    age = map['age'];
    gender = map['gender'];
  }

  Map<String,dynamic> toMap(){
    return {
      'name': name,
      'age': age,
      'gender': gender,
    };
  }
}