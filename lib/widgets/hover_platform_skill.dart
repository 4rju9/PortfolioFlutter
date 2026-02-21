import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants/colors.dart';

class HoverSkillTile extends StatefulWidget {
  final String title;
  final String imagePath;
  final double width;
  final double margin;
  final EdgeInsetsGeometry? contentPadding;

  const HoverSkillTile({
    super.key,
    required this.title,
    required this.imagePath,
    required this.width,
    this.margin = 0,
    this.contentPadding,
  });

  @override
  State<HoverSkillTile> createState() => _HoverSkillTileState();
}

class _HoverSkillTileState extends State<HoverSkillTile> {
  bool _isHovered = false;

  void _setHover(bool value) {
    if (_isHovered != value) {
      setState(() => _isHovered = value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        onTapDown: (_) => _setHover(true),
        onTapUp: (_) => _setHover(false),
        onTapCancel: () => _setHover(false),
        child: AnimatedContainer(
          width: widget.width,
          margin: EdgeInsets.only(bottom: widget.margin),
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: _isHovered ? CustomColor.purple : CustomColor.bgLight2,
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            contentPadding: widget.contentPadding,
            leading: Image.asset(widget.imagePath, width: 26),
            title: Text(
              widget.title,
              style: TextStyle(
                color: _isHovered ? Colors.white : Colors.white70,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
