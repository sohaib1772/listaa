import 'package:qr/qr.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrHelper{
  static QrImageView  generateQrCode(String data, double size) {
  return  QrImageView(
  data: data,
  version: QrVersions.auto,
  size: size,
  gapless: false,
);
  }

}