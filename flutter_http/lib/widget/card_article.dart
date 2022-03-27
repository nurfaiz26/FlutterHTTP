import 'package:flutter/material.dart';
import 'package:flutter_http/ui/article_detail_page.dart';

import '../data/model/article.dart';

class CardArticle extends StatelessWidget {
  final Article article;

  const CardArticle({required this.article});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: ListTile(
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Hero(
          tag: article.urlToImage!,
          child: Image.network(
            article.urlToImage!,
            width: 100,
          ),
        ),
        title: Text(
          article.title,
        ),
        subtitle: Text(article.author!),
        onTap: () => Navigator.pushNamed(
            context,
            ArticleDetailPage.routeName,
            arguments: article,
        ),
      ),
    );
  }
}