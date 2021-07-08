import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final TextEditingController searchController;
  final VoidCallback onTap;
  final VoidCallback onBack;
  const SearchBar({
    required this.searchController,
    required this.onTap,
    required this.onBack,
  });

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: widget.onBack,
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),

        Expanded(
          child: TextField(
            controller: widget.searchController,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: 'search news',
              focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                  BorderSide(
                      color: Colors.black,
                  width:3,
                  )),
            ),
            keyboardType: TextInputType.text,
          ),
        ),
        GestureDetector(
          onTap: widget.onTap,
          child: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
