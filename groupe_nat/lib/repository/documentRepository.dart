import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class API_DOCUMENTS {
  static const globalEndpoint = "http://51.75.255.217:4242/";

  static addDocument(String name, File file) async {
    var uri = Uri.parse(globalEndpoint + "document");

    var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));
    var length = await file.length();

    var request = new http.MultipartRequest("POST", uri);
    var multipartFile = new http.MultipartFile('document', stream, length, filename: basename(file.path));

    request.fields['name'] = name;
    request.files.add(multipartFile);
    await request.send();
  }

  static getDocuments() async {
    var uri = Uri.parse(globalEndpoint + "documents");

    var res = await http.get(uri);
    return json.decode(res.body);
  }

  static deleteDocument(id) async {
    var uri = Uri.parse(globalEndpoint + "document/$id");

    var res = await http.delete(uri);
    return json.decode(res.body);
  }
}
