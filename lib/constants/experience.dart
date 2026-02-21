import 'package:flutter/material.dart';

class Experience {
  final String company;
  final String place;
  final String duration;
  final String role;
  final List<String> description;
  final Color dotColor;

  Experience({
    required this.company,
    required this.place,
    required this.duration,
    required this.role,
    required this.description,
    required this.dotColor,
  });
}

final List<Experience> experiences = [
  Experience(
    company: "Clickr Technologies",
    place: "IT Park, Panchkula, Haryana",
    duration: "November 2025 – January 2026",
    role: "Android App Developer",
    dotColor: const Color(0xFFA1887F),
    description: [
      "Worked across three production apps, delivering scalable Android features with high performance and reliability.",
      "ShowBox: Developed complete OTT app from scratch using Jetpack Compose, Koin, Coil, Clean Architecture & ExoPlayer for smooth movie and web-series streaming.",
      "RBT: Built subscription screen, playlist workflow, account deletion, password update, OTP-based recovery, and RBT history using Kotlin, XML & Retrofit.",
      "EduPay: Integrated multiple APIs including secure fee-payment module for seamless student–parent school data management.",
    ],
  ),
  Experience(
    company: "Waste Samaritan",
    place: "Bengaluru, Karnataka, India",
    duration: "March 2025 – August 2025",
    role: "Software Developer Intern",
    dotColor: const Color(0xFF64B5F6),
    description: [
      "Implemented session timeout mechanism to mitigate unauthorized access attempts.",
      "Developed offline support using Room Database with high-accuracy AWS data sync.",
      "Built QR scanner with pattern validation to reduce invalid scans.",
      "Integrated image capture & compression with AWS S3, improving upload speed by 80% and reducing storage costs.",
      "Deployed geofencing features using Google Maps SDK for location-based functionality.",
    ],
  ),
  Experience(
    company: "Advance Technology System",
    place: "Delhi, India",
    duration: "November 2024 – December 2024",
    role: "Android App Developer",
    dotColor: const Color(0xFFF06292),
    description: [
      "Maintained and modernized Android projects for 5+ clients, updating deprecated code and ensuring 99% uptime.",
      "Activated 10+ features, enhancing app functionality, including Bluetooth printing, cutting setup time by 30%.",
      "Executed responsive updates with Java and XML, boosting efficiency by 20% and enabling 50%+ scalability.",
    ],
  ),
  Experience(
    company: "ActivePresence Orbol Groups",
    place: "Ahmedabad, India",
    duration: "March 2024 – October 2024",
    role: "Android App Developer",
    dotColor: const Color(0xFFBA68C8),
    description: [
      "Converted Figma designs into responsive Android UI screens to enhance user experience.",
      "Developed APIs for real-time synchronization between mobile app and backend services.",
      "Designed and implemented calculation models ensuring accurate in-app outputs.",
      "Reduced app error rates by 60% through extensive multi-device testing.",
    ],
  ),
];
