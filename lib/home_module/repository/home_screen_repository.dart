import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:oro_sample/utils/network.dart';

abstract class StoredItemRepo {
  Future<List<dynamic>> getStoredItemList();
}

class StoredItemServices implements StoredItemRepo {
  List imagesUrlStored = [];

  @override
  Future<List<dynamic>> getStoredItemList() async {
    var jsonData = await http.get(imageJsonUrl);
    if (jsonData.body.isNotEmpty) {
      for (var element in jsonDecode(jsonData.body)) {
        imagesUrlStored.add(element['url']);
      }
    }
    return imagesUrlStored;
  }
}
