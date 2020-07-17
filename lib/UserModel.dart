class UserModel{
  num id;
  String email;
  String firstName;
  String lastName;
  String avatar;
  bool isSelected;
  UserModel({this.id, this.email, this.firstName, this.lastName, this.avatar,this.isSelected = false});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as num,
      email: json['email'] as String,
      avatar: json['avatar'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
    );
  }

}

