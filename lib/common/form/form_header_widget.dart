import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    Key? key,
    this.imageColor,
    this.heightBetween,
    required this.image,
    required this.title,
    required this.subTitle,
    this.imageHeight = 0.1,
    this.textAlign,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);

  //Variables -- Declared in Constructor
  final Color? imageColor;
  final double imageHeight;
  final double? heightBetween;
  final String image, title, subTitle;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            image: AssetImage(image),
            color: imageColor,
            height: size.height * imageHeight,
            width: size.width),

        SizedBox(height: 20),
        Text(title,
            textAlign: textAlign,
            style: Theme.of(context).textTheme.titleLarge),
        // Text("Chào mừng bạn quay trờ lại",
        //     style: Theme.of(context).textTheme.labelMedium),
      ],
    );
  }
}
