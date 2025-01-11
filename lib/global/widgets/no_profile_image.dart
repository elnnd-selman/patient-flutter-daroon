import 'package:flutter/material.dart';

class NoProfileImage extends StatelessWidget {
  final double height;
  final double width;
  final BoxShape? shape;
  final Color? containerColor;
  final BoxFit? boxFit;
  final String imageUrl;

  const NoProfileImage({
    super.key,
    required this.height,
    this.shape = BoxShape.rectangle,
    this.containerColor = Colors.black54,
    required this.width,
    this.boxFit = BoxFit.cover,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: containerColor,
        shape: shape!,
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: boxFit,
        ),
      ),
    );
  }
}
