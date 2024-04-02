import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plant_deseases_client/models/llm_item.dart';

class LlmProvider with ChangeNotifier {
  List<LlmItem> _items = [];
  final url = 'http://localhost:8080/llm';
  // final url = 'http://10.0.2.2:5000/todo';

  List<LlmItem> get items {
    return [..._items];
  }

  Future<void> addAnswer() async {
    // Map<String, dynamic> request = {
    //   "answer": "Scrivimi qualcosa di divertente",
    // };
    final headers = {'Content-Type': 'application/json'};
    final response = await http.post(Uri.parse(url), headers: headers);
    // Map<String, dynamic> responsePayload = json.decode(response.body);
    // final answ =
    //     LlmItem(id: responsePayload["id"], answer: responsePayload["answer"]);
  }

  Future<void> getAnswer() async {
    var response;
    try {
      response = await http.get(Uri.parse(url));
      List<dynamic> body = json.decode(response.body);
      _items = body
          .map(
            (e) => LlmItem(
              id: e['id'],
              answer: e['answer'],
            ),
          )
          .toList();
    } catch (e) {
      print(e);
    }

    notifyListeners();
  }
}
