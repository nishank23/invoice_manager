/// userProfile : {"company":{"name":"test","owner":"test","mobileNumber":"1424919419","alternativeMobileNumber":"1419419229","gstNumber":"412414141414214","email":"41jj@.com","website":"11313.ocm"},"address":{"addressLine":"asdda","city":"131542","state":"4009","country":"101","postalCode":"395007"},"bank":{"bankName":"qqeqew","accountNumber":"e","ifscCode":"qeqeqwewqeqeqq"},"_id":"64981bf69c08770d6ef228ba","userId":"64981bb79c08770d6ef228b7","userPhoto":"public/uploads/userphoto/admin-file-1691504236180.jpg","__v":0}

class GetProfileModel {
  GetProfileModel({
      UserProfile? userProfile,}){
    _userProfile = userProfile;
}

  GetProfileModel.fromJson(dynamic json) {
    _userProfile = json['userProfile'] != null ? UserProfile.fromJson(json['userProfile']) : null;
  }
  UserProfile? _userProfile;
GetProfileModel copyWith({  UserProfile? userProfile,
}) => GetProfileModel(  userProfile: userProfile ?? _userProfile,
);
  UserProfile? get userProfile => _userProfile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_userProfile != null) {
      map['userProfile'] = _userProfile?.toJson();
    }
    return map;
  }

}

/// company : {"name":"test","owner":"test","mobileNumber":"1424919419","alternativeMobileNumber":"1419419229","gstNumber":"412414141414214","email":"41jj@.com","website":"11313.ocm"}
/// address : {"addressLine":"asdda","city":"131542","state":"4009","country":"101","postalCode":"395007"}
/// bank : {"bankName":"qqeqew","accountNumber":"e","ifscCode":"qeqeqwewqeqeqq"}
/// _id : "64981bf69c08770d6ef228ba"
/// userId : "64981bb79c08770d6ef228b7"
/// userPhoto : "public/uploads/userphoto/admin-file-1691504236180.jpg"
/// __v : 0

class UserProfile {
  UserProfile({
      Company? company, 
      Address? address, 
      Bank? bank, 
      String? id, 
      String? userId, 
      String? userPhoto, 
      num? v,}){
    _company = company;
    _address = address;
    _bank = bank;
    _id = id;
    _userId = userId;
    _userPhoto = userPhoto;
    _v = v;
}

  UserProfile.fromJson(dynamic json) {
    _company = json['company'] != null ? Company.fromJson(json['company']) : null;
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
    _bank = json['bank'] != null ? Bank.fromJson(json['bank']) : null;
    _id = json['_id'];
    _userId = json['userId'];
    _userPhoto = json['userPhoto'];
    _v = json['__v'];
  }
  Company? _company;
  Address? _address;
  Bank? _bank;
  String? _id;
  String? _userId;
  String? _userPhoto;
  num? _v;
UserProfile copyWith({  Company? company,
  Address? address,
  Bank? bank,
  String? id,
  String? userId,
  String? userPhoto,
  num? v,
}) => UserProfile(  company: company ?? _company,
  address: address ?? _address,
  bank: bank ?? _bank,
  id: id ?? _id,
  userId: userId ?? _userId,
  userPhoto: userPhoto ?? _userPhoto,
  v: v ?? _v,
);
  Company? get company => _company;
  Address? get address => _address;
  Bank? get bank => _bank;
  String? get id => _id;
  String? get userId => _userId;
  String? get userPhoto => _userPhoto;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_company != null) {
      map['company'] = _company?.toJson();
    }
    if (_address != null) {
      map['address'] = _address?.toJson();
    }
    if (_bank != null) {
      map['bank'] = _bank?.toJson();
    }
    map['_id'] = _id;
    map['userId'] = _userId;
    map['userPhoto'] = _userPhoto;
    map['__v'] = _v;
    return map;
  }

}

/// bankName : "qqeqew"
/// accountNumber : "e"
/// ifscCode : "qeqeqwewqeqeqq"

class Bank {
  Bank({
      String? bankName, 
      String? accountNumber, 
      String? ifscCode,}){
    _bankName = bankName;
    _accountNumber = accountNumber;
    _ifscCode = ifscCode;
}

  Bank.fromJson(dynamic json) {
    _bankName = json['bankName'];
    _accountNumber = json['accountNumber'];
    _ifscCode = json['ifscCode'];
  }
  String? _bankName;
  String? _accountNumber;
  String? _ifscCode;
Bank copyWith({  String? bankName,
  String? accountNumber,
  String? ifscCode,
}) => Bank(  bankName: bankName ?? _bankName,
  accountNumber: accountNumber ?? _accountNumber,
  ifscCode: ifscCode ?? _ifscCode,
);
  String? get bankName => _bankName;
  String? get accountNumber => _accountNumber;
  String? get ifscCode => _ifscCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bankName'] = _bankName;
    map['accountNumber'] = _accountNumber;
    map['ifscCode'] = _ifscCode;
    return map;
  }

}

/// addressLine : "asdda"
/// city : "131542"
/// state : "4009"
/// country : "101"
/// postalCode : "395007"

class Address {
  Address({
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

  Address.fromJson(dynamic json) {
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
Address copyWith({  String? addressLine,
  String? city,
  String? state,
  String? country,
  String? postalCode,
}) => Address(  addressLine: addressLine ?? _addressLine,
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

/// name : "test"
/// owner : "test"
/// mobileNumber : "1424919419"
/// alternativeMobileNumber : "1419419229"
/// gstNumber : "412414141414214"
/// email : "41jj@.com"
/// website : "11313.ocm"

class Company {
  Company({
      String? name, 
      String? owner, 
      String? mobileNumber, 
      String? alternativeMobileNumber, 
      String? gstNumber, 
      String? email, 
      String? website,}){
    _name = name;
    _owner = owner;
    _mobileNumber = mobileNumber;
    _alternativeMobileNumber = alternativeMobileNumber;
    _gstNumber = gstNumber;
    _email = email;
    _website = website;
}

  Company.fromJson(dynamic json) {
    _name = json['name'];
    _owner = json['owner'];
    _mobileNumber = json['mobileNumber'];
    _alternativeMobileNumber = json['alternativeMobileNumber'];
    _gstNumber = json['gstNumber'];
    _email = json['email'];
    _website = json['website'];
  }
  String? _name;
  String? _owner;
  String? _mobileNumber;
  String? _alternativeMobileNumber;
  String? _gstNumber;
  String? _email;
  String? _website;
Company copyWith({  String? name,
  String? owner,
  String? mobileNumber,
  String? alternativeMobileNumber,
  String? gstNumber,
  String? email,
  String? website,
}) => Company(  name: name ?? _name,
  owner: owner ?? _owner,
  mobileNumber: mobileNumber ?? _mobileNumber,
  alternativeMobileNumber: alternativeMobileNumber ?? _alternativeMobileNumber,
  gstNumber: gstNumber ?? _gstNumber,
  email: email ?? _email,
  website: website ?? _website,
);
  String? get name => _name;
  String? get owner => _owner;
  String? get mobileNumber => _mobileNumber;
  String? get alternativeMobileNumber => _alternativeMobileNumber;
  String? get gstNumber => _gstNumber;
  String? get email => _email;
  String? get website => _website;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['owner'] = _owner;
    map['mobileNumber'] = _mobileNumber;
    map['alternativeMobileNumber'] = _alternativeMobileNumber;
    map['gstNumber'] = _gstNumber;
    map['email'] = _email;
    map['website'] = _website;
    return map;
  }

}