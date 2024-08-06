import 'dart:async';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:testapp/core/models/transaction.dart';

class StoreController extends GetxController {
  Future<void> saveTransactionData(TransactionModel trans) async {
    // Save the transaction data
    await Hive.box('user').add(trans); // await _storage.close();
  }

// using Isolate to avoid stop ui freezing
  addTestSample() {
    final trans =
        TransactionModel(date: DateTime.now(), price: 500.0, data: 'test');

    for (var i = 0; i < 1000; i++) {
      saveTransactionData(trans);
    }
    update();
  }
}
