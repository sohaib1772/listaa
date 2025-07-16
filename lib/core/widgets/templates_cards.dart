import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:listaa/core/constants/app_router_keys.dart';
import 'package:listaa/core/helper/templates_helper.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/app_buttons.dart';
import 'package:listaa/data/models/shopping_list_model.dart';

class TemplateCard extends StatelessWidget {
  TemplateCard({super.key, required this.model,this.width = 327,this.height = 200});
  ShoppingListModel model;
  double width;
  double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(TemplatesHelper.getImage(model.title)),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(115),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
       alignment: AlignmentDirectional.bottomStart,
        children: [
          
          Positioned(
            top: 10.h,
            child: SizedBox(
              height: height.h,
              width: 150.w,
              child: Text(model.title.tr, style: AppTextStyles.darkbold24)),
          ),
          Positioned(
            bottom: 10.h,
            child: AppTextButtonsWithIcon(
              width: 200.w,
              onPressed: () {
                Get.toNamed(
                  AppRouterKeys.newList,
                  arguments: {"model": model, "qr": true},
                );
              },
              type: AppButtonType.floatingButton,
              text: AppLocaleKeys.goNow.tr,
              icon: Icons.arrow_forward_rounded,
            ),
          ),
        ],
      ),
    );
  }
}

class TemplatesCardsMini extends StatelessWidget {
   TemplatesCardsMini({super.key,required this.model});
  ShoppingListModel model;
  @override
  Widget build(BuildContext context) {
    return Stack(
                                    alignment: AlignmentDirectional.bottomStart,
                                    children: [
                                      Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Get.toNamed(
                                                AppRouterKeys.newList,
                                                arguments: {
                                                  "model": model,
                                                  "qr": true,
                                                },
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(
                                                  20.r,
                                                ),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                    
                                                    TemplatesHelper.getImage(
                                                     model
                                                          .title,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              margin: EdgeInsets.symmetric(
                                                horizontal: 10.w,
                                              ),
                                              height: 130.h,
                                              width: 250.w,
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 10.w,
                                            ),
                                            width: 250.w,
                                            child: Row(
                                              children: [
                                                Text(
                                                  model
                                                      .title.tr,
                                                ),
                                                Spacer(),
                                                Icon(Icons.list),
                                                Text(
                                                 model
                                                      .items
                                                      .length
                                                      .toString(),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Positioned(
                                        bottom:40 ,
                                       
                                        child: Container(
                                          margin: EdgeInsets.symmetric(horizontal: 20.w),
                                          height: 60,
                                          child: AppTextButtonsWithIcon(
                                            icon: Icons.arrow_forward_rounded,
                                            type: AppButtonType.floatingButton,
                                            width: 170,
                                            
                                            text: AppLocaleKeys.goNow.tr, onPressed: (){
                                             Get.toNamed(
                                                    AppRouterKeys.newList,
                                                    arguments: {
                                                      "model": model,
                                                      "qr": true,
                                                    },
                                                  );
                                          }),
                                        ),
                                      )
                                    ],
                                  );
  }
}
