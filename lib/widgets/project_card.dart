import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants/colors.dart';
import 'package:portfolio_flutter/constants/projects.dart';
import 'package:portfolio_flutter/utils/url_opener.dart';

class ProjectCard extends StatefulWidget {
  final Project project;
  final double width;
  final bool isMobile;
  const ProjectCard({
    super.key,
    required this.project,
    required this.width,
    this.isMobile = false,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
      },
      onExit: (_) {
        setState(() => _isHovered = false);
      },
      child: InkWell(
        onTapDown: (_) {
          if (widget.isMobile) {
            setState(() => _isHovered = true);
          }
        },
        onTapUp: (_) {
          if (widget.isMobile) {
            setState(() => _isHovered = false);
          }
        },
        onTapCancel: () {
          if (widget.isMobile) {
            setState(() => _isHovered = false);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: (widget.isMobile) ? widget.width * 0.7 : widget.width * 0.4,
          height: 300 + ((widget.isMobile) ? 20 : 0),
          constraints: BoxConstraints(maxWidth: (widget.isMobile) ? 400 : 380),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(widget.project.thumbnail),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              // Blur layer
              AnimatedOpacity(
                duration: const Duration(milliseconds: 150),
                opacity: _isHovered ? 1 : 0,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: Container(color: Colors.black.withValues(alpha: 0.5)),
                ),
              ),

              // Content
              Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.project.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                color: CustomColor.whitePrimary,
                                fontWeight: FontWeight.w600,
                                shadows: _isHovered
                                    ? [
                                        Shadow(
                                          blurRadius: 12,
                                          color: Colors.black.withValues(
                                            alpha: 0.8,
                                          ),
                                          offset: const Offset(0, 3),
                                        ),
                                      ]
                                    : [],
                              ),
                            ),
                            const SizedBox(height: 12),
                            if (_isHovered)
                              Text(
                                widget.project.description,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: CustomColor.whitePrimary,
                                  shadows: _isHovered
                                      ? [
                                          Shadow(
                                            blurRadius: 10,
                                            color: Colors.black.withValues(
                                              alpha: 0.8,
                                            ),
                                            offset: const Offset(0, 3),
                                          ),
                                        ]
                                      : [],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Bottom bar
                  Container(
                    decoration: BoxDecoration(
                      color: CustomColor.purpleTertiary,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            "Available on:",
                            style: TextStyle(
                              fontSize: 14,
                              color: CustomColor.purpleSecondary,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        for (
                          int i = 0;
                          i < widget.project.availablePlatforms.length;
                          i++
                        )
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: InkWell(
                              onTap: () => openUrl(
                                widget.project.availablePlatforms[i].source,
                              ),
                              child: Image.asset(
                                widget.project.availablePlatforms[i].logo,
                                width: 24,
                                height: 24,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
