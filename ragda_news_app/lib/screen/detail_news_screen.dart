import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ragda_news_app/models/news_model.dart';

class DetailNewsScreen extends StatelessWidget {
  const DetailNewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Article article = Get.arguments as Article;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Detail News',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSourceAndDate(article),
            const SizedBox(height: 16),
            _buildTitle(article),
            const SizedBox(height: 16),
            _buildDescription(article),
            const SizedBox(height: 20),
            _buildAuthorInfo(article),
            const SizedBox(height: 24),
            _buildArticleImage(article),
            const SizedBox(height: 24),
            _buildContent(article),
          ],
        ),
      ),
    );
  }

  Widget _buildSourceAndDate(Article article) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          article.source.name,
          style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
        Text(
          _formatDate(article.publishedAt),
          style: TextStyle(color: Colors.grey[500], fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildTitle(Article article) {
    return Text(
      article.title,
      style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
          height: 1.3),
    );
  }

  Widget _buildDescription(Article article) {
    return article.description != null
        ? Text(
            article.description!,
            style:
                TextStyle(fontSize: 16, color: Colors.grey[700], height: 1.5),
          )
        : const SizedBox.shrink();
  }

  Widget _buildAuthorInfo(Article article) {
    final authorName = article.author ?? 'Unknown Author';
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(_generateAuthorAvatar(authorName)),
          backgroundColor: Colors.grey[300],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                authorName,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87),
              ),
              const SizedBox(height: 2),
              Text(
                '${authorName.toLowerCase().replaceAll(' ', '')}@gmail.com',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildArticleImage(Article article) {
    return article.urlToImage != null
        ? ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              article.urlToImage!,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 250,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12)),
                child: const Icon(Icons.image_not_supported,
                    size: 50, color: Colors.grey),
              ),
            ),
          )
        : const SizedBox.shrink();
  }

  Widget _buildContent(Article article) {
    return article.content != null
        ? Text(
            _cleanContent(article.content!),
            style: const TextStyle(
                fontSize: 16, color: Colors.black87, height: 1.6),
          )
        : const SizedBox.shrink();
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return '${date.day.toString().padLeft(2, '0')} ${_getMonthName(date.month)} ${date.year}';
    } catch (e) {
      return dateString;
    }
  }

  String _getMonthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }

  String _generateAuthorAvatar(String authorName) {
    final encodedName = Uri.encodeComponent(authorName);
    return 'https://image.pollinations.ai/prompt/professional%20headshot%20portrait%20of%20$encodedName%20journalist%20reporter%20news%20anchor%20clean%20background%20realistic%20photo';
  }

  String _cleanContent(String content) {
    return content
        .replaceAll(RegExp(r'\[\+\d+\s+chars\]'), '')
        .replaceAll(RegExp(r'\[.*?\]'), '')
        .trim()
        .ifEmpty(() => 'Full content not available.');
  }
}

extension StringExtension on String {
  String ifEmpty(String Function() defaultValue) =>
      isEmpty ? defaultValue() : this;
}
