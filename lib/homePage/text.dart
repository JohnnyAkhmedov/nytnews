import 'package:flutter/material.dart';

class TextPlace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.5, 0.3),
      child: Text('Explore the world with the latest news.',
          style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              backgroundColor: Colors.black26)),
    );
  }
}
