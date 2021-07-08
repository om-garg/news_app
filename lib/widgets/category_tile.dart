import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/article_screen.dart';

class CategoryTile extends StatefulWidget {
  final String imgUrl, title, desc, posturl, content;

  CategoryTile({
    required this.imgUrl,
    required this.desc,
    required this.title,
    this.content = "",
    required this.posturl});

  @override
  _CategoryTileState createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ArticleScreen(
              webUrl: widget.posturl,
            )
        ));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              Image.network(widget.imgUrl, width: 150, fit: BoxFit.cover, height: 200,),
              Padding(
                padding: EdgeInsets.only(top: 140),
                child: Container(
                  color: Colors.black38,
                  alignment: Alignment.bottomCenter,
                  width: 150,
                  height: 68,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    child: Column(
                      children: [
                        Text(
                          widget.title,
                          maxLines: 2,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Overpass',
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          widget.desc,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: 'Overpass',
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
