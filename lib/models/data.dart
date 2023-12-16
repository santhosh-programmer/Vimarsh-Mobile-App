class Data {
  String? title;
  String? description;
  String? image;
  String? latitude;
  String? longitude;
  String? dateReported;

  Data({this.title, this.description, this.image, this.latitude, this.longitude, this.dateReported});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    image = json['image'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    dateReported = json['date_reported'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['date_reported'] = dateReported;
    return data;
  }
}
