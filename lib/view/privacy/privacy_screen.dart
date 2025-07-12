import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/scaffold/custom_scaffold.dart';
import 'package:listaa/view/about_us/widgets/team_member.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyScreen extends StatelessWidget {
  PrivacyScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffoldKey: scaffoldKey,
      showAppbar: false,
      showAddListButton: false,
      body: Container(
        color: AppColors.allListsScreenBackgroundColor,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: false,
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              foregroundColor: AppColors.primaryTextColor,
              flexibleSpace: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  gradient: AppColors.appBarLinerGradient,
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                    Text(
                      AppLocaleKeys.privacyPolicy.tr,
                      style: AppTextStyles.darkbold28,
                    ),
                  ],
                ),
              ),
            ),
        SliverToBoxAdapter(
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Directionality(textDirection: TextDirection.ltr, child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Privacy Policy", style: AppTextStyles.darkbold20),
        SizedBox(height: 10.h),
        Text("Last updated: 12 July 2025", style: AppTextStyles.lightDarkbold16),
        SizedBox(height: 20.h),

        Text("1. Information We Do NOT Collect", style: AppTextStyles.darkbold20),
        Text("We do not collect, store, or transmit any personal data to any external server. The app works 100% offline.", style: AppTextStyles.lightDarkbold16),
        SizedBox(height: 16.h),

        Text("2. Permissions We Use", style: AppTextStyles.darkbold20),
        Text("• Camera: Used only when you scan a QR code.\n"
             "• Photos / Media: Used only when you share or import QR.\n"
             "• Notifications: To send scheduled reminders.\n"
             "• Background Tasks: To trigger reminders in background.\n"
             "• Internet/URL Launcher: Only used to open email or team profile links.", style: AppTextStyles.lightDarkbold16),
        SizedBox(height: 16.h),

        Text("3. How We Use Your Data", style: AppTextStyles.darkbold20),
        Text("All data like shopping lists and products are saved only on your device. We do not upload or share it.", style: AppTextStyles.lightDarkbold16),
        SizedBox(height: 16.h),

        Text("4. Data Security", style: AppTextStyles.darkbold20),
        Text("We recommend using device lock (PIN or fingerprint) to protect your data. QR sharing is under your control.", style: AppTextStyles.lightDarkbold16),
        SizedBox(height: 16.h),

        Text("5. Third-Party Services", style: AppTextStyles.darkbold20),
        Text("We do not use ads, analytics, or any third-party data tools.", style: AppTextStyles.lightDarkbold16),
        SizedBox(height: 16.h),

        Text("6. Children’s Privacy", style: AppTextStyles.darkbold20),
        Text("The app is not intended for children under 13. No data is knowingly collected from children.", style: AppTextStyles.lightDarkbold16),
        SizedBox(height: 16.h),

        Text("7. Changes to This Policy", style: AppTextStyles.darkbold20),
        Text("If we change the policy, we will update the date above. Please check this page regularly.", style: AppTextStyles.lightDarkbold16),
        SizedBox(height: 16.h),

        Text("8. Contact Us", style: AppTextStyles.darkbold20),
        Text("If you have questions:\nEmail: devnest.te@gmail.com ", style: AppTextStyles.lightDarkbold16),

          ]
        )),
        SizedBox(height: 32.h),
        Divider(),
        SizedBox(height: 16.h),
Directionality(
  textDirection: TextDirection.rtl,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      
        Text("سياسة الخصوصية", style: AppTextStyles.darkbold20),
        SizedBox(height: 10.h),
        Text("آخر تحديث: 12 يوليو 2025", style: AppTextStyles.lightDarkbold16),
        SizedBox(height: 20.h),

        Text("١. المعلومات التي لا نقوم بجمعها", style: AppTextStyles.darkbold20),
        Text("نحن لا نقوم بجمع أو تخزين أو إرسال أي بيانات شخصية إلى أي خادم خارجي. يعمل التطبيق بالكامل بدون اتصال بالإنترنت.", style: AppTextStyles.lightDarkbold16),
        SizedBox(height: 16.h),

        Text("٢. الأذونات التي نستخدمها", style: AppTextStyles.darkbold20),
        Text("• الكاميرا: تُستخدم فقط عند مسح رمز QR.\n"
             "• الصور / الوسائط: تُستخدم فقط عند مشاركة أو استيراد رمز QR.\n"
             "• الإشعارات: لإرسال تذكير بالقوائم المجدولة.\n"
             "• العمل في الخلفية: لتفعيل الإشعارات حتى لو كان التطبيق مغلقًا.\n"
             "• الإنترنت / فتح الروابط: لفتح بريد الفريق أو صفحته فقط.", style: AppTextStyles.lightDarkbold16),
        SizedBox(height: 16.h),

        Text("٣. كيف نستخدم بياناتك", style: AppTextStyles.darkbold20),
        Text("جميع البيانات مثل القوائم والعناصر يتم حفظها محليًا على جهازك فقط، ولا يتم إرسالها لأي جهة أخرى.", style: AppTextStyles.lightDarkbold16),
        SizedBox(height: 16.h),

        Text("٤. أمان البيانات", style: AppTextStyles.darkbold20),
        Text("ننصح باستخدام قفل الجهاز (بصمة أو رمز) لحماية معلوماتك. مشاركة رموز QR هي تحت سيطرتك.", style: AppTextStyles.lightDarkbold16),
        SizedBox(height: 16.h),

        Text("٥. خدمات الطرف الثالث", style: AppTextStyles.darkbold20),
        Text("لا نستخدم إعلانات، أو أدوات تحليلات، أو أي أدوات تتبع.", style: AppTextStyles.lightDarkbold16),
        SizedBox(height: 16.h),

        Text("٦. خصوصية الأطفال", style: AppTextStyles.darkbold20),
        Text("هذا التطبيق غير موجه للأطفال تحت سن 13 سنة. ولا نقوم بجمع أي معلومات منهم.", style: AppTextStyles.lightDarkbold16),
        SizedBox(height: 16.h),

        Text("٧. التعديلات على هذه السياسة", style: AppTextStyles.darkbold20),
        Text("في حال قمنا بتعديل السياسة، سيتم تحديث التاريخ أعلاه. الرجاء مراجعة هذه الصفحة من وقت لآخر.", style: AppTextStyles.lightDarkbold16),
        SizedBox(height: 16.h),

        Text("٨. تواصل معنا", style: AppTextStyles.darkbold20),
        Text("إذا كان لديك أي استفسار:\nالبريد: devnest.te@gmail.com", style: AppTextStyles.lightDarkbold16),
        SizedBox(height: 30.h),
    ],
  ),
)
      ],
    ),
  ),
),
          ],
        ),
      ),
    );
  }
}
