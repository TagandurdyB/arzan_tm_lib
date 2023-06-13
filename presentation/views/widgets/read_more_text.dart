import 'package:flutter/material.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  final Duration duration;
  final TextStyle? style;
  const ReadMoreText({
    this.duration = const Duration(milliseconds: 500),
    this.style,
    required this.text,
    super.key,
  });

  @override
  State<ReadMoreText> createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => isOpen = !isOpen),
      child: AnimatedCrossFade(
        duration: widget.duration,
        firstChild: buidText(3),
        secondChild: buidText(15),
        crossFadeState:
            isOpen ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      ),
    );
  }

  Text buidText(int maxLine) {
    return Text(
      widget.text,
      style: widget.style ??
          const TextStyle(color: Colors.white, overflow: TextOverflow.ellipsis),
      maxLines: maxLine,
    );
  }
}
