// To parse this JSON data, do
//
//     final clientDataByIdModel = clientDataByIdModelFromJson(jsonString);

import 'dart:convert';

ClientDataByIdModel clientDataByIdModelFromJson(String str) => ClientDataByIdModel.fromJson(json.decode(str));

String clientDataByIdModelToJson(ClientDataByIdModel data) => json.encode(data.toJson());

class ClientDataByIdModel {
  bool? success;
  ClientDataById? clientDataById;

  ClientDataByIdModel({
    this.success,
    this.clientDataById,
  });

  factory ClientDataByIdModel.fromJson(Map<String, dynamic> json) => ClientDataByIdModel(
        success: json["success"],
        clientDataById: json["clientData"] == null ? null : ClientDataById.fromJson(json["clientData"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "clientData": clientDataById?.toJson(),
      };
}

class ClientDataById {
  Company? company;
  IngAddress? shippingAddress;
  IngAddress? billingAddress;
  String? id;
  dynamic clientPhoto;
  String? userId;
  int? v;

  ClientDataById({
    this.company,
    this.shippingAddress,
    this.billingAddress,
    this.id,
    this.clientPhoto,
    this.userId,
    this.v,
  });

  factory ClientDataById.fromJson(Map<String, dynamic> json) => ClientDataById(
        company: json["company"] == null ? null : Company.fromJson(json["company"]),
        shippingAddress: json["shippingAddress"] == null ? null : IngAddress.fromJson(json["shippingAddress"]),
        billingAddress: json["billingAddress"] == null ? null : IngAddress.fromJson(json["billingAddress"]),
        id: json["_id"],
        clientPhoto: json["clientPhoto"],
        userId: json["userId"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "company": company?.toJson(),
        "shippingAddress": shippingAddress?.toJson(),
        "billingAddress": billingAddress?.toJson(),
        "_id": id,
        "clientPhoto": clientPhoto,
        "userId": userId,
        "__v": v,
      };
}

class IngAddress {
  String? addressLine;
  String? city;
  String? state;
  String? country;
  String? postalCode;

  IngAddress({
    this.addressLine,
    this.city,
    this.state,
    this.country,
    this.postalCode,
  });

  factory IngAddress.fromJson(Map<String, dynamic> json) => IngAddress(
        addressLine: json["addressLine"] ?? "",
        city: json["city"] ?? "",
        state: json["state"] ?? "",
        country: json["country"] ?? "",
        postalCode: json["postalCode"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "addressLine": addressLine,
        "city": city,
        "state": state,
        "country": country,
        "postalCode": postalCode,
      };
}

class Company {
  String? name;
  String? personName;
  String? mobileNumber;
  String? alternativeMobileNumber;
  String? gstNumber;
  String? email;
  String? website;

  Company({
    this.name,
    this.personName,
    this.mobileNumber,
    this.alternativeMobileNumber,
    this.gstNumber,
    this.email,
    this.website,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"] ?? "",
        personName: json["personName"] ?? "",
        mobileNumber: json["mobileNumber"] ?? "",
        alternativeMobileNumber: json["alternativeMobileNumber"] ?? "",
        gstNumber: json["gstNumber"] ?? "",
        email: json["email"] ?? "",
        website: json["website"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "personName": personName,
        "mobileNumber": mobileNumber,
        "alternativeMobileNumber": alternativeMobileNumber,
        "gstNumber": gstNumber,
        "email": email,
        "website": website,
      };
}
