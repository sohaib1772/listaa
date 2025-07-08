import 'package:get/get.dart';
import 'package:listaa/data/models/shopping_list_model.dart';
import 'package:listaa/data/repositories/home_data.dart';


class HomeController extends GetxController {
  int priority = 10;
  var scrollAlpha = 0.obs;
  HomeData homeData = Get.find<HomeDataImpl>();
  RxBool isLoading = true.obs;

  void changePriority(int index) async{
    priority = index;
    print("priority.value ${priority}");
    index == 10 ? await getAllLists() : await getHomeListsByPriority(index);
    update();
  }

  RxList<ShoppingListModel> lists = <ShoppingListModel>[].obs;

  void toggleIsCollapse(int index) {
   
      lists[index].isCollapsed = !lists[index].isCollapsed;
    
    update();
  }

  Future<void> getAllLists()async{
    
   lists.value =  await homeData.getAllHomeLists();
   update();
  }
  Future<void> getHomeListsByPriority(int priority)async{
   lists.value =  await homeData.getHomeListsByPriority(

    Priority.values[priority],
   );
   
  }

  void toggleIsDone(int listIndex, int itemId) {
   //  lists[listIndex].items.where((element) => element.id == itemId).first.isDone = !lists[listIndex].items.where((element) => element.id == itemId).first.isDone;
   
   print("home screen check");
    update();
  }

  @override
  void onInit() async{
    await getAllLists();
    isLoading.value = false;
    
    super.onInit();
  }
}
