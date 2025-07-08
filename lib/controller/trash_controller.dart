import 'package:get/get.dart';
import 'package:listaa/controller/home_controller.dart';
import 'package:listaa/data/models/grouped_shopping_lists_model.dart';
import 'package:listaa/data/repositories/home_data.dart';
import 'package:listaa/data/repositories/reminders_data.dart';
import 'package:listaa/data/repositories/trash_data.dart';

class TrashController extends GetxController{

  var scrollAlpha = 0.obs;
  TrashData data = Get.find<TrashDataImpl>();
  RxBool isLoading = true.obs;


  RxList<GroupedShoppingListsModel> lists = <GroupedShoppingListsModel>[].obs;

  void toggleIsCollapsed(int groupIndex,int index) {
    
      lists[groupIndex].shoppingLists[index].isCollapsed = !lists[groupIndex].shoppingLists[index].isCollapsed;
    update();
  }

  Future<void> getAllLists()async{
    
   lists.value =  await data.getSoftDeletedList();
  }

  Future<void> deleteList(int listId) async {
    await data.deleteList(listId);
    lists.removeWhere((element) => element.shoppingLists.any((list) => list.id == listId));
    update();
  }
  Future<void> restoreDeletedList(int listId) async {
    
    await data.restoreDeletedList(listId);
    lists.removeWhere((element) => element.shoppingLists.any((list) => list.id == listId));
    update();
  }
  

  void toggleIsDone(int listIndex, int itemId) {
    // lists[listIndex].items.where((element) => element.id == itemId).first.isDone = !lists[listIndex].items.where((element) => element.id == itemId).first.isDone;
    
     print("trash check");
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