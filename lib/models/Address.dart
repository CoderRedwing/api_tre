import 'Geo.dart';

class Address {
  Address({
      required this.street,
      required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,});

  Address.fromJson(dynamic json) {
    street = json['street'];
    suite = json['suite'];
    city = json['city'];
    zipcode = json['zipcode'];
    geo = (json['geo'] != null ? Geo.fromJson(json['geo']) : null)!;
  }
 late String street;
  late String suite;
  late String city;
  late String zipcode;
  late Geo geo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['street'] = street;
    map['suite'] = suite;
    map['city'] = city;
    map['zipcode'] = zipcode;
    if (geo != null) {
      map['geo'] = geo.toJson();
    }
    return map;
  }

}