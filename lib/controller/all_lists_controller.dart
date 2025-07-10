import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:listaa/data/models/shopping_list_model.dart';
import 'package:listaa/data/repositories/list_data.dart';

class AllListsController extends GetxController{
int priority = 10;
  var scrollAlpha = 0.obs;
  ListData homeData = Get.find<ListDataImpl>();
  RxBool isLoading = true.obs;

  void changePriority(int index,{int categoryId = 0}) async{
    priority = index;
    if(categoryId != 0 ){
      if(priority == 10){
        await getAllLists(categoryId: categoryId);
        return;
      }
       lists.value = await homeData.getListsByCategory(
        categoryId
       ,Priority.values[priority],);
    }else{
    index == 10 ? await getAllLists() : await getHomeListsByPriority(index);
    }
    update();
  }

  RxList<ShoppingListModel> lists = <ShoppingListModel>[].obs;

  void toggleIsCollapse(int index, bool isCompleted) {
   
      lists[index].isCollapsed = !lists[index].isCollapsed;
    

    update();
  }

  Future<void> getAllLists({int categoryId = 0})async{
    print("category is $categoryId");
  if (categoryId != 0) {
      lists.value = await homeData.getListsByCategory(
        categoryId
       ,null);
    } else {
   lists.value =  await homeData.getAllLists();
    }
    update();
  }
  Future<void> getHomeListsByPriority(int priority)async{
   lists.value =  await homeData.getListsByPriority(

    Priority.values[priority],
   );
   
  }

  void toggleIsDone(int listIndex, int itemId,int groupInedx)async {
   await homeData.markItemAsDone(
       itemId,
       !lists[listIndex].items.firstWhere(
        (item) => item.id == itemId,
      ).isDone,
    );
    lists[listIndex].items.firstWhere(
      (item) => item.id == itemId,
    ).isDone = !lists[listIndex].items.firstWhere(
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