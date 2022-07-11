import 'package:flutter/material.dart';

class PhotoField extends StatelessWidget {
  const PhotoField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
      ),
      child: Icon(
        Icons.camera_alt,
      ),
    );
  }
}
