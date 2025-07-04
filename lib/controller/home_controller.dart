import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:listaa/data/models/item_model.dart';
import 'package:listaa/data/models/shopping_list_model.dart';


class HomeController extends GetxController {
  RxInt priority = 0.obs;
  var scrollAlpha = 0.obs;
  void changePriority(int index) {
    priority.value = index;
  }

  RxList<ShoppingListModel> lists = [
    ShoppingListModel(
      isCollapsed: true,
      priority: 1,
      title: "سهرة الخميس",
      totalPrice: 100,
      id: 1,
      date: DateTime(2022, 21, 22),
      isDeleted: false,
      items: [
        ItemModel(listId: 1, id: 1, name: "فشار", price: 10, isDone: false),
        ItemModel(id: 2, name: "بطاطس", listId: 1, price: 10, isDone: true),
      ],
    ),
    ShoppingListModel(
      isCollapsed: false,
      priority: 1,
      title: "سهرة الجمعة",
      totalPrice: 100,
      id: 2,
      date: DateTime(2022, 21, 22),
      isDeleted: false,
      items: [ItemModel(name: "فشار", listId: 2, price: 10, isDone: false)],
    ),
  ].obs;
  RxList<ShoppingListModel> completedLists = [
    ShoppingListModel(
      isCollapsed: true,
      priority: 1,
      title: "سهرة الخميس",
      totalPrice: 100,
      id: 1,
      date: DateTime(2022, 21, 22),
      isDeleted: false,
      items: [
        ItemModel(listId: 1, id: 1, name: "فشار", price: 10, isDone: true),
        ItemModel(id: 2, name: "بطاطس", listId: 1, price: 10, isDone: true),
      ],
    ),
    ShoppingListModel(
      isCollapsed: false,
      priority: 1,
      title: "سهرة الجمعة",
      totalPrice: 100,
      id: 2,
      date: DateTime(2022, 21, 22),
      isDeleted: false,
      items: [ItemModel(name: "فشار", listId: 2, price: 10, isDone: true)],
    ),
  ].obs;

  void toggleIsCollapse(int index, bool isCompleted) {
    if (isCompleted) {
      completedLists[index].isCollapsed = !completedLists[index].isCollapsed;
    } else {
      lists[index].isCollapsed = !lists[index].isCollapsed;
    }
    update();
  }

  void toggleIsDone(int listIndex, int itemId) {
    // lists[listIndex].items.where((element) => element.id == itemId).first.isDone = !lists[listIndex].items.where((element) => element.id == itemId).first.isDone;
    update();
  }
}
