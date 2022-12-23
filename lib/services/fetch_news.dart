import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:news_feed/models/news.dart';

class FetchNewsService {
  static const cachedData = 'api-data';
  static const apiKey = '866829a9a85b4ccaae78f4a326b51993';
  static const url =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey';

  static Future<NewsModel>? getNews() async {
    try {
     
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (!(connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi)) {
        final cachedResponse =
            Hive.box(cachedData).get('news', defaultValue: []);

        if (cachedResponse.isNotEmpty) return cachedResponse;
      }
      final response = await http.get(Uri.parse(url));

      switch (response.statusCode) {
        case 200:
          final data = json.decode(response.body);
          Hive.box(cachedData).put('news', data);
          return NewsModel.fromMap(data);
        default:
          throw Exception(response.reasonPhrase);
      }
    } on Exception catch (_) {
      rethrow;
    }
  }
}
