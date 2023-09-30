/// success : true
/// country_data : [{"id":1,"name":"Afghanistan","currency":"AFN","currency_name":"Afghan afghani","currency_symbol":"؋","emoji":"🇦🇫"}]

class GetAllCountry {
  GetAllCountry({
      bool? success, 
      List<CountryData>? countryData,}){
    _success = success;
    _countryData = countryData;
}

  GetAllCountry.fromJson(dynamic json) {
    _success = json['success'];
    if (json['country_data'] != null) {
      _countryData = [];
      json['country_data'].forEach((v) {
        _countryData?.add(CountryData.fromJson(v));
      });
    }
  }
  bool? _success;
  List<CountryData>? _countryData;
GetAllCountry copyWith({  bool? success,
  List<CountryData>? countryData,
}) => GetAllCountry(  success: success ?? _success,
  countryData: countryData ?? _countryData,
);
  bool? get success => _success;
  List<CountryData>? get countryData => _countryData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_countryData != null) {
      map['country_data'] = _countryData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// name : "Afghanistan"
/// currency : "AFN"
/// currency_name : "Afghan afghani"
/// currency_symbol : "؋"
/// emoji : "🇦🇫"

class CountryData {
  CountryData({
      num? id, 
      String? name, 
      String? currency, 
      String? currencyName, 
      String? currencySymbol, 
      String? emoji,}){
    _id = id;
    _name = name;
    _currency = currency;
    _currencyName = currencyName;
    _currencySymbol = currencySymbol;
    _emoji = emoji;
}

  CountryData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _currency = json['currency'];
    _currencyName = json['currency_name'];
    _currencySymbol = json['currency_symbol'];
    _emoji = json['emoji'];
  }
  num? _id;
  String? _name;
  String? _currency;
  String? _currencyName;
  String? _currencySymbol;
  String? _emoji;
CountryData copyWith({  num? id,
  String? name,
  String? currency,
  String? currencyName,
  String? currencySymbol,
  String? emoji,
}) => CountryData(  id: id ?? _id,
  name: name ?? _name,
  currency: currency ?? _currency,
  currencyName: currencyName ?? _currencyName,
  currencySymbol: currencySymbol ?? _currencySymbol,
  emoji: emoji ?? _emoji,
);
  num? get id => _id;
  String? get name => _name;
  String? get currency => _currency;
  String? get currencyName => _currencyName;
  String? get currencySymbol => _currencySymbol;
  String? get emoji => _emoji;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['currency'] = _currency;
    map['currency_name'] = _currencyName;
    map['currency_symbol'] = _currencySymbol;
    map['emoji'] = _emoji;
    return map;
  }

}