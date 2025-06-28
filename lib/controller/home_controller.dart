import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  RxInt priority = 0.obs;
  ScrollController scrollController = ScrollController();
  var scrollAlpha = 0.obs;
  void changePriority(int index){
    priority.value = index;
  }

  @override
  void onInit() {
    scrollController.addListener(_onScroll);
    super.onInit();
  }

  void _onScroll() {
    if (scrollController.position.pixels >= 40) {
      if(scrollController.position.pixels <= 100){
        scrollAlpha.value = scrollController.position.pixels.toInt();
      }
      scrollAlpha.value = 255;
    } else {
      scrollAlpha.value = 0;
    }
  }

  @override
  void onClose() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    super.onClose();
  }

}