/// success : true
/// productData : [{"_id":"64a80e4bc7c08d1159ad34ed","name":"dfddf","price":12322,"is_added":false,"currencySymbol":"₹","productCurrency":"INR","description":"dsadsadsad","images":["public/uploads/product/admin-images-1688735307218.octet-stream","public/uploads/product/admin-images-1688735307218.octet-stream"],"userId":"64981bb79c08770d6ef228b7","createdAt":"2023-07-07T13:08:27.224Z","updatedAt":"2023-07-07T13:08:27.224Z","__v":0}]

class GetAllProducts {
  GetAllProducts({
    bool? success,
    List<ProductData>? productData,
  }) {
    _success = success;
    _productData = productData;
  }

  GetAllProducts.fromJson(dynamic json) {
    _success = json['success'];
    if (json['productData'] != null) {
      _productData = [];
      json['productData'].forEach((v) {
        _productData?.add(ProductData.fromJson(v));
      });
    }
  }

  bool? _success;
  List<ProductData>? _productData;

  GetAllProducts copyWith({
    bool? success,
    List<ProductData>? productData,
  }) =>
      GetAllProducts(
        success: success ?? _success,
        productData: productData ?? _productData,
      );

  bool? get success => _success;

  List<ProductData>? get productData => _productData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_productData != null) {
      map['productData'] = _productData?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// _id : "64a80e4bc7c08d1159ad34ed"
/// name : "dfddf"
/// price : 12322
/// is_added : false
/// currencySymbol : "₹"
/// productCurrency : "INR"
/// description : "dsadsadsad"
/// images : ["public/uploads/product/admin-images-1688735307218.octet-stream","public/uploads/product/admin-images-1688735307218.octet-stream"]
/// userId : "64981bb79c08770d6ef228b7"
/// createdAt : "2023-07-07T13:08:27.224Z"
/// updatedAt : "2023-07-07T13:08:27.224Z"
/// __v : 0

class ProductData {
  ProductData({
    String? id,
    String? name,
    num? price,
    bool isAdded = false,
    String? currencySymbol,
    String? productCurrency,
    String? description,
    List<String>? images,
    String? userId,
    String? createdAt,
    String? updatedAt,
    num? v,
    int qty = 1,
  }) {
    _id = id;
    _name = name;
    _price = price;
    _isAdded = isAdded;
    _currencySymbol = currencySymbol;
    _productCurrency = productCurrency;
    _description = description;
    _images = images;
    _userId = userId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
    _qty = qty;
  }

  ProductData.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['name'];
    _price = json['price'];
    _isAdded = json['is_added'];
    _currencySymbol = json['currencySymbol'];
    _productCurrency = json['productCurrency'];
    _description = json['description'];
    _images = json['images'] != null ? json['images'].cast<String>() : [];
    _userId = json['userId'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
    _qty = json['qty'] ?? 1;

  }

  String? _id;
  String? _name;
  num? _price;
  bool? _isAdded;
  String? _currencySymbol;
  String? _productCurrency;
  String? _description;
  List<String>? _images;
  String? _userId;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  ProductData copyWith({
    String? id,
    String? name,
    num? price,
    required bool isAdded,
    String? currencySymbol,
    String? productCurrency,
    String? description,
    List<String>? images,
    String? userId,
    String? createdAt,
    String? updatedAt,
    num? v,
  }) =>
      ProductData(
        id: id ?? _id,
        name: name ?? _name,
        price: price ?? _price,
        isAdded: isAdded,
        currencySymbol: currencySymbol ?? _currencySymbol,
        productCurrency: productCurrency ?? _productCurrency,
        description: description ?? _description,
        images: images ?? _images,
        userId: userId ?? _userId,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        v: v ?? _v,
      );
  int _qty =1;

  int get qty => _qty;

  set qty(int value) {
    _qty = value;
  }

  String? get id => _id;

  String? get name => _name;

  num? get price => _price;

  bool? get isAdded => _isAdded;

  set sisAdded(bool? value) {
    _isAdded = value;
  }

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
    map['is_added'] = _isAdded;
    map['currencySymbol'] = _currencySymbol;
    map['productCurrency'] = _productCurrency;
    map['description'] = _description;
    map['images'] = _images;
    map['userId'] = _userId;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    map['qty'] = _qty;

    return map;
  }
}
