import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:listaa/core/localization/locale.dart';

class OnboardingController extends GetxController{
  RxInt pageIndex = 0.obs;
  CarouselSliderController carouselController = CarouselSliderController();
  bool isLastPage = false;

  List<Widget> images = [Image.asset("assets/images/onboarding1.jpg"),Image.asset("assets/images/onboarding2.jpg"),Image.asset("assets/images/onboarding3.jpg")];
List<String> titles = [
    AppLocaleKeys.createYourListEasily.tr,
    AppLocaleKeys.selectTimeAndDate.tr,
    AppLocaleKeys.moneyReportsWekly.tr,
  ].obs;
  List<String> subtitles = [
    AppLocaleKeys.youCanCreateALotOfLists.tr,
    AppLocaleKeys.fromNowYouDontForgetAnything.tr,
    AppLocaleKeys.stayUpToDateAboutYourMoney.tr,
  ].obs;
  void nextPage(){
    
    print("page index $isLastPage");
    if(pageIndex < 2){
      pageIndex ++;
      if(pageIndex >= 2){
      isLastPage = true;
      update();
    }
      carouselController.animateToPage(pageIndex.value, duration: const Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
    }
    
  
  }
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }
  

  
}