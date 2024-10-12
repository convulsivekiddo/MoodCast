import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatefulWidget {
  final double? size;
  final double? strokeWidth;

  const ProgressIndicatorWidget({
    super.key,
    this.size = 30.0,
    this.strokeWidth = 8,
  });

  @override
  _ProgressIndicatorWidgetState createState() =>
      _ProgressIndicatorWidgetState();
}

class _ProgressIndicatorWidgetState extends State<ProgressIndicatorWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: 1 + (_controller.value * 0.5),
            child: SizedBox(
              height: widget.size,
              width: widget.size,
              child: const CircularProgressIndicator(
                value: null,
                strokeWidth: 8.0,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
