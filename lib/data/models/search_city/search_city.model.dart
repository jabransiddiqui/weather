class SearchCityModel {
  SearchCityModel({
    required this.title,
    required this.locationType,
    required this.woeid,
    required this.lattLong,
  });
  late final String title;
  late final String locationType;
  late final int woeid;
  late final String lattLong;
  
  SearchCityModel.fromJson(Map<String, dynamic> json){
    title = json['title'];
    locationType = json['location_type'];
    woeid = json['woeid'];
    lattLong = json['latt_long'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['location_type'] = locationType;
    _data['woeid'] = woeid;
    _data['latt_long'] = lattLong;
    return _data;
  }
}