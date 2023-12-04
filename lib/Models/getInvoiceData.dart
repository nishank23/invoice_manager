/// invoice : {"shippingAddress":{"personName":"ttttt","mobileNumber":"9825424152","addressLine":"tttt","city":"Camabatela","state":"Kukës","country":"Pas de la Casa","postalCode":"569900"},"billingAddress":{"personName":"ttttt","mobileNumber":"9825424152","addressLine":"tttt","city":"Camabatela","state":"Kukës","country":"Pas de la Casa","postalCode":"569900"},"_id":"656e1495a495e8bb20d1355f","client":{"company":{"name":"ttttt","personName":"ttttttttt","mobileNumber":"9825164222","alternativeMobileNumber":"5584895858","gstNumber":"561561561561561","email":"tt@gmail.com","website":"fdansk.com"},"_id":"656dff8ceb38b8947b5a5e25","clientPhoto":null,"userId":"64e88d53f4a1d4b8d186394a","__v":0},"products":[{"product":{"_id":"6541317b725e43398d191420","name":"Hiren Test ","price":600,"currencySymbol":"₹","images":["public/uploads/product/admin-images-1701712964064.jpg"]},"quantity":1,"_id":"656e1495a495e8bb20d13560"}],"invoiceDate":"2023-12-04T00:00:00.000Z","dueDate":"2023-12-04T00:00:00.000Z","currency":"₹","currencyId":"1","itemTotal":100,"discountType":1,"sign":"public/uploads/Estimationsign/admin-file-1701713044807.jpg","subTotal":540,"discount":10,"taxes":[{"percentage":"12","name":"CGST","amount":0,"_id":"656e1495a495e8bb20d13561"}],"estimationNo":"EST8","totalAmount":540,"userId":"64e88d53f4a1d4b8d186394a","__v":0}
/// userprofile : {"pcompany":{"name":"tesett","owner":"eteetetet","mobileNumber":"9292929929","alternativeMobileNumber":"9399239292","gstNumber":"123193929999219","email":"test@gmail.com","website":"tutt.com"},"address":{"addressLine":"tetet","city":"Anand","state":"Gujarat","country":"India","postalCode":"395007"},"bank":{"bankName":"teette","accountNumber":"1291919919191991","ifscCode":"ahahahhha"},"_id":"64f5c55114cd176e971b4042","userId":"64e88d53f4a1d4b8d186394a","userPhoto":null,"__v":0}

class GetInvoiceData {
  GetInvoiceData({
      Invoice? invoice, 
      Userprofile? userprofile,}){
    _invoice = invoice;
    _userprofile = userprofile;
}

