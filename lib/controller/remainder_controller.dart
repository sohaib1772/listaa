import 'package:get/get.dart';
import 'package:listaa/controller/home_controller.dart';
import 'package:listaa/data/models/grouped_shopping_lists_model.dart';
import 'package:listaa/data/repositories/home_data.dart';
import 'package:listaa/data/repositories/reminders_data.dart';

class RemainderController extends GetxController{

  var scrollAlpha = 0.obs;
  RemindersData data = Get.find<RemindersDataImpl>();
  HomeData homeData = Get.find<HomeDataImpl>();
  RxBool isLoading = true.obs;


  RxList<GroupedShoppingListsModel> lists = <GroupedShoppingListsModel>[].obs;

  void toggleIsCollapsed(int groupIndex,int index) {
    
      lists[groupIndex].shoppingLists[index].isCollapsed = !lists[groupIndex].shoppingLists[index].isCollapsed;
    update();
  }

  Future<void> getAllLists()async{
    
   lists.value =  await data.getRemindersList();
  }
  

   void toggleIsDone(int listIndex, int itemId,int groupIndex)async {
   await homeData.markItemAsDone(
       itemId,
       !lists[groupIndex].shoppingLists[listIndex].items.firstWhere(
        (item) => item.id == itemId,
      ).isDone,
    );
    lists[groupIndex].shoppingLists[listIndex].items.firstWhere(
      (item) => item.id == itemId,
    ).isDone = !lists[groupIndex].shoppingLists[listIndex].items.firstWhere(
      (item) => item.id == itemId,
    ).isDone;
  
    update();
  }

  @override
  void onInit() async{
    await getAllLists();
    isLoading.value = false;
    
    update();
    super.onInit();
  }
}