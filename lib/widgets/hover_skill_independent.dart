import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants/colors.dart';

class HoverSkillIndependent extends StatefulWidget {
  final String title;
  final String imagePath;
  final bool isMobile;

  const HoverSkillIndependent({
    super.key,
    required this.title,
    required this.imagePath,
    required this.isMobile,
  });

  @override
  State<HoverSkillIndependent> createState() => _HoverSkillIndependent();
}

class _HoverSkillIndependent extends State<HoverSkillIndependent> {
  bool _isHovered = false;

  void _setHover(bool value) {
    if (_isHovered != value) {
      setState(() => _isHovered = value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _setHover(true),
      onExit: (_) => _setHover(false),
      child: InkWell(
        onTapDown: (_) {
          if (widget.isMobile) _setHover(true);
        },
        onTapUp: (_) {
          if (widget.isMobile) _setHover(false);
        },
        onTapCancel: () {
          if (widget.isMobile) _setHover(false);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          child: Chip(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            label: Text(
              widget.title,
              style: TextStyle(
                color: _isHovered ? CustomColor.purpleSecondary : Colors.white,
              ),
            ),
            avatar: Image.asset(widget.imagePath),
            backgroundColor: _isHovered
                ? CustomColor.purple
                : CustomColor.bgLight2,
          ),
        ),
      ),
    );
  }
}
