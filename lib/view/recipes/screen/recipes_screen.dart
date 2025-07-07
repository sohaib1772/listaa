// import 'package:flutter/material.dart';
// import 'package:listaa/core/theme/app_colors.dart';
// import 'package:listaa/core/widgets/scaffold/custom_scaffold.dart';

// class RecipesScreen extends StatelessWidget {
//    RecipesScreen({super.key});
//   final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     return CustomScaffold(
//       scaffoldKey: scaffoldKey,
//       showAppbar: false,
//       showAddListButton: true,
//       body: Container(
//         color: AppColors.allListsScreenBackgroundColor,
//         child: CustomScrollView(
          
//           slivers: [
//             SliverAppBar(
//               pinned: false,
//               elevation: 0,
//               automaticallyImplyLeading: false,
//               backgroundColor: AppColors.allListsScreenBackgroundColor,
//               foregroundColor: AppColors.primaryTextColor,
//               flexibleSpace: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 15.w),
//                 alignment: Alignment.bottomCenter,
//                 decoration: BoxDecoration(
//                   gradient: AppColors.appBarLinerGradient,
//                 ),
//                 child: Row(
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         Get.back();
//                       },
//                       icon: Icon(Icons.arrow_back, color: AppColors.primaryTextColor),
//                     ),
//                     Text(
//                       AppLocaleKeys.lists.tr,
//                       style: AppTextStyles.darkbold28,
//                     ),
                    
//                   ],
//                 ),
//               ),
//             ),
//             // Spacer
//             SliverToBoxAdapter(
//               child: SizedBox(height: 30.h),
//             ),
//             // Home Slider
//             SliverToBoxAdapter(
              
//               child: HomeSelectProiority(),
//             ),
//             SliverToBoxAdapter(
//               child: SizedBox(height: 20.h),
//             ),
//             // uncompleted lists
//             SliverToBoxAdapter(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.w),
//                   child:GetX<HomeController>(
//                           init: controller,
//                           initState: (_) {},
//                           builder: (_) {
//                             return  ListView.separated(
//                       physics:
//                           NeverScrollableScrollPhysics(), 
//                       shrinkWrap: true,
//                       itemCount: controller.lists.value.length,
//                       separatorBuilder: (_, __) => SizedBox(height: 20.h),
//                       itemBuilder: (context, index) {
//                         return ListsCard(
//                               totalPrice: controller.lists[index].totalPrice,
//                               isCompleted: false,
//                               title: controller.lists[index].title,
//                               items: controller.lists[index].items
//                                   .map(
//                                     (e) => ItemCard(
//                                       name: e.name,
//                                       price: e.price,
//                                       isChecked: e.isDone,
//                                       listIndex: index,
//                                       itemId: e.id ?? 0,
//                                       onToggleCheckBox: (){
//                                         controller.toggleIsDone(index, e.id ?? 0);
//                                       },
//                                     ),
//                                   )
//                                   .toList(),
//                               isCollapsed: controller.lists[index].isCollapsed,
//                               index: index,
//                             );
//                           },
//                         );
//                       },
//                     ),
//                 ),
//               ),
//               SliverToBoxAdapter(
//               child: Divider(height: 20.h),
//             ),
//               SliverToBoxAdapter(
//               child: Padding(
//                 padding:  EdgeInsets.symmetric(horizontal:  20.w),
//                 child: Text(AppLocaleKeys.completedLists.tr, style: AppTextStyles.darkbold24,),
//               )
//             ),

//             // completed lists
//             SliverToBoxAdapter(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20.w),


//                   child:GetX<HomeController>(
//                    init: controller,
//                           initState: (_) {},
//                           builder: (_)=> ListView.separated(
//                         physics:
//                             NeverScrollableScrollPhysics(), 
//                         shrinkWrap: true,
//                         itemCount: controller.completedLists.value.length,
//                         separatorBuilder: (_, __) => SizedBox(height: 20.h),
//                         itemBuilder: (context, index) {
//                           return ListsCard(
//                             totalPrice: controller.completedLists[index].totalPrice,
//                             isCompleted: true,
//                             title: controller.completedLists[index].title,
//                             items: controller.completedLists[index].items
//                                 .map(
//                                   (e) => ItemCard(
//                                     name: e.name,
//                                     price: e.price,
//                                     isChecked: e.isDone,
//                                     listIndex: index,
//                                     itemId: e.id ?? 0,
//                                     onToggleCheckBox: (){
//                                       controller.toggleIsDone(index, e.id ?? 0);
//                                     },
//                                   ),
//                                 )
//                                 .toList(),
//                             isCollapsed: controller.completedLists[index].isCollapsed,
//                             index: index,
//                           );
//                         },
//                       ),
//                   ),
//                 ),
//               ),
            
//           ],
//         ),
//       ),
//     );
//   }
// }