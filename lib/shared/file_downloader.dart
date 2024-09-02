import 'dart:io';
import 'dart:ui';
import 'package:flutter_application_1/support/LocalizeUrl.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class FileDownloader {
  // final String thUrl = 'https://drive.google.com/uc?export=download&id=104vb9Kgt-5LUSA5Rvo14A0LJ-g9FnpnV';
  // final String enUrl = 'https://drive.google.com/uc?export=download&id=1Qn4-CpOxaEVeAsO8f3BKj2GciwMJATyg';

  Future<void> downloadAndSaveJson(String url, String fileName) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/$fileName';
        final file = File(filePath);

        // Ensure directory exists
        await directory.create(recursive: true);

        await file.writeAsBytes(response.bodyBytes);
        print('File downloaded and saved to: $filePath');
      } else {
        print('Failed to download file: ${response.statusCode}');
      }
    } catch (e) {
      print('Error downloading file: $e');
    }
  }

  Future<void> downloadAndSaveAll(List<Locale> locales) async {
    for (Locale locale in locales) {
      Map<String, String> localeData = Localizeurl.getLocaleUrl(locale.toString());
      String url = localeData['url']!;
      String fileName = localeData['fileName']!;
      await ensureFileExists(fileName);
      await downloadAndSaveJson(url, fileName);
    }
  }

  // Future<String> getLocalJsonPath(String fileName) async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   return '${directory.path}/$fileName';
  // }

  Future<void> ensureFileExists(String fileName) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$fileName';
      final file = File(filePath);

      if (!await file.exists()) {
        await file.create(recursive: true);
        print('File created: $filePath');
      } else {
        print('File already exists: $filePath');
      }
    } catch (e) {
      print('Error ensuring file exists: $e');
    }
  }
}
