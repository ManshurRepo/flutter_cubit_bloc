import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'app_widget.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}
