import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:listaa/data/models/item_model.dart';
import 'package:listaa/data/models/shopping_list_model.dart';
import 'package:listaa/data/static/home_data.dart';


class HomeController extends GetxController {
  RxInt priority = 0.obs;
  var scrollAlpha = 0.obs;
  HomeData homeData = Get.find<HomeDataImpl>();
  RxBool isLoading = true.obs;

  void changePriority(int index) async{
    priority.value = index;
    index == 0 ? await getAllLists() : await getHomeListsByPriority();
  }

  RxList<ShoppingListModel> lists = <ShoppingListModel>[].obs;
  RxList<ShoppingListModel> completedLists = <ShoppingListModel>[].obs;

  void toggleIsCollapse(int index, bool isCompleted) {
    if (isCompleted) {
      completedLists[index].isCollapsed = !completedLists[index].isCollapsed;
    } else {
      lists[index].isCollapsed = !lists[index].isCollapsed;
    }
    update();
  }

  Future<void> getAllLists()async{
    
   lists.value =  await homeData.getAllHomeLists();
  }
  Future<void> getHomeListsByPriority()async{
    
   lists.value =  await homeData.getHomeListsByPriority(

    Priority.values[priority.value -1],
   );
  }

  void toggleIsDone(int listIndex, int itemId) {
    // lists[listIndex].items.where((element) => element.id == itemId).first.isDone = !lists[listIndex].items.where((element) => element.id == itemId).first.isDone;
    update();
  }

  @override
  void onInit() async{
    await getAllLists();
    isLoading.value = false;
    
    super.onInit();
  }
}
