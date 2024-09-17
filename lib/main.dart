import 'package:flutter/material.dart';
import 'package:fridger/fridger_app.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() {
  final talker = Talker();

  GetIt.I.registerSingleton(talker);

  runApp(const FridgerApp());
}
