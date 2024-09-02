import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';

class CustomAssetLoader extends AssetLoader {
  final String basePath;

  CustomAssetLoader(this.basePath);

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) async {
    final filePath = '$basePath/${locale.languageCode}-${locale.countryCode}.json';
    print("filePath: $filePath");
    final file = File(filePath);

    if (!await file.exists()) {
      throw Exception('File not found: $filePath');
    }

    final content = await file.readAsString();
    return json.decode(content) as Map<String, dynamic>;
  }
}
