
import "ads_home.dart";
class AdsHomeBanner {
  bool? status;
  String? message;
  List<AdsHome>? data;
  int? count;

  AdsHomeBanner({this.status, this.message, this.data, this.count});

  AdsHomeBanner.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AdsHome>[];
      json['data'].forEach((v) {
        data!.add( AdsHome.fromJson(v));
      });
    }
    count = json['count'];
  }
}