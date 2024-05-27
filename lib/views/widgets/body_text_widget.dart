import 'package:flutter/material.dart';
import 'package:terza_spiaggia_web/views/widgets/styles.dart';

class BodyTextWidget extends StatelessWidget {
  const BodyTextWidget({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 4,
      textAlign: TextAlign.start,
      style: TextStyles.truncatedTextBodyStyle(context, color),
    );
  }
}