  GetInvoiceData.fromJson(dynamic json) {
    _invoice = json['invoice'] != null ? Invoice.fromJson(json['invoice']) : null;
    _userprofile = json['userprofile'] != null ? Userprofile.fromJson(json['userprofile']) : null;
  }
  Invoice? _invoice;
  Userprofile? _userprofile;
GetInvoiceData copyWith({  Invoice? invoice,
  Userprofile? userprofile,
}) => GetInvoiceData(  invoice: invoice ?? _invoice,
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
    _pcompany = json['company'] != null ? Pcompany.fromJson(json['company']) : null;
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
      map['company'] = _pcompany?.toJson();
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

/// shippingAddress : {"personName":"ttttt","mobileNumber":"9825424152","addressLine":"tttt","city":"Camabatela","state":"Kukës","country":"Pas de la Casa","postalCode":"569900"}
/// billingAddress : {"personName":"ttttt","mobileNumber":"9825424152","addressLine":"tttt","city":"Camabatela","state":"Kukës","country":"Pas de la Casa","postalCode":"569900"}
/// _id : "656e1495a495e8bb20d1355f"
/// client : {"company":{"name":"ttttt","personName":"ttttttttt","mobileNumber":"9825164222","alternativeMobileNumber":"5584895858","gstNumber":"561561561561561","email":"tt@gmail.com","website":"fdansk.com"},"_id":"656dff8ceb38b8947b5a5e25","clientPhoto":null,"userId":"64e88d53f4a1d4b8d186394a","__v":0}
/// products : [{"product":{"_id":"6541317b725e43398d191420","name":"Hiren Test ","price":600,"currencySymbol":"₹","images":["public/uploads/product/admin-images-1701712964064.jpg"]},"quantity":1,"_id":"656e1495a495e8bb20d13560"}]
/// invoiceDate : "2023-12-04T00:00:00.000Z"
/// dueDate : "2023-12-04T00:00:00.000Z"
/// currency : "₹"
/// currencyId : "1"
/// itemTotal : 100
/// discountType : 1
/// sign : "public/uploads/Estimationsign/admin-file-1701713044807.jpg"
/// subTotal : 540
/// discount : 10
/// taxes : [{"percentage":"12","name":"CGST","amount":0,"_id":"656e1495a495e8bb20d13561"}]
/// estimationNo : "EST8"
/// totalAmount : 540
/// userId : "64e88d53f4a1d4b8d186394a"
/// __v : 0

class Invoice {
  Invoice({
      ShippingAddress? shippingAddress, 
      BillingAddress? billingAddress, 
      String? id, 
      Client? client, 
      List<Products>? products, 
      String? invoiceDate, 
      String? dueDate, 
      String? currency, 
      String? currencyId, 
      num? itemTotal, 
      num? discountType, 
      String? sign, 
      num? subTotal, 
      num? discount, 
      List<Taxes>? taxes, 
      String? estimationNo, 
      num? totalAmount, 
      String? userId, 
      num? v,}){
    _shippingAddress = shippingAddress;
    _billingAddress = billingAddress;
    _id = id;
    _client = client;
    _products = products;
    _invoiceDate = invoiceDate;
    _dueDate = dueDate;
    _currency = currency;
    _currencyId = currencyId;
    _itemTotal = itemTotal;
    _discountType = discountType;
    _sign = sign;
    _subTotal = subTotal;
    _discount = discount;
    _taxes = taxes;
    _estimationNo = estimationNo;
    _totalAmount = totalAmount;
    _userId = userId;
    _v = v;
}

  Invoice.fromJson(dynamic json) {
    _shippingAddress = json['shippingAddress'] != null ? ShippingAddress.fromJson(json['shippingAddress']) : null;
    _billingAddress = json['billingAddress'] != null ? BillingAddress.fromJson(json['billingAddress']) : null;
    _id = json['_id'];
    _client = json['client'] != null ? Client.fromJson(json['client']) : null;
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
    _invoiceDate = json['invoiceDate'];
    _dueDate = json['dueDate'];
    _currency = json['currency'];
    _currencyId = json['currencyId'];
    _itemTotal = json['itemTotal'];
    _discountType = json['discountType'];
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
  ShippingAddress? _shippingAddress;
  BillingAddress? _billingAddress;
  String? _id;
  Client? _client;
  List<Products>? _products;
  String? _invoiceDate;
  String? _dueDate;
  String? _currency;
  String? _currencyId;
  num? _itemTotal;
  num? _discountType;
  String? _sign;
  num? _subTotal;
  num? _discount;
  List<Taxes>? _taxes;
  String? _estimationNo;
  num? _totalAmount;
  String? _userId;
  num? _v;
Invoice copyWith({  ShippingAddress? shippingAddress,
  BillingAddress? billingAddress,
  String? id,
  Client? client,
  List<Products>? products,
  String? invoiceDate,
  String? dueDate,
  String? currency,
  String? currencyId,
  num? itemTotal,
  num? discountType,
  String? sign,
  num? subTotal,
  num? discount,
  List<Taxes>? taxes,
  String? estimationNo,
  num? totalAmount,
  String? userId,
  num? v,
}) => Invoice(  shippingAddress: shippingAddress ?? _shippingAddress,
  billingAddress: billingAddress ?? _billingAddress,
  id: id ?? _id,
  client: client ?? _client,
  products: products ?? _products,
  invoiceDate: invoiceDate ?? _invoiceDate,
  dueDate: dueDate ?? _dueDate,
  currency: currency ?? _currency,
  currencyId: currencyId ?? _currencyId,
  itemTotal: itemTotal ?? _itemTotal,
  discountType: discountType ?? _discountType,
  sign: sign ?? _sign,
  subTotal: subTotal ?? _subTotal,
  discount: discount ?? _discount,
  taxes: taxes ?? _taxes,
  estimationNo: estimationNo ?? _estimationNo,
  totalAmount: totalAmount ?? _totalAmount,
  userId: userId ?? _userId,
  v: v ?? _v,
);
  ShippingAddress? get shippingAddress => _shippingAddress;
  BillingAddress? get billingAddress => _billingAddress;
  String? get id => _id;
  Client? get client => _client;
  List<Products>? get products => _products;
  String? get invoiceDate => _invoiceDate;
  String? get dueDate => _dueDate;
  String? get currency => _currency;
  String? get currencyId => _currencyId;
  num? get itemTotal => _itemTotal;
  num? get discountType => _discountType;
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
    if (_shippingAddress != null) {
      map['shippingAddress'] = _shippingAddress?.toJson();
    }
    if (_billingAddress != null) {
      map['billingAddress'] = _billingAddress?.toJson();
    }
    map['_id'] = _id;
    if (_client != null) {
      map['client'] = _client?.toJson();
    }
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    map['invoiceDate'] = _invoiceDate;
    map['dueDate'] = _dueDate;
    map['currency'] = _currency;
    map['currencyId'] = _currencyId;
    map['itemTotal'] = _itemTotal;
    map['discountType'] = _discountType;
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
/// amount : 0
/// _id : "656e1495a495e8bb20d13561"

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

/// product : {"_id":"6541317b725e43398d191420","name":"Hiren Test ","price":600,"currencySymbol":"₹","images":["public/uploads/product/admin-images-1701712964064.jpg"]}
/// quantity : 1
/// _id : "656e1495a495e8bb20d13560"

class Products {
  Products({
      Product? product, 
      num? quantity, 
      String? id,}){
    _product = product;
    _quantity = quantity;
    _id = id;
}

  Products.fromJson(dynamic json) {
    _product = json['product'] != null ? Product.fromJson(json['product']) : null;
    _quantity = json['quantity'];
    _id = json['_id'];
  }
  Product? _product;
  num? _quantity;
  String? _id;
Products copyWith({  Product? product,
  num? quantity,
  String? id,
}) => Products(  product: product ?? _product,
  quantity: quantity ?? _quantity,
  id: id ?? _id,
);
  Product? get product => _product;
  num? get quantity => _quantity;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_product != null) {
      map['product'] = _product?.toJson();
    }
    map['quantity'] = _quantity;
    map['_id'] = _id;
    return map;
  }

}

/// _id : "6541317b725e43398d191420"
/// name : "Hiren Test "
/// price : 600
/// currencySymbol : "₹"
/// images : ["public/uploads/product/admin-images-1701712964064.jpg"]

class Product {
  Product({
      String? id, 
      String? name, 
      num? price, 
      String? currencySymbol, 
      List<String>? images,}){
    _id = id;
    _name = name;
    _price = price;
    _currencySymbol = currencySymbol;
    _images = images;
}

  Product.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _price = json['price'];
    _currencySymbol = json['currencySymbol'];
    _images = json['images'] != null ? json['images'].cast<String>() : [];
  }
  String? _id;
  String? _name;
  num? _price;
  String? _currencySymbol;
  List<String>? _images;
Product copyWith({  String? id,
  String? name,
  num? price,
  String? currencySymbol,
  List<String>? images,
}) => Product(  id: id ?? _id,
  name: name ?? _name,
  price: price ?? _price,
  currencySymbol: currencySymbol ?? _currencySymbol,
  images: images ?? _images,
);
  String? get id => _id;
  String? get name => _name;
  num? get price => _price;
  String? get currencySymbol => _currencySymbol;
  List<String>? get images => _images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['price'] = _price;
    map['currencySymbol'] = _currencySymbol;
    map['images'] = _images;
    return map;
  }

}

