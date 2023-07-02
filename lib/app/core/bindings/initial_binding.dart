import 'package:get/get.dart';
import 'package:my_note/app/data/local/realm_dao.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RealmDao>(
      () => RealmDaoImpl(),
    );
  }
}
