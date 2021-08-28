import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/models/search_news_model.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/widgets/category_tile.dart';
import 'package:news_app/widgets/news_tile.dart';

class TabScreen extends StatefulWidget {
  final String searchQuery;
  const TabScreen({
    required this.searchQuery,
  });

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  String apiKey = "d605e6f22f1f4837aca28cd537d89733";
  List<NewsModel> news = [];
  List<SearchNewsModel> blog = [];
  TextEditingController searchController = new TextEditingController();
  getCategoryNews(String query) async {
    var response = await http.get(
        Uri.parse(
            "https://newsapi.org/v2/everything?q=$query&apiKey=d605e6f22f1f4837aca28cd537d89733"),
        headers: {"Authorization": apiKey});
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null &&
            element['description'] != null &&
            element['title'] != null &&
            element["url"] != null) {
          NewsModel newsModel = NewsModel(
            title: element['title'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            articleUrl: element["url"],
          );
          news.add(newsModel);
        }
      });
    }
    setState(() {});
  }

  getTrendingNews() async {
    var response = await http.get(
        Uri.parse(
            "https://newsapi.org/v2/top-headlines?country=in&apiKey=d605e6f22f1f4837aca28cd537d89733"),
        headers: {"Authorization": apiKey});
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null &&
            element['description'] != null &&
            element['title'] != null &&
            element["url"] != null) {
          SearchNewsModel searchNewsModel = SearchNewsModel(
            title: element['title'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            articleUrl: element["url"],
          );
          blog.add(searchNewsModel);
        }
      });
    }
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNews(widget.searchQuery);
    getTrendingNews();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 21, vertical: 15),
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: news.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return FutureBuilder(
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                      return CategoryTile(
                        imgUrl: news[index].urlToImage,
                        title: news[index].title,
                        posturl: news[index].articleUrl,
                        desc: news[index].description,
                      );
                  },
                  future: getCategoryNews(widget.searchQuery),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 21.0),
            child: Text(
              "For you",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Overpass',
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              itemCount: blog.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return NewsTile(
                  imgUrl: blog[index].urlToImage,
                  title: blog[index].title,
                  posturl: blog[index].articleUrl,
                  desc: blog[index].description,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
