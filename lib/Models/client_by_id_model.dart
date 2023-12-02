/// success : true
/// clientData : {"company":{"name":"jvkv","personName":"hxj","mobileNumber":"5656568868","alternativeMobileNumber":"5356565686","gstNumber":"yudufhfhfjfjjfj","email":"bansikathiriya65@gmail.com","website":"https.com"},"shippingAddress":{"addressLine":"ch cu","city":"611","state":"222","country":"7","postalCode":"123444"},"billingAddress":{"addressLine":"ch cu","city":"611","state":"222","country":"7","postalCode":"123444"},"_id":"65190f8c725e43398d190c55","clientPhoto":null,"userId":"65185847725e43398d190b2d","__v":0,"shippingAddressDetails":{"city":"Icolo e Bengo","state":"Luanda Province","country":"Angola"},"billingAddressDetails":{"city":"Icolo e Bengo","state":"Luanda Province","country":"Angola"}}

class ClientByIdModel {
  ClientByIdModel({
    bool? success,
    ClientData? clientData,}){
    _success = success;
    _clientData = clientData;
  }

  ClientByIdModel.fromJson(dynamic json) {
    _success = json['success'];
    _clientData = json['clientData'] != null ? ClientData.fromJson(json['clientData']) : null;
  }
  bool? _success;
  ClientData? _clientData;
  ClientByIdModel copyWith({  bool? success,
    ClientData? clientData,
  }) => ClientByIdModel(  success: success ?? _success,
    clientData: clientData ?? _clientData,
  );
  bool? get success => _success;
  ClientData? get clientData => _clientData;

  set sClientData(ClientData value) {
    _clientData = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_clientData != null) {
      map['clientData'] = _clientData?.toJson();
    }
    return map;
  }

}

/// company : {"name":"jvkv","personName":"hxj","mobileNumber":"5656568868","alternativeMobileNumber":"5356565686","gstNumber":"yudufhfhfjfjjfj","email":"bansikathiriya65@gmail.com","website":"https.com"}
/// shippingAddress : {"addressLine":"ch cu","city":"611","state":"222","country":"7","postalCode":"123444"}
/// billingAddress : {"addressLine":"ch cu","city":"611","state":"222","country":"7","postalCode":"123444"}
/// _id : "65190f8c725e43398d190c55"
/// clientPhoto : null
/// userId : "65185847725e43398d190b2d"
/// __v : 0
/// shippingAddressDetails : {"city":"Icolo e Bengo","state":"Luanda Province","country":"Angola"}
/// billingAddressDetails : {"city":"Icolo e Bengo","state":"Luanda Province","country":"Angola"}

class ClientData {
  ClientData({
    Company? company,
    ShippingAddress? shippingAddress,
    BillingAddress? billingAddress,
    String? id,
    dynamic clientPhoto,
    String? userId,
    num? v,
    ShippingAddressDetails? shippingAddressDetails,
    BillingAddressDetails? billingAddressDetails,}){
    _company = company;
    _shippingAddress = shippingAddress;
    _billingAddress = billingAddress;
    _id = id;
    _clientPhoto = clientPhoto;
    _userId = userId;
    _v = v;
    _shippingAddressDetails = shippingAddressDetails;
    _billingAddressDetails = billingAddressDetails;
  }

  ClientData.fromJson(dynamic json) {
    _company = json['company'] != null ? Company.fromJson(json['company']) : null;
    _shippingAddress = json['shippingAddress'] != null ? ShippingAddress.fromJson(json['shippingAddress']) : null;
    _billingAddress = json['billingAddress'] != null ? BillingAddress.fromJson(json['billingAddress']) : null;
    _id = json['_id'];
    _clientPhoto = json['clientPhoto'];
    _userId = json['userId'];
    _v = json['__v'];
    _shippingAddressDetails = json['shippingAddressDetails'] != null ? ShippingAddressDetails.fromJson(json['shippingAddressDetails']) : null;
    _billingAddressDetails = json['billingAddressDetails'] != null ? BillingAddressDetails.fromJson(json['billingAddressDetails']) : null;
  }
  Company? _company;
  ShippingAddress? _shippingAddress;
  BillingAddress? _billingAddress;
  String? _id;
  dynamic _clientPhoto;
  String? _userId;
  num? _v;
  ShippingAddressDetails? _shippingAddressDetails;
  BillingAddressDetails? _billingAddressDetails;
  ClientData copyWith({  Company? company,
    ShippingAddress? shippingAddress,
    BillingAddress? billingAddress,
    String? id,
    dynamic clientPhoto,
    String? userId,
    num? v,
    ShippingAddressDetails? shippingAddressDetails,
    BillingAddressDetails? billingAddressDetails,
  }) => ClientData(  company: company ?? _company,
    shippingAddress: shippingAddress ?? _shippingAddress,
    billingAddress: billingAddress ?? _billingAddress,
    id: id ?? _id,
    clientPhoto: clientPhoto ?? _clientPhoto,
    userId: userId ?? _userId,
    v: v ?? _v,
    shippingAddressDetails: shippingAddressDetails ?? _shippingAddressDetails,
    billingAddressDetails: billingAddressDetails ?? _billingAddressDetails,
  );
  Company? get company => _company;
  ShippingAddress? get shippingAddress => _shippingAddress;
  BillingAddress? get billingAddress => _billingAddress;
  String? get id => _id;
  dynamic get clientPhoto => _clientPhoto;
  String? get userId => _userId;
  num? get v => _v;
  ShippingAddressDetails? get shippingAddressDetails => _shippingAddressDetails;
  BillingAddressDetails? get billingAddressDetails => _billingAddressDetails;

