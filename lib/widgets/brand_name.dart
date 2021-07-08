import 'package:flutter/material.dart';
class BrandName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          ' Flutter ',
          style: TextStyle(
            backgroundColor: Colors.black,
            color: Colors.white,
            fontFamily: 'Overpass',
          ),
        ),
        Text(
          ' News',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Overpass'
          ),
        )
      ],
    );
  }
}
