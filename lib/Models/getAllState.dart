/// success : true
/// states_data : [{"id":4023,"name":"Andaman and Nicobar Islands","country_id":101,"country_name":"India"},null]

class GetAllState {
  GetAllState({
      bool? success, 
      List<StatesData>? statesData,}){
    _success = success;
    _statesData = statesData;
}

  GetAllState.fromJson(dynamic json) {
    _success = json['success'];
    if (json['states_data'] != null) {
      _statesData = [];
      json['states_data'].forEach((v) {
        _statesData?.add(StatesData.fromJson(v));
      });
    }
  }
  bool? _success;
  List<StatesData>? _statesData;
GetAllState copyWith({  bool? success,
  List<StatesData>? statesData,
}) => GetAllState(  success: success ?? _success,
  statesData: statesData ?? _statesData,
);
  bool? get success => _success;
  List<StatesData>? get statesData => _statesData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_statesData != null) {
      map['states_data'] = _statesData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 4023
/// name : "Andaman and Nicobar Islands"
/// country_id : 101
/// country_name : "India"

class StatesData {
  StatesData({
      num? id, 
      String? name, 
      num? countryId, 
      String? countryName,}){
    _id = id;
    _name = name;
    _countryId = countryId;
    _countryName = countryName;
}

  StatesData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _countryId = json['country_id'];
    _countryName = json['country_name'];
  }
  num? _id;
  String? _name;
  num? _countryId;
  String? _countryName;
StatesData copyWith({  num? id,
  String? name,
  num? countryId,
  String? countryName,
}) => StatesData(  id: id ?? _id,
  name: name ?? _name,
  countryId: countryId ?? _countryId,
  countryName: countryName ?? _countryName,
);
  num? get id => _id;
  String? get name => _name;
  num? get countryId => _countryId;
  String? get countryName => _countryName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['country_id'] = _countryId;
    map['country_name'] = _countryName;
    return map;
  }

}