import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:testapp/core/models/transaction.dart';
import 'package:testapp/core/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await initializeFirebase();
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionModelAdapter());
  await Hive.openBox('user');

  runApp(HomePage());
}
