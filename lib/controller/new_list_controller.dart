import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:listaa/core/constants/app_router_keys.dart';
import 'package:listaa/data/models/category_model.dart';
import 'package:listaa/data/models/item_model.dart';
import 'package:listaa/data/models/shopping_list_model.dart';
import 'package:listaa/data/repositories/category_data.dart';
import 'package:listaa/data/repositories/list_data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

class RowItemsModel {
  int id;
  TextEditingController nameController;
  TextEditingController priceController;
  FocusNode focusNode = FocusNode();
  RowItemsModel({
    required this.id,
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
        id: 0,
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
        time:time.value.isNotEmpty ? DateTime.parse("0000-00-00 ${time.value}") : DateTime.now().add(Duration(hours: 12)),
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

  Future<void> updateList(int id) async {
    isLoading.value = true;
    await listData.editList(
      ShoppingListModel(
        id: id,
        categoryId: selectedCategoryId,
        isDeleted: false,
        title: title.value,
        date: DateTime.tryParse(date.value) ?? DateTime.now(),
        time: time.value.isNotEmpty ? DateTime.parse("0000-00-00 ${time.value}") : DateTime.now().add(Duration(hours: 12)),
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
  }

  Future<void> getCategories() async {
    isLoading.value = true;
    categories =  await categoryData.getCategories();
    isLoading.value = false;
  }

  Future<void> delete(int id)async{
    await listData.softDeleteList(id);
  }



  Future<void> shareQrCode({required GlobalKey qrKey}) async {
  try {
    await Future.delayed(const Duration(milliseconds: 100)); // Wait for the frame to be rendered
    await WidgetsBinding.instance.endOfFrame;

    final boundary = qrKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null) {
      Get.snackbar("خطأ", "لم يتم العثور على QR لالتقاطه");
      return;
    }

    final image = await boundary.toImage(pixelRatio: 3.0);
    final byteData = await image.toByteData(format: ImageByteFormat.png);
    final pngBytes = byteData?.buffer.asUint8List();

    if (pngBytes == null) {
      Get.snackbar("خطأ", "تعذر توليد صورة QR");
      return;
    }

    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/qr_code.png').create();
    await file.writeAsBytes(pngBytes);

    await SharePlus.instance.share(
      ShareParams(
        text: 'Listaa QR Code',
        files: [XFile(file.path)],
      )
    );
  } catch (e) {
    // print(e);
    // Get.snackbar("خطأ", "فشل في مشاركة QR: $e");
  }
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
