import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:listaa/core/constants/app_router_keys.dart';
import 'package:listaa/data/models/item_model.dart';
import 'package:listaa/data/models/shopping_list_model.dart';
import 'package:listaa/data/static/list_data.dart';
import 'package:listaa/view/new_list/widgets/new_list_input_row.dart';

class RowItemsModel {
  TextEditingController nameController;
  TextEditingController priceController;
  FocusNode focusNode = FocusNode();
  RowItemsModel({
    required this.nameController,
    required this.priceController,
    required this.focusNode,
  });
}

class NewListController extends GetxController {
  ListData listData = Get.find<ListDataImpl>();
  RxBool isEditing = false.obs;
  List<RowItemsModel> items = [];
  RxDouble totalAmount = 0.0.obs;
  RxInt selectedPriority = 0.obs;
  RxString date = "".obs;
  RxString title = "".obs;

  RxBool isLoading = false.obs;
  RowItemsModel addNewItemToRows() {
    items.add(
      RowItemsModel(
        nameController: TextEditingController(),
        priceController: TextEditingController(),
        focusNode: FocusNode(),
      ),
    );
    var row = items.last;
    calTotalAmount();
    update();
    return row;
  }

  void removeItemFromRows(int index) {
    items.removeAt(index);
    calTotalAmount();
    update();
  }

  void calTotalAmount() {
    double sum = 0;
    for (var item in items) {
      final text = item.priceController.text;
      if (text.isNotEmpty) {
        sum += double.tryParse(text) ?? 0;
      }
    }
    totalAmount.value = sum;
  }

  void changePriority(int index) {
    selectedPriority.value = index - 1;
  }

  void changeDate(String date) {
    this.date.value = date;
  }

  Future<void> addNewList() async {
    isLoading.value = true;
    await listData.createNewList(
      ShoppingListModel(
        
        isDeleted: false,
        title: title.value,
        date: DateTime.tryParse(date.value) ?? DateTime.now(),
        totalPrice: totalAmount.value,
        priority: selectedPriority.value,
        items: items
            .map(
              (e) => ItemModel(
                id: 0,
                listId: 0,
                name: e.nameController.text,
                price: double.tryParse(e.priceController.text) ?? 0,
                isDone: false,
              ),
            )
            .toList(),
      ),
    );
    isLoading.value = false;
    Get.offNamed(AppRouterKeys.home);
  }

  @override
  void onReady() {
    if (isEditing.value == false) addNewItemToRows();
  }
}
