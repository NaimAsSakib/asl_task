import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../repository/post_repository.dart';
import '../controller/post_controller.dart';
class AppRegistry extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostRepository>(() => PostRepository());
    Get.lazyPut<PostController>(() => PostController(repository: Get.find<PostRepository>()));
  }
}


