import 'package:flutter/material.dart';
import 'package:flutter_http/ui/article_web_view.dart';

import '../data/model/article.dart';

class ArticleDetailPage extends StatelessWidget {
  static const routeName = '/article_detail';

  final Article article;

  const ArticleDetailPage(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nama App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
                tag: article.urlToImage,
                child: Image.network(article.urlToImage)
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.description,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Divider(color: Colors.grey),
                    Text(
                      article.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Divider(color: Colors.grey),
                    Text(
                      'Date: ${article.publishedAt}',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Author: ${article.author}',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Divider(color: Colors.grey),
                    Text(
                      article.content ?? "",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      child: Text('Read More'),
                      onPressed: () {
                        Navigator.pushNamed(context, ArticleWebView.routeName,
                          arguments: article.url);
                      },
                    ),
                  ],
                ),
            )
          ],
        ),
      ),
    );
  }
}