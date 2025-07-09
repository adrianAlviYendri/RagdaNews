import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ragda_news_app/controllers/news_controller.dart';
import 'package:ragda_news_app/widgets/news_card.dart';

class NewsScreen extends GetView<NewsController> {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('News',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.white)),
        backgroundColor: const Color(0xFF5A8DEE),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
              child: CircularProgressIndicator(color: Color(0xFF5A8DEE)));
        }

        if (controller.errorMessage.isNotEmpty) {
          return _buildErrorState();
        }

        if (controller.articles.isEmpty) {
          return const Center(child: Text('No news available'));
        }

        return _buildNewsList();
      }),
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
          const SizedBox(height: 16),
          Text(
            'Error: ${controller.errorMessage}',
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => controller.refreshNews(),
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5A8DEE)),
            child: const Text('Retry', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsList() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: RefreshIndicator(
          onRefresh: () => controller.refreshNews(),
          color: const Color(0xFF5A8DEE),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Breaking News',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                      Icon(Icons.search, size: 28, color: Colors.grey[600]),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final article = controller.articles[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: NewsCard(article: article),
                    );
                  },
                  childCount: controller.articles.length,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