/// company : {"name":"ttttt","personName":"ttttttttt","mobileNumber":"9825164222","alternativeMobileNumber":"5584895858","gstNumber":"561561561561561","email":"tt@gmail.com","website":"fdansk.com"}
/// _id : "656dff8ceb38b8947b5a5e25"
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

/// name : "ttttt"
/// personName : "ttttttttt"
/// mobileNumber : "9825164222"
/// alternativeMobileNumber : "5584895858"
/// gstNumber : "561561561561561"
/// email : "tt@gmail.com"
/// website : "fdansk.com"

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

/// personName : "ttttt"
/// mobileNumber : "9825424152"
/// addressLine : "tttt"
/// city : "Camabatela"
/// state : "Kukës"
/// country : "Pas de la Casa"
/// postalCode : "569900"

class BillingAddress {
  BillingAddress({
      String? personName, 
      String? mobileNumber, 
      String? addressLine, 
      String? city, 
      String? state, 
      String? country, 
      String? postalCode,}){
    _personName = personName;
    _mobileNumber = mobileNumber;
    _addressLine = addressLine;
    _city = city;
    _state = state;
    _country = country;
    _postalCode = postalCode;
}

  BillingAddress.fromJson(dynamic json) {
    _personName = json['personName'];
    _mobileNumber = json['mobileNumber'];
    _addressLine = json['addressLine'];
    _city = json['city'];
    _state = json['state'];
    _country = json['country'];
    _postalCode = json['postalCode'];
  }
  String? _personName;
  String? _mobileNumber;
  String? _addressLine;
  String? _city;
  String? _state;
  String? _country;
  String? _postalCode;
BillingAddress copyWith({  String? personName,
  String? mobileNumber,
  String? addressLine,
  String? city,
  String? state,
  String? country,
  String? postalCode,
}) => BillingAddress(  personName: personName ?? _personName,
  mobileNumber: mobileNumber ?? _mobileNumber,
  addressLine: addressLine ?? _addressLine,
  city: city ?? _city,
  state: state ?? _state,
  country: country ?? _country,
  postalCode: postalCode ?? _postalCode,
);
  String? get personName => _personName;
  String? get mobileNumber => _mobileNumber;
  String? get addressLine => _addressLine;
  String? get city => _city;
  String? get state => _state;
  String? get country => _country;
  String? get postalCode => _postalCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['personName'] = _personName;
    map['mobileNumber'] = _mobileNumber;
    map['addressLine'] = _addressLine;
    map['city'] = _city;
    map['state'] = _state;
    map['country'] = _country;
    map['postalCode'] = _postalCode;
    return map;
  }

}

