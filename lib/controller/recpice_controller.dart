import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:listaa/controller/home_controller.dart';
import 'package:listaa/data/models/shopping_list_model.dart';
import 'package:listaa/data/repositories/list_data.dart';
import 'package:listaa/data/repositories/recipe_data.dart';

class RecipeController extends GetxController{

    RecipeData recipeData = Get.find<RecipeDataImpl>();
    ListData listData = Get.find<ListDataImpl>();
    RxList<ShoppingListModel> recipes = <ShoppingListModel>[].obs;
    Future<void> getAllRecipes()async{
    recipes.value =  await recipeData.getRecipes();
    update();
  }
  Future<void> deleteRecipe(int id)async{
    await listData.softDeleteList(id);
    await getAllRecipes();
  }

  @override
  void onInit() async{
    await getAllRecipes();
    super.onInit();
  }
}