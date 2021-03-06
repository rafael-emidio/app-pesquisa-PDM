import 'dart:io';
import 'package:flutter/material.dart';

class ExibeImage extends StatelessWidget {
  final File arquivo;
  ExibeImage({Key key, this.arquivo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24),
      child: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.file(
              arquivo,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
