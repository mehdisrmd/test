import 'package:get/get.dart';
import 'package:testapp/core/contollers/storage/storage_controller.dart';

class MainBindings implements Binding {
  @override
  List<Bind> dependencies() {
    return [
      Bind.lazyPut(() => StoreController()),
    ];
  }
}
