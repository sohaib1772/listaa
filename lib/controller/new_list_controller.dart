import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:listaa/core/constants/app_router_keys.dart';
import 'package:listaa/data/models/category_model.dart';
import 'package:listaa/data/models/item_model.dart';
import 'package:listaa/data/models/shopping_list_model.dart';
import 'package:listaa/data/repositories/category_data.dart';
import 'package:listaa/data/repositories/list_data.dart';

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
  CategoryData categoryData = Get.find<CategoryDataImpl>();
  int selectedCategoryId = 0;
  RxBool isEditing = false.obs;
  List<RowItemsModel> items = [];
  List<CategoryModel> categories = [];
  RxDouble totalAmount = 0.0.obs;
  RxInt selectedPriority = 10.obs;
  RxString date = "".obs;
  RxString time = "".obs;
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
    selectedPriority.value = index;
  }

  void changeDate(String date) {
    this.date.value = date;
  }
  void changeTime(String time) {
    this.time.value = time;
  }

  Future<void> addNewList() async {
    isLoading.value = true;
    await listData.createNewList(
      ShoppingListModel(
        categoryId: selectedCategoryId,
        isDeleted: false,
        title: title.value,
        date: DateTime.tryParse(date.value) ?? DateTime.now(),
        time:time.value.isNotEmpty ? DateTime.parse("0000-00-00${time.value}") : DateTime.now().add(Duration(hours: 12)),
        totalPrice: totalAmount.value,
        priority: selectedPriority.value == 10 ? 0 : selectedPriority.value,
        items: items
            .map(
              (e) => ItemModel(
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

  Future<void> getCategories() async {
    isLoading.value = true;
    categories =  await categoryData.getCategories();
    isLoading.value = false;
  }

  Future<void> delete(int id)async{
    await listData.softDeleteList(id);
  }
  
  @override
  void onInit() async{
   await getCategories();
    if (isEditing.value == false) addNewItemToRows();
    super.onInit();
  }

  @override
  void onReady() {
   
  }
}
