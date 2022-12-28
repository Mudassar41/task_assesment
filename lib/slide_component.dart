import 'package:flutter/material.dart';

class SlideComponent extends StatelessWidget {
  final String slideTile;
  final int slideIndex;
  const SlideComponent(
      {super.key, required this.slideTile, required this.slideIndex});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 140, top: 8, bottom: 8),
        child: Text('$slideTile ${slideIndex + 1}'),
      ),
    );
  }
}
