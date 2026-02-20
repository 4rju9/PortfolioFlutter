import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants/colors.dart';
import 'package:portfolio_flutter/constants/projects.dart';
import 'package:portfolio_flutter/constants/size.dart';
import 'package:portfolio_flutter/widgets/about_me.dart';
import 'package:portfolio_flutter/widgets/contact_section.dart';
import 'package:portfolio_flutter/widgets/drawer_mobile.dart';
import 'package:portfolio_flutter/widgets/header_desktop.dart';
import 'package:portfolio_flutter/widgets/header_mobile.dart';
import 'package:portfolio_flutter/widgets/projects.dart';
import 'package:portfolio_flutter/widgets/skills.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomColor.scaffoldBg,
          endDrawer: (constraints.maxWidth >= kMinDesktopWidth)
              ? null
              : const DrawerMobile(),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              // Main
              (constraints.maxWidth >= kMinDesktopWidth)
                  ? const HeaderDesktop()
                  : HeaderMobile(
                      onLogoTap: () {},
                      onMenuTap: () {
                        scaffoldKey.currentState?.openEndDrawer();
                      },
                    ),

              AboutMe(constraints: constraints, screenWidth: screenWidth),

              // Skills
              Skills(screenWidth: screenWidth),
              // Experience
              //Container(height: 500, width: double.infinity),
              // Projects
              Projects(
                title: "Work Projects",
                projects: workProjects,
                screenWidth: screenWidth,
              ),

              Projects(
                title: "Personal Projects",
                projects: projects,
                screenWidth: screenWidth,
              ),
              // Contanct
              ContactSection(screenWith: screenWidth),
              // Footer
              Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                width: double.maxFinite,
                alignment: Alignment.center,
                child: Text(
                  "Made with ❤️ by Arjun Gangwar.",
                  style: TextStyle(
                    fontSize: 12,
                    color: CustomColor.purple,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
