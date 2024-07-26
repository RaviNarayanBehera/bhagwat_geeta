import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../modal/modal_page.dart';

class GeetaProvider extends ChangeNotifier {
  List<GeetaModal> geetaList = [];

  Future<void> jsonParsing() async {
    String json = await rootBundle.loadString('assets/json/geeta_adhyay.json');

    List users = jsonDecode(json);

    geetaList = users
        .map(
          (e) => GeetaModal.fromJson(e),
        )
        .toList();

    notifyListeners();
  }

  GeetaProvider() {
    jsonParsing();
  }
}
