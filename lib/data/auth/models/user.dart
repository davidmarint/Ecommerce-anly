import 'dart:convert';

import 'package:ecommerce_anly/domain/auth/entity/user.dart';

class UserModel {
final  String ? userId;
final  String ? firstName;
final  String ? lastName;
final  String ? email;
final String image;
final  int ? gener;

  UserModel({
     this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.image,
    required this.gener
  });


 Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'image': image,
      'gender': gener,
    };
  }

    factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
     // userId: map['userId'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      email: map['email'] as String,
      image: map['image'] ?? '',
      gener: map['gener'] as int,
    );
  }
  

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension UserXModel on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      userId: userId,
      firstName: firstName,
      lastName: lastName, 
      email: email, 
      image: image, 
      gender: gener
    );
  }
}
