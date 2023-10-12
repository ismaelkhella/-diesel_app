
import 'dart:convert';

import 'package:watiq/models/user.dart';
import 'package:watiq/shared_pref/shared_pref_controller.dart';
import 'package:watiq/util/helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../api/api_setting.dart';

class AuthApiController with Helpers{
  Future<bool> register(BuildContext context,
      {required User user}) async {
    var url = Uri.parse(ApiSettings.registerUrl);
    var response = await http.post(
      url,headers: {'Accept': 'application/json'},
      body: {
        'name': user.name,
        'email':user.email,
        'phone': user.mobile,
        // 'password': user.password,
      },
    );
    if (response.statusCode == 201) {
      showSnackBar(
          context: context,
          message: jsonDecode(response.body)['code'].toString(),
          error: false);
      return true;
    } else if (response.statusCode == 400) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    } else {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    }

    return false;
  }


  Future<bool> login(BuildContext context,
      {required String phone}) async {
    var url = Uri.parse(ApiSettings.loginUrl);
    var response = await http.post(
      url,headers: {'Accept': 'application/json'},
      body: {
        'phone': phone,
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      await SharedPrefController().saveToken(token: jsonDecode(response.body)['token']);
      return true;
    } else if (response.statusCode == 400) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    } else {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    }

    return false;
  }


   Future<bool> verifyOTP(BuildContext context,
      {required String code,required String token,}) async {
    var url = Uri.parse(ApiSettings.otp);
    var response = await http.post(
      url,headers: {'Accept': 'application/json','Authorization':'Bearer $token'},
      body: {
        'code': code,
      },
    );
    print(response.body);
    if (response.statusCode == 400) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    } else {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['message'],
        error: true,
      );
    }

    return jsonDecode(response.body)['status'];
  }




}