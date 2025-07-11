import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCameraScannerScreen extends StatelessWidget {
  const QrCameraScannerScreen({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: AppColors.appBarBackgroundColor,
        foregroundColor: AppColors.primaryTextColor,
      ),
      body: MobileScanner(
        overlayBuilder: (context, constraints) => Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 300.h,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightBorderColor, width: 2,style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(20),
            color: Colors.transparent,
          ),

        ),
        controller: MobileScannerController(
          autoZoom: true,
          detectionSpeed: DetectionSpeed.noDuplicates, 
        ),
        onDetect: (capture) {
          final barcode = capture.barcodes.first;
          final raw = barcode.rawValue;
          if (raw != null) {
            Get.back(
              result: raw,
            );
          }
        },
      ),
    );
  }
}