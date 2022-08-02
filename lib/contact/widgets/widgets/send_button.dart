import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class SendButton extends StatefulWidget {
  const SendButton({Key? key, required this.ontap}) : super(key: key);

  final Function() ontap;

  @override
  State<SendButton> createState() => _SendButtonState();
}

class _SendButtonState extends State<SendButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      onHover: (val) {
        setState(() {
          isHovered = val;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xfff1f1f1),
            width: 1.5,
          ),
          gradient: LinearGradient(
            colors: const [
              Color(0xfff1f1f1),
              Color(0xfff1f1f1),
            ],
            tileMode: TileMode.decal,
            end: isHovered ? Alignment.bottomRight : Alignment.centerLeft,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
        child: Text(
          'Send',
          style: AppTypography.boldBodyTextstyle.copyWith(
            color: isHovered ? AppColors.primaryColor : const Color(0xfff1f1f1),
          ),
        ),
      ),
    );
  }
}
