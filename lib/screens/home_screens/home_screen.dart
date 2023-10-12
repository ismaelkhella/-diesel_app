import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:watiq/controller/home_controller.dart';
import 'package:watiq/models/ads_home_banner.dart';
import 'package:watiq/util/strings.dart';

import '../../controller/auth_controller.dart';
import '../../models/ads_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text('DIESEL'),
        leading: Icon(Icons.menu),
      ),
      // body:
    );
  }
}