  set scompany(Company value) {
    _company = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_company != null) {
      map['company'] = _company?.toJson();
    }
    if (_shippingAddress != null) {
      map['shippingAddress'] = _shippingAddress?.toJson();
    }
    if (_billingAddress != null) {
      map['billingAddress'] = _billingAddress?.toJson();
    }
    map['_id'] = _id;
    map['clientPhoto'] = _clientPhoto;
    map['userId'] = _userId;
    map['__v'] = _v;
    if (_shippingAddressDetails != null) {
      map['shippingAddressDetails'] = _shippingAddressDetails?.toJson();
    }
    if (_billingAddressDetails != null) {
      map['billingAddressDetails'] = _billingAddressDetails?.toJson();
    }
    return map;
  }

  set sshippingAddress(ShippingAddress value) {
    _shippingAddress = value;
  }

  set sbillingAddress(BillingAddress value) {
    _billingAddress = value;
  }

  set sshippingAddressDetails(ShippingAddressDetails value) {
    _shippingAddressDetails = value;
  }

  set sbillingAddressDetails(BillingAddressDetails value) {
    _billingAddressDetails = value;
  }
}

/// city : "Icolo e Bengo"
/// state : "Luanda Province"
/// country : "Angola"

class BillingAddressDetails {
  BillingAddressDetails({
    String? city,
    String? state,
    String? country,}){
    _city = city;
    _state = state;
    _country = country;
  }

  BillingAddressDetails.fromJson(dynamic json) {
    _city = json['city'];
    _state = json['state'];
    _country = json['country'];
  }
  String? _city;
  String? _state;
  String? _country;
  BillingAddressDetails copyWith({  String? city,
    String? state,
    String? country,
  }) => BillingAddressDetails(  city: city ?? _city,
    state: state ?? _state,
    country: country ?? _country,
  );
  String? get city => _city;
  String? get state => _state;
  String? get country => _country;


  set scity(String value) {
    _city = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city'] = _city;
    map['state'] = _state;
    map['country'] = _country;
    return map;
  }

  set sstate(String value) {
    _state = value;
  }

  set scountry(String value) {
    _country = value;
  }
}

/// city : "Icolo e Bengo"
/// state : "Luanda Province"
/// country : "Angola"

class ShippingAddressDetails {
  ShippingAddressDetails({
    String? city,
    String? state,
    String? country,}){
    _city = city;
    _state = state;
    _country = country;
  }


  set scity(String value) {
    _city = value;
  }

  ShippingAddressDetails.fromJson(dynamic json) {
    _city = json['city'];
    _state = json['state'];
    _country = json['country'];
  }
  String? _city;
  String? _state;
  String? _country;
  ShippingAddressDetails copyWith({  String? city,
    String? state,
    String? country,
  }) => ShippingAddressDetails(  city: city ?? _city,
    state: state ?? _state,
    country: country ?? _country,
  );
  String? get city => _city;
  String? get state => _state;
  String? get country => _country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city'] = _city;
    map['state'] = _state;
    map['country'] = _country;
    return map;
  }

  set sstate(String value) {
    _state = value;
  }

  set scountry(String value) {
    _country = value;
  }
}

/// addressLine : "ch cu"
/// city : "611"
/// state : "222"
/// country : "7"
/// postalCode : "123444"

class BillingAddress {
  BillingAddress({
    String? addressLine,
    String? city,
    String? state,
    String? country,
    String? postalCode,}){
    _addressLine = addressLine;
    _city = city;
    _state = state;
    _country = country;
    _postalCode = postalCode;
  }

  BillingAddress.fromJson(dynamic json) {
    _addressLine = json['addressLine'];
    _city = json['city'];
    _state = json['state'];
    _country = json['country'];
    _postalCode = json['postalCode'];
  }
  String? _addressLine;
  String? _city;
  String? _state;

  set saddressLine(String value) {
    _addressLine = value;
  }

