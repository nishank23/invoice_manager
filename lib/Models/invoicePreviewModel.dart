/// invoice : {"_id":"6508559d725e43398d190a91","client":{"company":{"name":"estimateClient","personName":"estimateClint","mobileNumber":"9825164241","alternativeMobileNumber":"9826161616","gstNumber":"ABABBABABABABAB","email":"TEST.COM","website":"TES.COM"},"_id":"64f5c87914cd176e971b4072","clientPhoto":null,"userId":"64e88d53f4a1d4b8d186394a","__v":0},"shippingAddress":{"addressLine":"teste addres","city":"134096","state":"4030","country":"101","postalCode":"395007"},"billingAddress":{"addressLine":"teste addres","city":"Surat","state":"Gujarat","country":"India","postalCode":"395007"},"products":[{"product":null,"quantity":1,"_id":"6508559d725e43398d190a92"}],"dueDate":"2023-09-11T00:00:00.000Z","invoiceDate":"2023-09-11T00:00:00.000Z","currency":"₹","currencyId":"101","sign":null,"subTotal":900,"itemTotal":1000,"discount":10,"discountType":0,"taxes":[{"percentage":"18","name":"CGST","amount":162,"_id":"6508559d725e43398d190a93"}],"estimationNo":"EST2","totalAmount":1062,"userId":"64e88d53f4a1d4b8d186394a","__v":0}
/// userprofile : {"pcompany":{"name":"tesett","owner":"eteetetet","mobileNumber":"9292929929","alternativeMobileNumber":"9399239292","gstNumber":"123193929999219","email":"test@gmail.com","website":"tutt.com"},"address":{"addressLine":"tetet","city":"Anand","state":"Gujarat","country":"India","postalCode":"395007"},"bank":{"bankName":"teette","accountNumber":"1291919919191991","ifscCode":"ahahahhha"},"_id":"64f5c55114cd176e971b4042","userId":"64e88d53f4a1d4b8d186394a","userPhoto":null,"__v":0}

class InvoicePreviewModel {
  InvoicePreviewModel({
      Invoice? invoice, 
      Userprofile? userprofile,}){
    _invoice = invoice;
    _userprofile = userprofile;
}

  InvoicePreviewModel.fromJson(dynamic json) {
    _invoice = json['invoice'] != null ? Invoice.fromJson(json['invoice']) : null;
    _userprofile = json['userprofile'] != null ? Userprofile.fromJson(json['userprofile']) : null;
  }
  Invoice? _invoice;
  Userprofile? _userprofile;
InvoicePreviewModel copyWith({  Invoice? invoice,
  Userprofile? userprofile,
}) => InvoicePreviewModel(  invoice: invoice ?? _invoice,
  userprofile: userprofile ?? _userprofile,
);
  Invoice? get invoice => _invoice;
  Userprofile? get userprofile => _userprofile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_invoice != null) {
      map['invoice'] = _invoice?.toJson();
    }
    if (_userprofile != null) {
      map['userprofile'] = _userprofile?.toJson();
    }
    return map;
  }

}

/// pcompany : {"name":"tesett","owner":"eteetetet","mobileNumber":"9292929929","alternativeMobileNumber":"9399239292","gstNumber":"123193929999219","email":"test@gmail.com","website":"tutt.com"}
/// address : {"addressLine":"tetet","city":"Anand","state":"Gujarat","country":"India","postalCode":"395007"}
/// bank : {"bankName":"teette","accountNumber":"1291919919191991","ifscCode":"ahahahhha"}
/// _id : "64f5c55114cd176e971b4042"
/// userId : "64e88d53f4a1d4b8d186394a"
/// userPhoto : null
/// __v : 0

class Userprofile {
  Userprofile({
      Pcompany? pcompany, 
      Address? address, 
      Bank? bank, 
      String? id, 
      String? userId, 
      dynamic userPhoto, 
      num? v,}){
    _pcompany = pcompany;
    _address = address;
    _bank = bank;
    _id = id;
    _userId = userId;
    _userPhoto = userPhoto;
    _v = v;
}

