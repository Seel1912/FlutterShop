import 'package:flutter/material.dart';
import 'package:product_app/widgets/product_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../resources/app_color.dart';

class ImageItem extends StatelessWidget {
  final String imageUrl;
  final double marginContent;
  final double paddingImage;
  final double imageSize;

  const ImageItem(
      {Key? key,
      required this.imageUrl,
      required this.marginContent,
      required this.paddingImage,
      required this.imageSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingImage),
          child: Image.network(
            imageUrl,
            width: imageSize,
            height: imageSize,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 10.0,
          left: 10.0,
          child: Container(
            width: 50.0,
            height: 20.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0xFF59595B),
            ),
            child: const Center(
              child: Text(
                "100",
                style: TextStyle(color: AppColor.neutralWhite),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
