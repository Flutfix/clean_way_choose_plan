import 'package:flutter/material.dart';

class GradientButton extends StatefulWidget {
  final String? text;
  final Function() onTap;
  final Color startColor;
  final Color endColor;
  final RichText? richText;

  const GradientButton({
    Key? key,
    this.text,
    required this.onTap,
    required this.startColor,
    required this.endColor,
    this.richText,
  }) : super(key: key);

  @override
  _GradientButtonState createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  widget.startColor,
                  widget.endColor,
                ])),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: widget.richText ?? Text(
              widget.text ?? 'Продолжить',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
