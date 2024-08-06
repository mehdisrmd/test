import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:testapp/bindings.dart';
import 'package:testapp/core/contollers/storage/storage_controller.dart';
import 'package:testapp/core/models/transaction.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Test App',
        binds: MainBindings().dependencies(),
        home: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.find<StoreController>().addTestSample();
              },
              child: Icon(Icons.add),
            ),
            appBar: AppBar(
              title: Text('Test Example'),
            ),
            body: GetBuilder<StoreController>(
              builder: (_) {
                return ValueListenableBuilder(
                  valueListenable: Hive.box('user').listenable(),
                  builder: (context, Box box, _) {
                    if (Hive.box('user').isEmpty) {
                      return const Center(
                        child: Text('No transactions'),
                      );
                    }

                    return ListView.builder(
                      itemCount: box.values.length,
                      itemBuilder: (context, index) {
                        TransactionModel? transaction = box.getAt(index);
                        return ListTile(
                          trailing: SizedBox(
                            width: 50,
                            child: SvgPicture.asset(
                                'assets/images/icons/phone_icon.svg',
                                width: 50,
                                color: Colors.pinkAccent,
                                semanticsLabel: 'Phone Logo'),
                          ),
                          title: Text(
                              'Price: ${transaction?.price}, Data: ${transaction?.data}'),
                          subtitle: Text('Index: ${index}'),
                        );
                      },
                    );
                  },
                );
              },
            )));
  }
}
