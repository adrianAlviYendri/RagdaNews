import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ragda_news_app/models/news_model.dart';

class NewsController extends GetxController {
  var isLoading = false.obs;
  var articles = <Article>[].obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  Future<void> fetchNews() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      const baseUrl = 'https://newsapi.org/v2';
      final apiKey = dotenv.env['NEWS_API_KEY'] ?? '';

      final url = Uri.parse(
          '$baseUrl/top-headlines?q=apple&from=2025-07-07&to=2025-07-07&sortBy=popularity&apiKey=$apiKey');

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final newsResponse = NewsResponse.fromJson(jsonData);

        articles.assignAll(newsResponse.articles);
      } else {
        errorMessage.value = 'Failed to load news: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage.value = 'Error: $e';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshNews() async {
    await fetchNews();
  }
}
