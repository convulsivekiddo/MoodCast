import 'package:flutter/material.dart';
import 'package:spring/spring.dart';

class BubbleButtonWidget extends StatelessWidget {
  BubbleButtonWidget({
    super.key,
    required this.imagePath,
    this.size = 250,
  });

  final String imagePath;
  final _controller = SpringController();
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Spring.bubbleButton(
        springController: _controller,
        onTap: () {
          _controller.play();
        },
        child: Image.asset(imagePath, height: 200.0, width: 200.0),
      ),
    );
  }
}