/// personName : "ttttt"
/// mobileNumber : "9825424152"
/// addressLine : "tttt"
/// city : "Camabatela"
/// state : "Kukës"
/// country : "Pas de la Casa"
/// postalCode : "569900"

class ShippingAddress {
  ShippingAddress({
      String? personName, 
      String? mobileNumber, 
      String? addressLine, 
      String? city, 
      String? state, 
      String? country, 
      String? postalCode,}){
    _personName = personName;
    _mobileNumber = mobileNumber;
    _addressLine = addressLine;
    _city = city;
    _state = state;
    _country = country;
    _postalCode = postalCode;
}

  ShippingAddress.fromJson(dynamic json) {
    _personName = json['personName'];
    _mobileNumber = json['mobileNumber'];
    _addressLine = json['addressLine'];
    _city = json['city'];
    _state = json['state'];
    _country = json['country'];
    _postalCode = json['postalCode'];
  }
  String? _personName;
  String? _mobileNumber;
  String? _addressLine;
  String? _city;
  String? _state;
  String? _country;
  String? _postalCode;
ShippingAddress copyWith({  String? personName,
  String? mobileNumber,
  String? addressLine,
  String? city,
  String? state,
  String? country,
  String? postalCode,
}) => ShippingAddress(  personName: personName ?? _personName,
  mobileNumber: mobileNumber ?? _mobileNumber,
  addressLine: addressLine ?? _addressLine,
  city: city ?? _city,
  state: state ?? _state,
  country: country ?? _country,
  postalCode: postalCode ?? _postalCode,
);
  String? get personName => _personName;
  String? get mobileNumber => _mobileNumber;
  String? get addressLine => _addressLine;
  String? get city => _city;
  String? get state => _state;
  String? get country => _country;
  String? get postalCode => _postalCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['personName'] = _personName;
    map['mobileNumber'] = _mobileNumber;
    map['addressLine'] = _addressLine;
    map['city'] = _city;
    map['state'] = _state;
    map['country'] = _country;
    map['postalCode'] = _postalCode;
    return map;
  }

}