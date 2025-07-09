import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ragda_news_app/models/news_model.dart';
import 'package:ragda_news_app/routes/app_routes.dart';

class NewsCard extends StatelessWidget {
  final Article article;

  const NewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(),
          const SizedBox(height: 12),
          _buildHeader(),
          const SizedBox(height: 12),
          _buildTitle(),
          const SizedBox(height: 12),
          _buildDescription(),
          const SizedBox(height: 16),
          _buildAuthorSection(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Text(
          article.source.name,
          style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
        Text(' | ', style: TextStyle(color: Colors.grey[500], fontSize: 14)),
        Text(
          _formatDate(article.publishedAt),
          style: TextStyle(color: Colors.grey[500], fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      article.title,
      style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          height: 1.3),
    );
  }

  Widget _buildDescription() {
    if (article.description == null) return const SizedBox.shrink();

    return Text(
      article.description!,
      style: TextStyle(fontSize: 14, color: Colors.grey[700], height: 1.5),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildAuthorSection() {
    return Row(
      children: [
        _buildAuthorAvatar(),
        const SizedBox(width: 12),
        _buildAuthorName(),
        _buildReadMoreButton(),
      ],
    );
  }

  Widget _buildAuthorAvatar() {
    return CircleAvatar(
      radius: 20,
      backgroundImage: NetworkImage(
          _generateAuthorAvatar(article.author ?? 'Unknown Author')),
      backgroundColor: Colors.grey[300],
    );
  }

  Widget _buildAuthorName() {
    return Expanded(
      child: Text(
        article.author ?? 'Unknown Author',
        style: const TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildReadMoreButton() {
    return GestureDetector(
      onTap: _navigateToDetail,
      child: Text(
        'Read More...',
        style: TextStyle(
            fontSize: 16, color: Colors.blue[600], fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildImage() {
    if (article.urlToImage == null) return const SizedBox.shrink();

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        article.urlToImage!,
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: _buildImageError,
      ),
    );
  }

  Widget _buildImageError(
      BuildContext context, Object error, StackTrace? stackTrace) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
      child:
          const Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
    );
  }

  void _navigateToDetail() {
    Get.toNamed(AppRoutes.detailNewsScreen, arguments: article);
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      final day = date.day.toString().padLeft(2, '0');
      final month = _getMonthName(date.month);
      final year = date.year;
      return '$day $month $year';
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
}
