/// success : true
/// city_data : [{"id":57588,"name":"Abrama","state_id":4030,"state_name":"Gujarat"},null]

class GetAllCity {
  GetAllCity({
      bool? success, 
      List<CityData>? cityData,}){
    _success = success;
    _cityData = cityData;
}

  GetAllCity.fromJson(dynamic json) {
    _success = json['success'];
    if (json['city_data'] != null) {
      _cityData = [];
      json['city_data'].forEach((v) {
        _cityData?.add(CityData.fromJson(v));
      });
    }
  }
  bool? _success;
  List<CityData>? _cityData;
GetAllCity copyWith({  bool? success,
  List<CityData>? cityData,
}) => GetAllCity(  success: success ?? _success,
  cityData: cityData ?? _cityData,
);
  bool? get success => _success;
  List<CityData>? get cityData => _cityData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_cityData != null) {
      map['city_data'] = _cityData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 57588
/// name : "Abrama"
/// state_id : 4030
/// state_name : "Gujarat"

class CityData {
  CityData({
      num? id, 
      String? name, 
      num? stateId, 
      String? stateName,}){
    _id = id;
    _name = name;
    _stateId = stateId;
    _stateName = stateName;
}

  CityData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _stateId = json['state_id'];
    _stateName = json['state_name'];
  }
  num? _id;
  String? _name;
  num? _stateId;
  String? _stateName;
CityData copyWith({  num? id,
  String? name,
  num? stateId,
  String? stateName,
}) => CityData(  id: id ?? _id,
  name: name ?? _name,
  stateId: stateId ?? _stateId,
  stateName: stateName ?? _stateName,
);
  num? get id => _id;
  String? get name => _name;
  num? get stateId => _stateId;
  String? get stateName => _stateName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['state_id'] = _stateId;
    map['state_name'] = _stateName;
    return map;
  }

}