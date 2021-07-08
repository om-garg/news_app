import 'package:flutter/material.dart';
import 'package:news_app/screens/tab_screen.dart';
import 'package:news_app/widgets/brand_name.dart';
import 'package:news_app/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = new TextEditingController();
  bool pressed = false;
  late String searchQuery;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: pressed == false
          ? Opacity(
            opacity: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.save,
              ),
            ),
          )
          : null,
          title: Stack (
            children: [
              pressed == false
                  ? BrandName()
                  : SearchBar(
                searchController: searchController,
                onTap: () {
                  setState(() {
                    searchQuery = searchController.text;
                  });
                },
                onBack: (){
                  setState(() {
                    pressed = false;
                    searchController.text = "";
                  });
                },
              ),
              // BrandName(),
            ],
          ),
          actions: [
            pressed == false
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        pressed = !pressed;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                  )
                : Container()
          ],
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.black,
            tabs: [
              Icon(
                Icons.sticky_note_2_outlined,
                color: Colors.black,
              ),
              Text(
                "Business",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Overpass',
                    fontSize: 17,
                ),
              ),
              Text(
                "Entertainment",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Overpass',
                    fontSize: 17,
                ),
              ),
              Text(
                "General",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Overpass',
                    fontSize: 17,
                ),
              ),
              Text(
                "Health",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Overpass',
                    fontSize: 17,
                ),
              ),
              Text(
                "Science",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Overpass',
                    fontSize: 17,
                ),
              ),
              Text(
                "Sports",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Overpass',
                    fontSize: 17,
                ),
              ),
              Text(
                "Technology",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Overpass',
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            searchController.text != "" ? TabScreen(searchQuery: searchQuery) : TabScreen(searchQuery: 'International'),
            // searchController.text != "" ? Text(searchQuery) : Text("Business"),
            TabScreen(searchQuery: 'Business'),
            TabScreen(searchQuery: "Entertainment"),
            TabScreen(searchQuery: "General"),
            TabScreen(searchQuery: "Health"),
            TabScreen(searchQuery: "Science"),
            TabScreen(searchQuery: "Sports"),
            TabScreen(searchQuery: "Technology"),
          ],
        ),
      ),
    );
  }
}
