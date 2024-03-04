import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaLinks extends StatelessWidget {
  const SocialMediaLinks({
    super.key,
    required this.linkedinWebView,
    required this.gitHubWebView,
  });

  final Uri linkedinWebView;
  final Uri gitHubWebView;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 0, left: 15, bottom: 15, right: 15),
        child: Row(
          children: [
            InkWell(
              onTap: () async {
                await launchUrl(
                  linkedinWebView,
                  mode: LaunchMode.inAppBrowserView,
                );
              },
              child: const CircleAvatar(
                foregroundImage:
                    AssetImage('assets/images/linkedin.png'),
                radius: 25,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () async {
                await launchUrl(
                  gitHubWebView,
                  mode: LaunchMode.inAppBrowserView,
                );
              },
              child: const CircleAvatar(
                foregroundImage: AssetImage('assets/images/github.png'),
                radius: 25,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {
                final Uri params = Uri(
                  scheme: 'mailto',
                  path: 'md.shamim.ahamed.888@gmail.com',
                );
                final url = params.toString();
                final urlPath = Uri.parse(url);
                launchUrl(urlPath);
              },
              child: const CircleAvatar(
                foregroundImage: AssetImage('assets/images/gmail.png'),
                radius: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
