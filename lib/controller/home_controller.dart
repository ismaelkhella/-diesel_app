


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:watiq/models/ads_home.dart';
import 'package:watiq/models/ads_home_banner.dart';
import 'package:watiq/util/helper.dart';
import 'package:http/http.dart' as http;
import '../api/api_setting.dart';
import '../shared_pref/shared_pref_controller.dart';

class HomeApiController with Helpers{
  Future<AdsHome?> getAdv(BuildContext context) async {
    var url = Uri.parse(ApiSettings.advertisement);
    var response = await http.get(url, headers: {
      'Authorization':SharedPrefController().token
    });

    if (response.statusCode == 200) {
      print(response.body);
      var josnRespone = jsonDecode(response.body);
      var apiBaseRespone = AdsHome.fromJson(josnRespone);
      return apiBaseRespone;}
    else{showSnackBar(
      context: context,
      message: response.body,
      error: true,
    );}

    return null;
  }

}
