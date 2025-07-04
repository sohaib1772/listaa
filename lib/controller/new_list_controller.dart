import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:listaa/view/new_list/widgets/new_list_input_row.dart';

class RowItemsModel {

  TextEditingController nameController;
  TextEditingController priceController;
FocusNode focusNode = FocusNode();
RowItemsModel(
  {
  required  this.nameController ,
   required this.priceController,
   required this.focusNode,
  }
);
}

class NewListController extends GetxController {
  RxBool isEditing = false.obs;
  List<RowItemsModel> items = [];
  RxDouble totalAmount = 0.0.obs;
  RxInt selectedPriority = 0.obs;
  RxString date = "".obs;
  RxString title = "".obs;
  RowItemsModel addNewItemToRows() {
    items.add(RowItemsModel(
      nameController: TextEditingController(),
      priceController: TextEditingController(),
      focusNode: FocusNode(),
    ));
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
    selectedPriority.value = index;
  }

  void changeDate(String date) {
    this.date.value = date;
  }


  @override
  void onReady() {
    if(isEditing.value == false) addNewItemToRows();
  }
}
