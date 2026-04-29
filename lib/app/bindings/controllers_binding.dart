import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class ControllersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