  Userprofile.fromJson(dynamic json) {
    _pcompany = json['pcompany'] != null ? Pcompany.fromJson(json['pcompany']) : null;
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
    _bank = json['bank'] != null ? Bank.fromJson(json['bank']) : null;
    _id = json['_id'];
    _userId = json['userId'];
    _userPhoto = json['userPhoto'];
    _v = json['__v'];
  }
  Pcompany? _pcompany;
  Address? _address;
  Bank? _bank;
  String? _id;
  String? _userId;
  dynamic _userPhoto;
  num? _v;
Userprofile copyWith({  Pcompany? pcompany,
  Address? address,
  Bank? bank,
  String? id,
  String? userId,
  dynamic userPhoto,
  num? v,
}) => Userprofile(  pcompany: pcompany ?? _pcompany,
  address: address ?? _address,
  bank: bank ?? _bank,
  id: id ?? _id,
  userId: userId ?? _userId,
  userPhoto: userPhoto ?? _userPhoto,
  v: v ?? _v,
);
  Pcompany? get pcompany => _pcompany;
  Address? get address => _address;
  Bank? get bank => _bank;
  String? get id => _id;
  String? get userId => _userId;
  dynamic get userPhoto => _userPhoto;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_pcompany != null) {
      map['pcompany'] = _pcompany?.toJson();
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

/// bankName : "teette"
/// accountNumber : "1291919919191991"
/// ifscCode : "ahahahhha"

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

/// addressLine : "tetet"
/// city : "Anand"
/// state : "Gujarat"
/// country : "India"
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

/// name : "tesett"
/// owner : "eteetetet"
/// mobileNumber : "9292929929"
/// alternativeMobileNumber : "9399239292"
/// gstNumber : "123193929999219"
/// email : "test@gmail.com"
/// website : "tutt.com"

class Pcompany {
  Pcompany({
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

  Pcompany.fromJson(dynamic json) {
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
Pcompany copyWith({  String? name,
  String? owner,
  String? mobileNumber,
  String? alternativeMobileNumber,
  String? gstNumber,
  String? email,
  String? website,
}) => Pcompany(  name: name ?? _name,
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

/// _id : "6508559d725e43398d190a91"
/// client : {"company":{"name":"estimateClient","personName":"estimateClint","mobileNumber":"9825164241","alternativeMobileNumber":"9826161616","gstNumber":"ABABBABABABABAB","email":"TEST.COM","website":"TES.COM"},"_id":"64f5c87914cd176e971b4072","clientPhoto":null,"userId":"64e88d53f4a1d4b8d186394a","__v":0}
/// shippingAddress : {"addressLine":"teste addres","city":"134096","state":"4030","country":"101","postalCode":"395007"}
/// billingAddress : {"addressLine":"teste addres","city":"Surat","state":"Gujarat","country":"India","postalCode":"395007"}
/// products : [{"product":null,"quantity":1,"_id":"6508559d725e43398d190a92"}]
/// dueDate : "2023-09-11T00:00:00.000Z"
/// invoiceDate : "2023-09-11T00:00:00.000Z"
/// currency : "₹"
/// currencyId : "101"
/// sign : null
/// subTotal : 900
/// itemTotal : 1000
/// discount : 10
/// discountType : 0
/// taxes : [{"percentage":"18","name":"CGST","amount":162,"_id":"6508559d725e43398d190a93"}]
/// estimationNo : "EST2"
/// totalAmount : 1062
/// userId : "64e88d53f4a1d4b8d186394a"
/// __v : 0

class Invoice {
  Invoice({
      String? id, 
      Client? client, 
      ShippingAddress? shippingAddress, 
      BillingAddress? billingAddress, 
      List<Products>? products, 
      String? dueDate, 
      String? invoiceDate, 
      String? currency, 
      String? currencyId, 
      dynamic sign, 
      num? subTotal, 
      num? itemTotal, 
      num? discount, 
      num? discountType, 
      List<Taxes>? taxes, 
      String? estimationNo, 
      num? totalAmount, 
      String? userId, 
      num? v,}){
    _id = id;
    _client = client;
    _shippingAddress = shippingAddress;
    _billingAddress = billingAddress;
    _products = products;
    _dueDate = dueDate;
    _invoiceDate = invoiceDate;
    _currency = currency;
    _currencyId = currencyId;
    _sign = sign;
    _subTotal = subTotal;
    _itemTotal = itemTotal;
    _discount = discount;
    _discountType = discountType;
    _taxes = taxes;
    _estimationNo = estimationNo;
    _totalAmount = totalAmount;
    _userId = userId;
    _v = v;
}

  Invoice.fromJson(dynamic json) {
    _id = json['_id'];
    _client = json['client'] != null ? Client.fromJson(json['client']) : null;
    _shippingAddress = json['shippingAddress'] != null ? ShippingAddress.fromJson(json['shippingAddress']) : null;
    _billingAddress = json['billingAddress'] != null ? BillingAddress.fromJson(json['billingAddress']) : null;
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
    _dueDate = json['dueDate'];
    _invoiceDate = json['invoiceDate'];
    _currency = json['currency'];
    _currencyId = json['currencyId'];
    _sign = json['sign'];
    _subTotal = json['subTotal'];
    _itemTotal = json['itemTotal'];
    _discount = json['discount'];
    _discountType = json['discountType'];
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
  ShippingAddress? _shippingAddress;
  BillingAddress? _billingAddress;
  List<Products>? _products;
  String? _dueDate;
  String? _invoiceDate;
  String? _currency;
  String? _currencyId;
  dynamic _sign;
  num? _subTotal;
  num? _itemTotal;
  num? _discount;
  num? _discountType;
  List<Taxes>? _taxes;
  String? _estimationNo;
  num? _totalAmount;
  String? _userId;
  num? _v;
Invoice copyWith({  String? id,
  Client? client,
  ShippingAddress? shippingAddress,
  BillingAddress? billingAddress,
  List<Products>? products,
  String? dueDate,
  String? invoiceDate,
  String? currency,
  String? currencyId,
  dynamic sign,
  num? subTotal,
  num? itemTotal,
  num? discount,
  num? discountType,
  List<Taxes>? taxes,
  String? estimationNo,
  num? totalAmount,
  String? userId,
  num? v,
}) => Invoice(  id: id ?? _id,
  client: client ?? _client,
  shippingAddress: shippingAddress ?? _shippingAddress,
  billingAddress: billingAddress ?? _billingAddress,
  products: products ?? _products,
  dueDate: dueDate ?? _dueDate,
  invoiceDate: invoiceDate ?? _invoiceDate,
  currency: currency ?? _currency,
  currencyId: currencyId ?? _currencyId,
  sign: sign ?? _sign,
  subTotal: subTotal ?? _subTotal,
  itemTotal: itemTotal ?? _itemTotal,
  discount: discount ?? _discount,
  discountType: discountType ?? _discountType,
  taxes: taxes ?? _taxes,
  estimationNo: estimationNo ?? _estimationNo,
  totalAmount: totalAmount ?? _totalAmount,
  userId: userId ?? _userId,
  v: v ?? _v,
);
  String? get id => _id;
  Client? get client => _client;
  ShippingAddress? get shippingAddress => _shippingAddress;
  BillingAddress? get billingAddress => _billingAddress;
  List<Products>? get products => _products;
  String? get dueDate => _dueDate;
  String? get invoiceDate => _invoiceDate;
  String? get currency => _currency;
  String? get currencyId => _currencyId;
  dynamic get sign => _sign;
  num? get subTotal => _subTotal;
  num? get itemTotal => _itemTotal;
  num? get discount => _discount;
  num? get discountType => _discountType;
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
    if (_shippingAddress != null) {
      map['shippingAddress'] = _shippingAddress?.toJson();
    }
    if (_billingAddress != null) {
      map['billingAddress'] = _billingAddress?.toJson();
    }
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    map['dueDate'] = _dueDate;
    map['invoiceDate'] = _invoiceDate;
    map['currency'] = _currency;
    map['currencyId'] = _currencyId;
    map['sign'] = _sign;
    map['subTotal'] = _subTotal;
    map['itemTotal'] = _itemTotal;
    map['discount'] = _discount;
    map['discountType'] = _discountType;
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

/// percentage : "18"
/// name : "CGST"
/// amount : 162
/// _id : "6508559d725e43398d190a93"

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

/// product : null
/// quantity : 1
/// _id : "6508559d725e43398d190a92"

class Products {
  Products({
      dynamic product, 
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
  dynamic _product;
  num? _quantity;
  String? _id;
Products copyWith({  dynamic product,
  num? quantity,
  String? id,
}) => Products(  product: product ?? _product,
  quantity: quantity ?? _quantity,
  id: id ?? _id,
);
  dynamic get product => _product;
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

/// addressLine : "teste addres"
/// city : "Surat"
/// state : "Gujarat"
/// country : "India"
/// postalCode : "395007"

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

/// addressLine : "teste addres"
/// city : "134096"
/// state : "4030"
/// country : "101"
/// postalCode : "395007"

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

/// company : {"name":"estimateClient","personName":"estimateClint","mobileNumber":"9825164241","alternativeMobileNumber":"9826161616","gstNumber":"ABABBABABABABAB","email":"TEST.COM","website":"TES.COM"}
/// _id : "64f5c87914cd176e971b4072"
/// clientPhoto : null
/// userId : "64e88d53f4a1d4b8d186394a"
/// __v : 0

class Client {
  Client({
      Company? company, 
      String? id, 
      dynamic clientPhoto, 
      String? userId, 
      num? v,}){
    _company = company;
    _id = id;
    _clientPhoto = clientPhoto;
    _userId = userId;
    _v = v;
}

  Client.fromJson(dynamic json) {
    _company = json['company'] != null ? Company.fromJson(json['company']) : null;
    _id = json['_id'];
    _clientPhoto = json['clientPhoto'];
    _userId = json['userId'];
    _v = json['__v'];
  }
  Company? _company;
  String? _id;
  dynamic _clientPhoto;
  String? _userId;
  num? _v;
Client copyWith({  Company? company,
  String? id,
  dynamic clientPhoto,
  String? userId,
  num? v,
}) => Client(  company: company ?? _company,
  id: id ?? _id,
  clientPhoto: clientPhoto ?? _clientPhoto,
  userId: userId ?? _userId,
  v: v ?? _v,
);
  Company? get company => _company;
  String? get id => _id;
  dynamic get clientPhoto => _clientPhoto;
  String? get userId => _userId;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_company != null) {
      map['company'] = _company?.toJson();
    }
    map['_id'] = _id;
    map['clientPhoto'] = _clientPhoto;
    map['userId'] = _userId;
    map['__v'] = _v;
    return map;
  }

}

/// name : "estimateClient"
/// personName : "estimateClint"
/// mobileNumber : "9825164241"
/// alternativeMobileNumber : "9826161616"
/// gstNumber : "ABABBABABABABAB"
/// email : "TEST.COM"
/// website : "TES.COM"

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