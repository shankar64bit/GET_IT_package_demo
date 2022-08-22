import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:get_it_package_demo/domain/models/meme.dart';
// ignore: depend_on_referenced_packages

class MemeRepo {
  Future<Meme> getMeme() async {
    String url = "https://some-random-api.ml/meme";
    // Map<String, dynamic> urlsdb =
    //     'https://some-random-api.ml/meme' as Map<String, dynamic>;
    http.Response response = await http.get(Uri.parse(url));
    Map<String, dynamic> singleMemeJson = jsonDecode(response.body);
    print(singleMemeJson);
    return Meme.fromJson(singleMemeJson);
  }
}
