/// data : [{"_id":"64ce40abd4494a584fc5b6a7","client":{"company":{"name":"testts","personName":"testets","mobileNumber":"2122121212","alternativeMobileNumber":"2121212121","gstNumber":"121nj2n1jn21j21","email":"tes@ads.com","website":"sajdnad.com"},"shippingAddress":{"addressLine":"sndsadandjddsdd","city":"2","state":"1","country":"3","postalCode":"123829"},"billingAddress":{"addressLine":"jadjadadsad","city":"2","state":"3","country":"2","postalCode":"218321"},"_id":"649851b3c6539a6f10b0dd90","clientPhoto":"","userId":"64981bb79c08770d6ef228b7","__v":0},"products":[{"product":"64a80e4bc7c08d1159ad34ed","quantity":1,"_id":"64ce40abd4494a584fc5b6a8"},{"product":"64ab9553802ef50a1f0f0831","quantity":2,"_id":"64ce40abd4494a584fc5b6a9"}],"estimationDate":"2023-08-04T18:30:00.000Z","currency":"₹","sign":"public/uploads/Estimationsign/admin-file-1691238571381.jpg","subTotal":34735.8,"discount":1828.2,"taxes":[{"percentage":"12","name":"CGST","amount":4168.296,"_id":"64ce40abd4494a584fc5b6aa"}],"estimationNo":"EST6","totalAmount":38904.096000000005,"userId":"64981bb79c08770d6ef228b7","__v":0}]

class GetAllEstimate {
  GetAllEstimate({
      List<Data>? data,}){
    _data = data;
}

  GetAllEstimate.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  List<Data>? _data;
GetAllEstimate copyWith({  List<Data>? data,
}) => GetAllEstimate(  data: data ?? _data,
);
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// _id : "64ce40abd4494a584fc5b6a7"
/// client : {"company":{"name":"testts","personName":"testets","mobileNumber":"2122121212","alternativeMobileNumber":"2121212121","gstNumber":"121nj2n1jn21j21","email":"tes@ads.com","website":"sajdnad.com"},"shippingAddress":{"addressLine":"sndsadandjddsdd","city":"2","state":"1","country":"3","postalCode":"123829"},"billingAddress":{"addressLine":"jadjadadsad","city":"2","state":"3","country":"2","postalCode":"218321"},"_id":"649851b3c6539a6f10b0dd90","clientPhoto":"","userId":"64981bb79c08770d6ef228b7","__v":0}
/// products : [{"product":"64a80e4bc7c08d1159ad34ed","quantity":1,"_id":"64ce40abd4494a584fc5b6a8"},{"product":"64ab9553802ef50a1f0f0831","quantity":2,"_id":"64ce40abd4494a584fc5b6a9"}]
/// estimationDate : "2023-08-04T18:30:00.000Z"
/// currency : "₹"
/// sign : "public/uploads/Estimationsign/admin-file-1691238571381.jpg"
/// subTotal : 34735.8
/// discount : 1828.2
/// taxes : [{"percentage":"12","name":"CGST","amount":4168.296,"_id":"64ce40abd4494a584fc5b6aa"}]
/// estimationNo : "EST6"
/// totalAmount : 38904.096000000005
/// userId : "64981bb79c08770d6ef228b7"
/// __v : 0

class Data {
  Data({
      String? id, 
      Client? client, 
      List<Products>? products, 
      String? estimationDate, 
      String? currency, 
      String? sign, 
      num? subTotal, 
      num? discount, 
      List<Taxes>? taxes, 
      String? estimationNo, 
      num? totalAmount, 
      String? userId, 
      num? v,}){
    _id = id;
    _client = client;
    _products = products;
    _estimationDate = estimationDate;
    _currency = currency;
    _sign = sign;
    _subTotal = subTotal;
    _discount = discount;
    _taxes = taxes;
    _estimationNo = estimationNo;
    _totalAmount = totalAmount;
    _userId = userId;
    _v = v;
}