  String? _country;
  String? _postalCode;
  BillingAddress copyWith({  String? addressLine,
    String? city,
    String? state,
    String? country,
    String? postalCode,
  }) => BillingAddress(  addressLine: addressLine ?? _addressLine,
    city: city ?? _city,
    state: state ?? _state,
    country: country ?? _country,
    postalCode: postalCode ?? _postalCode,
  );
  String? get addressLine => _addressLine;
  String? get city => _city;
  String? get state => _state;
  String? get country => _country;
  String? get postalCode => _postalCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['addressLine'] = _addressLine;
    map['city'] = _city;
    map['state'] = _state;
    map['country'] = _country;
    map['postalCode'] = _postalCode;
    return map;
  }

  set scity(String value) {
    _city = value;
  }

  set sstate(String value) {
    _state = value;
  }

  set scountry(String value) {
    _country = value;
  }

  set spostalCode(String value) {
    _postalCode = value;
  }
}

/// addressLine : "ch cu"
/// city : "611"
/// state : "222"
/// country : "7"
/// postalCode : "123444"

class ShippingAddress {
  ShippingAddress({
    String? addressLine,
    String? city,
    String? state,
    String? country,
    String? postalCode,}){
    _addressLine = addressLine;
    _city = city;
    _state = state;
    _country = country;
    _postalCode = postalCode;
  }

  set saddressLine(String value) {
    _addressLine = value;
  }

  ShippingAddress.fromJson(dynamic json) {
    _addressLine = json['addressLine'];
    _city = json['city'];
    _state = json['state'];
    _country = json['country'];
    _postalCode = json['postalCode'];
  }
  String? _addressLine;
  String? _city;
  String? _state;
  String? _country;
  String? _postalCode;
  ShippingAddress copyWith({  String? addressLine,
    String? city,
    String? state,
    String? country,
    String? postalCode,
  }) => ShippingAddress(  addressLine: addressLine ?? _addressLine,
    city: city ?? _city,
    state: state ?? _state,
    country: country ?? _country,
    postalCode: postalCode ?? _postalCode,
  );
  String? get addressLine => _addressLine;
  String? get city => _city;
  String? get state => _state;
  String? get country => _country;
  String? get postalCode => _postalCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['addressLine'] = _addressLine;
    map['city'] = _city;
    map['state'] = _state;
    map['country'] = _country;
    map['postalCode'] = _postalCode;
    return map;
  }

  set scity(String value) {
    _city = value;
  }

  set sstate(String value) {
    _state = value;
  }

  set scountry(String value) {
    _country = value;
  }

  set spostalCode(String value) {
    _postalCode = value;
  }

}

/// name : "jvkv"
/// personName : "hxj"
/// mobileNumber : "5656568868"
/// alternativeMobileNumber : "5356565686"
/// gstNumber : "yudufhfhfjfjjfj"
/// email : "bansikathiriya65@gmail.com"
/// website : "https.com"

class Company {
  Company({
    String? name,
    String? personName,
    String? mobileNumber,
    String? alternativeMobileNumber,
    String? gstNumber,
    String? email,
    String? website,}){
    _name = name;
    _personName = personName;
    _mobileNumber = mobileNumber;
    _alternativeMobileNumber = alternativeMobileNumber;
    _gstNumber = gstNumber;
    _email = email;
    _website = website;
  }

  Company.fromJson(dynamic json) {
    _name = json['name'];
    _personName = json['personName'];
    _mobileNumber = json['mobileNumber'];
    _alternativeMobileNumber = json['alternativeMobileNumber'];
    _gstNumber = json['gstNumber'];
    _email = json['email'];
    _website = json['website'];
  }
  String? _name;
  String? _personName;
  String? _mobileNumber;
  String? _alternativeMobileNumber;
  String? _gstNumber;
  String? _email;
  String? _website;
  Company copyWith({  String? name,
    String? personName,
    String? mobileNumber,
    String? alternativeMobileNumber,
    String? gstNumber,
    String? email,
    String? website,
  }) => Company(  name: name ?? _name,
    personName: personName ?? _personName,
    mobileNumber: mobileNumber ?? _mobileNumber,
    alternativeMobileNumber: alternativeMobileNumber ?? _alternativeMobileNumber,
    gstNumber: gstNumber ?? _gstNumber,
    email: email ?? _email,
    website: website ?? _website,
  );
  String? get name => _name;

  set sname(String value) {
    _name = value;
  }

  String? get personName => _personName;
  String? get mobileNumber => _mobileNumber;
  String? get alternativeMobileNumber => _alternativeMobileNumber;
  String? get gstNumber => _gstNumber;
  String? get email => _email;
  String? get website => _website;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['personName'] = _personName;
    map['mobileNumber'] = _mobileNumber;
    map['alternativeMobileNumber'] = _alternativeMobileNumber;
    map['gstNumber'] = _gstNumber;
    map['email'] = _email;
    map['website'] = _website;
    return map;
  }

  set spersonName(String value) {
    _personName = value;
  }

  set smobileNumber(String value) {
    _mobileNumber = value;
  }

  set salternativeMobileNumber(String value) {
    _alternativeMobileNumber = value;
  }

  set sgstNumber(String value) {
    _gstNumber = value;
  }

  set semail(String value) {
    _email = value;
  }

  set swebsite(String value) {
    _website = value;
  }
}