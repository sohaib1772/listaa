import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/widgets/app_icons.dart';
import 'package:listaa/data/models/category_model.dart';
import 'package:listaa/data/repositories/category_data.dart';

class CategoryController extends GetxController {
  List<CategoryModel> categories = [];
  CategoryData categoryData = Get.find<CategoryDataImpl>();

  AppIconsName getDeafultCategoryIcon(String title) {
    switch (title) {
      case AppLocaleKeys.holyDaysAndEvents:
        return AppIconsName.event;
      case AppLocaleKeys.fruitsAndVegetable:
        return AppIconsName.fruits;
      case AppLocaleKeys.marketAndOthers:
        return AppIconsName.drink;
      case AppLocaleKeys.public:
        return AppIconsName.all;
      default:
        return AppIconsName.doneList;
    }
  }

  Future<void> getAllCategories() async {
    categories = await categoryData.getCategories();
    update();
  }

  Future<void> addCategory(String title) async {
    if (title.isEmpty) return;
    final category = CategoryModel(title: title, isDefault: false);
    await categoryData.createNewCategory(category);
    categories = await categoryData.getCategories();
    update();
  }

  Future<bool> deleteCategory(int id) async {
    bool isDeleted = await categoryData.deleteCategory(id);
    if (isDeleted) {
      categories = await categoryData.getCategories();
      update();
      return true;
    } else {
      return false;
    }
  }
}
