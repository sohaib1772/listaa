import 'package:get/get_state_manager/get_state_manager.dart';

class WelcomeController extends GetxController{
  bool startSlidersAnimation = false;
  @override
  void onReady() async{
    startSlidersAnimation = true;
    update();
  }
}