  Data.fromJson(dynamic json) {
    _id = json['_id'];
    _client = json['client'] != null ? Client.fromJson(json['client']) : null;
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
    _estimationDate = json['estimationDate'];
    _currency = json['currency'];
    _sign = json['sign'];
    _subTotal = json['subTotal'];
    _discount = json['discount'];
    if (json['taxes'] != null) {
      _taxes = [];
      json['taxes'].forEach((v) {
        _taxes?.add(Taxes.fromJson(v));
      });
    }
    _estimationNo = json['estimationNo'];
    _totalAmount = json['totalAmount'];
    _userId = json['userId'];
    _v = json['__v'];
  }
  String? _id;
  Client? _client;
  List<Products>? _products;
  String? _estimationDate;
  String? _currency;
  String? _sign;
  num? _subTotal;
  num? _discount;
  List<Taxes>? _taxes;
  String? _estimationNo;
  num? _totalAmount;
  String? _userId;
  num? _v;
Data copyWith({  String? id,
  Client? client,
  List<Products>? products,
  String? estimationDate,
  String? currency,
  String? sign,
  num? subTotal,
  num? discount,
  List<Taxes>? taxes,
  String? estimationNo,
  num? totalAmount,
  String? userId,
  num? v,
}) => Data(  id: id ?? _id,
  client: client ?? _client,
  products: products ?? _products,
  estimationDate: estimationDate ?? _estimationDate,
  currency: currency ?? _currency,
  sign: sign ?? _sign,
  subTotal: subTotal ?? _subTotal,
  discount: discount ?? _discount,
  taxes: taxes ?? _taxes,
  estimationNo: estimationNo ?? _estimationNo,
  totalAmount: totalAmount ?? _totalAmount,
  userId: userId ?? _userId,
  v: v ?? _v,
);
  String? get id => _id;
  Client? get client => _client;
  List<Products>? get products => _products;
  String? get estimationDate => _estimationDate;
  String? get currency => _currency;
  String? get sign => _sign;
  num? get subTotal => _subTotal;
  num? get discount => _discount;
  List<Taxes>? get taxes => _taxes;
  String? get estimationNo => _estimationNo;
  num? get totalAmount => _totalAmount;
  String? get userId => _userId;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    if (_client != null) {
      map['client'] = _client?.toJson();
    }
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    map['estimationDate'] = _estimationDate;
    map['currency'] = _currency;
    map['sign'] = _sign;
    map['subTotal'] = _subTotal;
    map['discount'] = _discount;
    if (_taxes != null) {
      map['taxes'] = _taxes?.map((v) => v.toJson()).toList();
    }
    map['estimationNo'] = _estimationNo;
    map['totalAmount'] = _totalAmount;
    map['userId'] = _userId;
    map['__v'] = _v;
    return map;
  }

}

/// percentage : "12"
/// name : "CGST"
/// amount : 4168.296
/// _id : "64ce40abd4494a584fc5b6aa"

class Taxes {
  Taxes({
      String? percentage, 
      String? name, 
      num? amount, 
      String? id,}){
    _percentage = percentage;
    _name = name;
    _amount = amount;
    _id = id;
}

  Taxes.fromJson(dynamic json) {
    _percentage = json['percentage'];
    _name = json['name'];
    _amount = json['amount'];
    _id = json['_id'];
  }
  String? _percentage;
  String? _name;
  num? _amount;
  String? _id;
Taxes copyWith({  String? percentage,
  String? name,
  num? amount,
  String? id,
}) => Taxes(  percentage: percentage ?? _percentage,
  name: name ?? _name,
  amount: amount ?? _amount,
  id: id ?? _id,
);
  String? get percentage => _percentage;
  String? get name => _name;
  num? get amount => _amount;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['percentage'] = _percentage;
    map['name'] = _name;
    map['amount'] = _amount;
    map['_id'] = _id;
    return map;
  }

}

/// product : "64a80e4bc7c08d1159ad34ed"
/// quantity : 1
/// _id : "64ce40abd4494a584fc5b6a8"

class Products {
  Products({
      String? product, 
      num? quantity, 
      String? id,}){
    _product = product;
    _quantity = quantity;
    _id = id;
}

  Products.fromJson(dynamic json) {
    _product = json['product'];
    _quantity = json['quantity'];
    _id = json['_id'];
  }
  String? _product;
  num? _quantity;
  String? _id;
Products copyWith({  String? product,
  num? quantity,
  String? id,
}) => Products(  product: product ?? _product,
  quantity: quantity ?? _quantity,
  id: id ?? _id,
);
  String? get product => _product;
  num? get quantity => _quantity;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product'] = _product;
    map['quantity'] = _quantity;
    map['_id'] = _id;
    return map;
  }

}

/// company : {"name":"testts","personName":"testets","mobileNumber":"2122121212","alternativeMobileNumber":"2121212121","gstNumber":"121nj2n1jn21j21","email":"tes@ads.com","website":"sajdnad.com"}
/// shippingAddress : {"addressLine":"sndsadandjddsdd","city":"2","state":"1","country":"3","postalCode":"123829"}
/// billingAddress : {"addressLine":"jadjadadsad","city":"2","state":"3","country":"2","postalCode":"218321"}
/// _id : "649851b3c6539a6f10b0dd90"
/// clientPhoto : ""
/// userId : "64981bb79c08770d6ef228b7"
/// __v : 0

class Client {
  Client({
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

  Client.fromJson(dynamic json) {
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
Client copyWith({  Company? company,
  ShippingAddress? shippingAddress,
  BillingAddress? billingAddress,
  String? id,
  String? clientPhoto,
  String? userId,
  num? v,
}) => Client(  company: company ?? _company,
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

/// addressLine : "jadjadadsad"
/// city : "2"
/// state : "3"
/// country : "2"
/// postalCode : "218321"

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

/// addressLine : "sndsadandjddsdd"
/// city : "2"
/// state : "1"
/// country : "3"
/// postalCode : "123829"

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

/// name : "testts"
/// personName : "testets"
/// mobileNumber : "2122121212"
/// alternativeMobileNumber : "2121212121"
/// gstNumber : "121nj2n1jn21j21"
/// email : "tes@ads.com"
/// website : "sajdnad.com"

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