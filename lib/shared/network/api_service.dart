import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

class ApiService {
  static Future<String?> sendImage(String filePath) async {
    var uri = Uri.parse('http://192.168.1.105:8000/detect/');
    var request = http.MultipartRequest('POST', uri);

    // File to be sent
    File file = File(filePath);

    // Add the file to the request
    var mimeType = lookupMimeType(file.path);
    var multipartFile = await http.MultipartFile.fromPath('files', file.path,
        contentType: MediaType.parse(mimeType!));
    request.files.add(multipartFile);

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        var jsonResponse = json.decode(responseBody);
        return jsonResponse[0]['class'];
      } else {
        return 'Request failed with status: ${response.statusCode}';
      }
    } catch (e) {
      return 'Error sending request: $e';
    }
  }
}
