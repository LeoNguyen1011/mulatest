import 'package:fast_rsa/fast_rsa.dart';
import 'package:flutter/services.dart';

Future<String> encryptPIN(String pin) async {
  final publicKey = await rootBundle.loadString('assets/public_key.txt');
  final result = await RSA.encryptPKCS1v15(pin, publicKey);
  return result;
}
