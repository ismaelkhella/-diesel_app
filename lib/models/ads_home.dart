class AdsHome {
  int? id;
  String? image;

  AdsHome();

  AdsHome.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}
