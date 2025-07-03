import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:listaa/data/models/item_model.dart';
import 'package:listaa/data/models/shopping_list_model.dart';
import 'package:listaa/view/home/widgets/home_list_card.dart';
import 'package:listaa/view/home/widgets/home_list_card_item.dart';

class HomeController extends GetxController{
  RxInt priority = 0.obs;
  var scrollAlpha = 0.obs;
  void changePriority(int index){
    priority.value = index;
  }
  RxList<ShoppingListModel> lists = [
    ShoppingListModel(
      isCollapsed: true,
      priority: 1,
      title: "سهرة الخميس",
      totalAmount: 100,
      id: 1,
      date: DateTime(2022,21,22),
      isDeleted: false,
      items: [
        ItemModel(
          id: 1,
          name: "فشار", icon: "🧃", price: 10, isDone: false),
        ItemModel(
          id: 2,
          name: "بطاطس", icon: "🧃", price: 10, isDone: true),
      ]
    ),
    ShoppingListModel(
      isCollapsed: false,
      priority: 1,
      title: "سهرة الجمعة",
      totalAmount: 100,
      id: 2,
      date: DateTime(2022,21,22),
      isDeleted: false,
      items: [
        ItemModel(name: "فشار", icon: "🧃", price: 10, isDone: false)
      ]
    ),
    
  ].obs;
 

  void toggleIsCollapse(int index){
    print(index);
    lists[index].isCollapsed = !lists[index].isCollapsed;
    update();
  }
  void toggleIsDone(int listIndex, int itemId){
    lists[listIndex].items.where((element) => element.id == itemId).first.isDone = !lists[listIndex].items.where((element) => element.id == itemId).first.isDone;
    update();
  }

}