import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:image_picker/image_picker.dart';
import 'package:listaa/controller/new_list_controller.dart';
import 'package:listaa/core/constants/app_router_keys.dart';
import 'package:listaa/core/localization/locale.dart';
import 'package:listaa/core/services/my_services.dart';
import 'package:listaa/core/theme/app_colors.dart';
import 'package:listaa/core/theme/app_text_styles.dart';
import 'package:listaa/core/widgets/app_buttons.dart';
import 'package:listaa/data/models/shopping_list_model.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr/qr.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrHelper {
  static QrImageView generateQrCode(String data, double size) {
    return QrImageView(
      data: data,
      version: QrVersions.auto,
      size: size,
      gapless: false,
    );
  }

  static Future<ShoppingListModel?> scanQrFromImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return null;

    final barcode = await MobileScannerController().analyzeImage(
      File(pickedFile.path).path,
    );
    if (barcode?.barcodes.first.rawValue == null) return null;
    print("barcodes: ${barcode!.barcodes.first.rawValue}");
    return ShoppingListModel.fromJoinedMap(
      jsonDecode(barcode.barcodes.first.rawValue!),
    );
  }

  static Future<ShoppingListModel?> scanQrFromCamera() async {
    final barcode = await Get.toNamed(AppRouterKeys.qrCameraScannerScreen);
    if (barcode == null) return null;
    return ShoppingListModel.fromJoinedMap(jsonDecode(barcode!));
  }

  static void showBottomSheet(
    ShoppingListModel? model,
    Function(GlobalKey qrKey) onShare,
    GlobalKey qrKey,
  ) {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: AppColors.allListsScreenBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            RepaintBoundary(
              key: qrKey,
              child: Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  gradient: AppColors.containerLinerGradient,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  children: [
                    QrHelper.generateQrCode(json.encode(model!.toMap()), 200),
                    SizedBox(height: 20.h),
                    Text(
                      AppLocaleKeys.listaApp.tr,
                      style: AppTextStyles.darkbold20,
                    ),
                    SizedBox(height: 10.h),
                    Text(model.title.tr, style: AppTextStyles.darkbold16),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            AppTextButtons(
              text: AppLocaleKeys.share.tr,
              onPressed: () {
                onShare(qrKey);
              },
            ),
          ],
        ),
      ),
    );
  }

  static void scanQrBottomSheet() async {
    bool isGranted = await Get.find<MyServices>().requestPermission();
    if (!isGranted) {
      return;
    }
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.addNewListBottomSheetBackgroundColor,

          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextButtons(
              text: AppLocaleKeys.qrByCamera.tr,
              onPressed: () async {
                ShoppingListModel? model = await QrHelper.scanQrFromCamera();
                if (model != null) {
                  Get.toNamed(
                    AppRouterKeys.newList,
                    arguments: {"model": model, "qr": true},
                  );
                }
              },
            ),
            Divider(),
            AppTextButtons(
              text: AppLocaleKeys.qrByImages.tr,
              onPressed: () async {
                ShoppingListModel? model = await QrHelper.scanQrFromImage();
                if (model != null) {
                  Get.toNamed(
                    AppRouterKeys.newList,
                    arguments: {"model": model, "qr": true},
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
