/// success : true
/// clientData : [{"company":{"name":"ABC Company","personName":"John Doe","mobileNumber":"1234567890","alternativeMobileNumber":"9876543210","gstNumber":"GST123456789","email":"johndoe@example.com","website":"https://example.com"},"shippingAddress":{"addressLine":"123 Main Street","city":"Cityville","state":"State","country":"Country","postalCode":"12345"},"billingAddress":{"addressLine":"456 Elm Street","city":"Townville","state":"State","country":"Country","postalCode":"54321"},"_id":"64982012288ae8234a7c1768","clientPhoto":"https://example.com/clientphoto.jpg","userId":"6482806606241ddc30afff33","__v":0},{"company":{"name":"ABC Company","personName":"John Doe","mobileNumber":"1234567890","alternativeMobileNumber":"9876543210","gstNumber":"GST123456789","email":"johndoe@example.com","website":"https://example.com"},"shippingAddress":{"addressLine":"123 Main Street","city":"Cityville","state":"State","country":"Country","postalCode":"12345"},"billingAddress":{"addressLine":"456 Elm Street","city":"Townville","state":"State","country":"Country","postalCode":"54321"},"_id":"649823a2dc01cdee08c27905","clientPhoto":"https://example.com/clientphoto.jpg","userId":"6482806606241ddc30afff33","__v":0}]

class GetAllClients {
  GetAllClients({
      bool? success, 
      List<ClientData>? clientData,}){
    _success = success;
    _clientData = clientData;
}

  GetAllClients.fromJson(dynamic json) {
    _success = json['success'];
    if (json['clientData'] != null) {
      _clientData = [];
      json['clientData'].forEach((v) {
        _clientData?.add(ClientData.fromJson(v));
      });
    }
  }
  bool? _success;
  List<ClientData>? _clientData;
GetAllClients copyWith({  bool? success,
  List<ClientData>? clientData,
}) => GetAllClients(  success: success ?? _success,
  clientData: clientData ?? _clientData,
);
  bool? get success => _success;
  List<ClientData>? get clientData => _clientData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_clientData != null) {
      map['clientData'] = _clientData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// company : {"name":"ABC Company","personName":"John Doe","mobileNumber":"1234567890","alternativeMobileNumber":"9876543210","gstNumber":"GST123456789","email":"johndoe@example.com","website":"https://example.com"}
/// shippingAddress : {"addressLine":"123 Main Street","city":"Cityville","state":"State","country":"Country","postalCode":"12345"}
/// billingAddress : {"addressLine":"456 Elm Street","city":"Townville","state":"State","country":"Country","postalCode":"54321"}
/// _id : "64982012288ae8234a7c1768"
/// clientPhoto : "https://example.com/clientphoto.jpg"
/// userId : "6482806606241ddc30afff33"
/// __v : 0

class ClientData {
  ClientData({
      Company? company, 
      ShippingAddress? shippingAddress, 
      BillingAddress? billingAddress, 
      String? id, 
      String? clientPhoto, 
      String? userId, 
      num? v,}){
    _company = company;
    _shippingAddress = shippingAddress;
    _billingAddress = billingAddress;
    _id = id;
    _clientPhoto = clientPhoto;
    _userId = userId;
    _v = v;
}

  ClientData.fromJson(dynamic json) {
    _company = json['company'] != null ? Company.fromJson(json['company']) : null;
    _shippingAddress = json['shippingAddress'] != null ? ShippingAddress.fromJson(json['shippingAddress']) : null;
    _billingAddress = json['billingAddress'] != null ? BillingAddress.fromJson(json['billingAddress']) : null;
    _id = json['_id'];
    _clientPhoto = json['clientPhoto'];
    _userId = json['userId'];
    _v = json['__v'];
  }
  Company? _company;
  ShippingAddress? _shippingAddress;
  BillingAddress? _billingAddress;
  String? _id;
  String? _clientPhoto;
  String? _userId;
  num? _v;
ClientData copyWith({  Company? company,
  ShippingAddress? shippingAddress,
  BillingAddress? billingAddress,
  String? id,
  String? clientPhoto,
  String? userId,
  num? v,
}) => ClientData(  company: company ?? _company,
  shippingAddress: shippingAddress ?? _shippingAddress,
  billingAddress: billingAddress ?? _billingAddress,
  id: id ?? _id,
  clientPhoto: clientPhoto ?? _clientPhoto,
  userId: userId ?? _userId,
  v: v ?? _v,
);
  Company? get company => _company;
  ShippingAddress? get shippingAddress => _shippingAddress;
  BillingAddress? get billingAddress => _billingAddress;
  String? get id => _id;
  String? get clientPhoto => _clientPhoto;
  String? get userId => _userId;
  num? get v => _v;

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
    return map;
  }

}

/// addressLine : "456 Elm Street"
/// city : "Townville"
/// state : "State"
/// country : "Country"
/// postalCode : "54321"

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

}

/// addressLine : "123 Main Street"
/// city : "Cityville"
/// state : "State"
/// country : "Country"
/// postalCode : "12345"

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

}

/// name : "ABC Company"
/// personName : "John Doe"
/// mobileNumber : "1234567890"
/// alternativeMobileNumber : "9876543210"
/// gstNumber : "GST123456789"
/// email : "johndoe@example.com"
/// website : "https://example.com"

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

}