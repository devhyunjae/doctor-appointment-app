import 'package:flutter/material.dart';
import 'package:medicare/screens/doctor_detail.dart';
import 'package:medicare/screens/home.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => Home(),
  '/detail': (context) => SliverDoctorDetail(),
};
