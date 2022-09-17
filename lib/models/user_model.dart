import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User extends Equatable{

  final String? id;
  final String fullName;
  final String email;
  final String address;
  final String city;
  final String country;
  final String zipCode;

  const User({
    this.id,
    this.fullName = '',
    this.email ='',
    this.city = '',
    this.country = '',
    this.address = '',
    this.zipCode = ''
});

  User copyWith({
     String? id,
    String? fullName,
     String? email,
    String? address,
    String? city,
    String? country,
     String? zipCode
}){
    return User(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      address: address ?? this.address,
      city: city ?? this.city,
      country: country ?? this.country,
      zipCode: zipCode ?? this.zipCode
    );
  }

  factory User.fromSnapshot(DocumentSnapshot snapshot){
    return User(
      id: snapshot.id,
      fullName: snapshot['fullName'],
      email: snapshot['email'],
      city: snapshot['city'],
      address: snapshot['address'],
      country: snapshot['country'],
      zipCode: snapshot['zipCode']
    );
  }

  Map<String, dynamic> toDocument(){
    return {
      'fullName': fullName,
      'email': email,
      'address': address,
      'city':city,
      'country':country,
      'zipCode':zipCode
  };
}
  @override
  List<Object?> get props => [id, fullName,email,address,city,country,zipCode];

}