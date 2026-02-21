import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio_flutter/constants/app_secrets.dart';
import 'package:portfolio_flutter/constants/colors.dart';
import 'package:portfolio_flutter/constants/contact_items.dart';
import 'package:portfolio_flutter/constants/size.dart';
import 'package:portfolio_flutter/utils/url_opener.dart';
import 'package:portfolio_flutter/widgets/custom_text_field.dart';

class ContactSection extends StatefulWidget {
  final double screenWidth;
  const ContactSection({super.key, required this.screenWidth});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSending = false;

  Future<void> _sendForm() async {
    final url = Uri.parse(formspree);

    setState(() => _isSending = true);

    await http.post(
      url,
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: {
        'name': _nameController.text,
        '_replyto': _emailController.text,
        'subject': _subjectController.text,
        'message': _messageController.text,
      },
    );

    setState(() => _isSending = false);

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Message sent successfully!")));
    _nameController.clear();
    _emailController.clear();
    _subjectController.clear();
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
      child: Column(
        children: [
          const Text(
            "Contact Me",
            style: TextStyle(
              fontSize: 50,
              color: CustomColor.whitePrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Feel free to contact me about anything!",
            style: TextStyle(
              fontSize: 14,
              color: CustomColor.whitePrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            constraints: BoxConstraints(
              maxWidth: widget.screenWidth >= 1000
                  ? 1000
                  : widget.screenWidth * 0.9,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  if (widget.screenWidth >= kMedDesktopWidth)
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            "assets/images/pfp.jpeg",
                            fit: BoxFit.cover,
                            height: screenHeight * 0.55,
                          ),
                        ),
                      ),
                    ),
                  if (widget.screenWidth >= kMedDesktopWidth)
                    const SizedBox(width: 30),
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        (widget.screenWidth >= kMedDesktopWidth)
                            ? nameEmailDesktopBuilder()
                            : nameEmailMobileBuilder(),
                        const SizedBox(height: 16),
                        CustomTextField(
                          controller: _subjectController,
                          hintText: "Subject",
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          controller: _messageController,
                          hintText: "Message",
                          maxLines: 10,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16,
                            horizontal: 16,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 20,
                              ),
                              backgroundColor: CustomColor.purpleTertiary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                            onPressed: _isSending ? null : _sendForm,
                            child: (_isSending)
                                ? SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(),
                                  )
                                : const Text(
                                    "Send",
                                    style: TextStyle(
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.bold,
                                      color: CustomColor.bgLight1,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 400),
            child: const Divider(),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            runAlignment: WrapAlignment.center,
            children: contactPlatforms
                .map(
                  (platform) => InkWell(
                    onTap: () => openUrl(platform.source),
                    child: Image.asset(platform.logo, width: 35),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Row nameEmailDesktopBuilder() {
    return Row(
      children: [
        Flexible(
          child: CustomTextField(
            controller: _nameController,
            hintText: "Your Name",
          ),
        ),
        const SizedBox(width: 16),
        Flexible(
          child: CustomTextField(
            controller: _emailController,
            hintText: "Your Email",
          ),
        ),
      ],
    );
  }

  Column nameEmailMobileBuilder() {
    return Column(
      children: [
        CustomTextField(controller: _nameController, hintText: "Your Name"),
        const SizedBox(height: 16),
        CustomTextField(controller: _emailController, hintText: "Your Email"),
      ],
    );
  }
}
