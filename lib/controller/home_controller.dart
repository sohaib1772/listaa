import 'package:get/get.dart';
import 'package:listaa/data/models/shopping_list_model.dart';
import 'package:listaa/data/repositories/list_data.dart';
import 'package:listaa/data/repositories/recipe_data.dart';


class HomeController extends GetxController {
  int priority = 10;
  var scrollAlpha = 0.obs;
  ListData homeData = Get.find<ListDataImpl>();
  RxBool isLoading = true.obs;

  void changePriority(int index,{int categoryId = 0}) async{
    priority = index;
    index == 10 ? await getAllLists() : await getHomeListsByPriority(index);
    update();
  }

  RxList<ShoppingListModel> lists = <ShoppingListModel>[].obs;

  void toggleIsCollapse(int index) {
   
      lists[index].isCollapsed = !lists[index].isCollapsed;
    
    update();
  }

  Future<void> getAllLists()async{
    
   lists.value =  await homeData.getAllLists();
   update();
  }
  Future<void> getHomeListsByPriority(int priority,{int categoryId = 0})async{
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
    isLoading.value = true;
    await getAllLists();
    isLoading.value = false;
    
    super.onInit();
  }
}
