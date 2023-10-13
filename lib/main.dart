import 'package:flutter/material.dart';
import 'package:session_21/service/dio_helper.dart';
import 'package:session_21/src/app_root.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const AppRoot());
}
