import 'Address.dart';
import 'Company.dart';

class UserModel {
  UserModel({
      this.id, 
      this.name, 
      this.username, 
      this.email, 
      this.address, 
      this.phone, 
      this.website, 
      this.company,});

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
    phone = json['phone'];
    website = json['website'];
    company = json['company'] != null ? Company.fromJson(json['company']) : null;
  }
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['username'] = username;
    map['email'] = email;
    if (address != null) {
      map['address'] = address.toJson();
    }
    map['phone'] = phone;
    map['website'] = website;
    if (company != null) {
      map['company'] = company.toJson();
    }
    return map;
  }

}