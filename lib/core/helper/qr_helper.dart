import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:image_picker/image_picker.dart';
import 'package:listaa/core/constants/app_router_keys.dart';
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
  if(barcode?.barcodes.first.rawValue == null) return null;
  print("barcodes: ${barcode!.barcodes.first.rawValue}");
  return ShoppingListModel.fromJoinedMap(jsonDecode(barcode.barcodes.first.rawValue!));
}

static Future<ShoppingListModel?> scanQrFromCamera()async{
  final barcode = await Get.toNamed(AppRouterKeys.qrCameraScannerScreen);
  if(barcode == null) return null;
  return ShoppingListModel.fromJoinedMap(jsonDecode(barcode!));
} 

}
