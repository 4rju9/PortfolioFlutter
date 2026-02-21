import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants/colors.dart';
import 'package:portfolio_flutter/constants/nav_items.dart';
import 'package:portfolio_flutter/constants/projects.dart';
import 'package:portfolio_flutter/constants/size.dart';
import 'package:portfolio_flutter/widgets/about_me.dart';
import 'package:portfolio_flutter/widgets/contact_section.dart';
import 'package:portfolio_flutter/widgets/drawer_mobile.dart';
import 'package:portfolio_flutter/widgets/experience_section.dart';
import 'package:portfolio_flutter/widgets/footer.dart';
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
  final scrollController = ScrollController();
  final List<GlobalKey> navKeys = List.generate(
    navTiles.length,
    (index) => GlobalKey(),
  );
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
              : DrawerMobile(onTap: animateToSection),
          body: Column(
            children: [
              (constraints.maxWidth >= kMinDesktopWidth)
                  ? HeaderDesktop(onTap: animateToSection)
                  : HeaderMobile(
                      onLogoTap: () {},
                      onMenuTap: () {
                        scaffoldKey.currentState?.openEndDrawer();
                      },
                    ),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      // Main
                      AboutMe(
                        key: navKeys[0],
                        constraints: constraints,
                        screenWidth: screenWidth,
                      ),
                      // Skills
                      Skills(
                        key: navKeys[1],
                        screenWidth: constraints.maxWidth,
                      ),
                      // Experience
                      ExperienceSection(
                        key: navKeys[2], // adjust index accordingly
                        screenWidth: screenWidth,
                      ),
                      // Projects
                      SizedBox(key: navKeys[3]),
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
                      ContactSection(key: navKeys[4], screenWidth: screenWidth),
                      // Footer
                      Footer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void animateToSection(int index) {
    Scrollable.ensureVisible(
      navKeys[index].currentContext!,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeOut,
    );
  }
}
