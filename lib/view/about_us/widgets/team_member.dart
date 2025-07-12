import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/app_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamMember extends StatelessWidget {
   TeamMember({super.key,
   required this.name,
   required this.url
   });
  String name;
  String url;
  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: EdgeInsets.symmetric(vertical: 6.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
          child: AppIcons(icon: AppIconsName.linkedin, size: 44.sp),
        ),
        SizedBox(width: 10.w),
        SizedBox(

          width: 250.w,
          child: Text(
textAlign: TextAlign.end,
            name,
            style: AppTextStyles.darkbold16,
          ),
        ),
      ],
    ),
  );
}
}