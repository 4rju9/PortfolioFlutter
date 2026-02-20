import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants/colors.dart';
import 'package:portfolio_flutter/constants/strings.dart';
import 'package:portfolio_flutter/utils/url_opener.dart';
import 'package:portfolio_flutter/widgets/info_item.dart';

class AboutMeInfo extends StatelessWidget {
  const AboutMeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Heading
          const Text(
            "About Me",
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),

          const SizedBox(height: 24),

          /// Description
          const Text(
            textDeveloperIntro,
            style: TextStyle(
              fontSize: 18,
              height: 1.6,
              color: CustomColor.textFieldBg,
            ),
          ),

          const SizedBox(height: 40),

          /// Info Section
          Wrap(
            spacing: 60,
            runSpacing: 20,
            children: [
              infoItem(title: "Name:", value: DeveloperInformation.name),
              infoItem(
                title: "Date of birth:",
                value: DeveloperInformation.dob,
              ),
              infoItem(
                title: "Home Town:",
                value: DeveloperInformation.address,
              ),
              infoItem(
                title: "Email:",
                value: DeveloperInformation.email,
                clickable: true,
                url: "mailto:${DeveloperInformation.email}",
              ),
            ],
          ),

          const SizedBox(height: 40),

          /// Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              backgroundColor: CustomColor.purpleTertiary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            onPressed: () => openUrl(DeveloperInformation.resume),
            child: const Text(
              "DOWNLOAD RESUME",
              style: TextStyle(
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
                color: CustomColor.purpleSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
