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

class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({super.key});

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
                      AppLocaleKeys.aboutUs.tr,
                      style: AppTextStyles.darkbold28,
                    ),
                  ],
                ),
              ),
            ),
        
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     Image.asset("assets/images/logo.png",height: 100.h),
                     SizedBox(height: 30.h),
                    // English About Us
                    Text("Who We Are", style: AppTextStyles.darkbold20 ),
                    SizedBox(height: 10.h),
                    Text(
                      """We are an independent and specialized software development team comprised of highly skilled professionals in the fields of mobile and web development. Our mission is to deliver advanced digital solutions tailored to meet the evolving needs of businesses and individuals, utilizing the latest technologies and best practices in frameworks such as Flutter, Laravel, and other modern stacks.
        We believe that effective collaboration, structured planning, and technical adaptability are key to building world-class software products.""",
                      style: AppTextStyles.darkbold16,
                    ),
        
                    Divider(),
                    // Arabic About Us
                    Text("من نحن", style: AppTextStyles.darkbold20),
                    SizedBox(height: 10.h),
                    Text(
                      """نحن فريق تقني مستقل يضم نخبة من المطورين والمتخصصين في مجالات تطوير البرمجيات وتكنولوجيا المعلومات. نكرّس جهودنا لتصميم وتطوير حلول رقمية متقدمة تلبي احتياجات المؤسسات والأفراد، وذلك من خلال توظيف أحدث التقنيات والمنهجيات في مجالات تطوير التطبيقات باستخدام Flutter وLaravel.
        
        نطمح إلى صناعة تطبيقات تُحدث فرقًا حقيقيًا في تجربة المستخدم وتلبي احتياجات السوق بكفاءة واحترافية.""",
                      style: AppTextStyles.darkbold16,
                      textDirection: TextDirection.rtl,
                    ),
                    Divider(),
                    Center(
                      child: GestureDetector(
                        onTap: () async {
                          await launchUrl(
                            Uri.parse(
                              'https://www.facebook.com/profile.php?id=61574398940734',
                            ),
                            mode: LaunchMode.externalApplication,
                          );
                        },
                        child: Text(
                          textAlign: TextAlign.center,
                          'Devnest Team',
                          style: AppTextStyles.darkbold16.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Column(
                        children: [
                           TeamMember(
                      name: "Sohiab Kamel – Team Manager & Flutter Developer",
                      url:
                          "https://www.linkedin.com/in/sohaib-kamel-863785347/",
                    ),
                    TeamMember(
                      name: "Mohammed Almostfa – Co-Leader & Laravel Developer",
                      url: "https://www.linkedin.com/in/mohammed-almostfa-63b3a7240/",
                    ),
                    TeamMember(
                      name: "Moayyad Nagib – Flutter Developer",
                      url: "https://www.linkedin.com/in/moayyad-nagib-374151238/",
                    ),
                    TeamMember(
                      name: "Azeddine Miche – UI/UX Designer",
                      url: "https://www.linkedin.com/in/azzeddinemiche1998/",
                    ),
                        ]
                      )
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
