/// _id : "64f4a0ce6ca178fdfcd105f6"
/// name : "test"
/// price : 4000
/// currencySymbol : "₹"
/// productCurrency : "INR"
/// description : "myfinal prdouct\n"
/// images : ["public/uploads/product/admin-images-1693753550697.jpg"]
/// userId : "64e88d53f4a1d4b8d186394a"
/// createdAt : "2023-09-03T15:05:50.765Z"
/// updatedAt : "2023-09-03T15:05:50.765Z"
/// __v : 0

class GetProduct {
  GetProduct({
      String? id, 
      String? name, 
      num? price, 
      String? currencySymbol, 
      String? productCurrency, 
      String? description, 
      List<String>? images, 
      String? userId, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _id = id;
    _name = name;
    _price = price;
    _currencySymbol = currencySymbol;
    _productCurrency = productCurrency;
    _description = description;
    _images = images;
    _userId = userId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  GetProduct.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _price = json['price'];
    _currencySymbol = json['currencySymbol'];
    _productCurrency = json['productCurrency'];
    _description = json['description'];
    _images = json['images'] != null ? json['images'].cast<String>() : [];
    _userId = json['userId'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _name;
  num? _price;
  String? _currencySymbol;
  String? _productCurrency;
  String? _description;
  List<String>? _images;
  String? _userId;
  String? _createdAt;
  String? _updatedAt;
  num? _v;
GetProduct copyWith({  String? id,
  String? name,
  num? price,
  String? currencySymbol,
  String? productCurrency,
  String? description,
  List<String>? images,
  String? userId,
  String? createdAt,
  String? updatedAt,
  num? v,
}) => GetProduct(  id: id ?? _id,
  name: name ?? _name,
  price: price ?? _price,
  currencySymbol: currencySymbol ?? _currencySymbol,
  productCurrency: productCurrency ?? _productCurrency,
  description: description ?? _description,
  images: images ?? _images,
  userId: userId ?? _userId,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  v: v ?? _v,
);
  String? get id => _id;
  String? get name => _name;
  num? get price => _price;
  String? get currencySymbol => _currencySymbol;
  String? get productCurrency => _productCurrency;
  String? get description => _description;
  List<String>? get images => _images;
  String? get userId => _userId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['name'] = _name;
    map['price'] = _price;
    map['currencySymbol'] = _currencySymbol;
    map['productCurrency'] = _productCurrency;
    map['description'] = _description;
    map['images'] = _images;
    map['userId'] = _userId;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}