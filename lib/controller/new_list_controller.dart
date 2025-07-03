import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:listaa/view/new_list/widgets/new_list_input_row.dart';

class RowItemsModel {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
FocusNode focusNode = FocusNode();
  RowItemsModel();
}

class NewListController extends GetxController {
  List<RowItemsModel> items = [];
  RxInt totalAmount = 0.obs;
  RxInt selectedPriority = 0.obs;
  RxString date = "".obs;
  RowItemsModel addNewItemToRows() {
    items.add(RowItemsModel());
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
    int sum = 0;
    for (var item in items) {
      final text = item.priceController.text;
      if (text.isNotEmpty) {
        sum += int.tryParse(text) ?? 0;
      }
    }
    totalAmount.value = sum;
  }

  void changePriority(int index) {
    selectedPriority.value = index;
  }

  void changeDate(String date) {
    this.date.value = date;
    print(date);
  }


  @override
  void onReady() {
    addNewItemToRows();
  }
}
