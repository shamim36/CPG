import 'package:flutter/material.dart';
import 'package:pdf_maker/social_media_links.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final linkedinWebView = Uri.parse('https://www.linkedin.com/in/shamim888/');
    final gitHubWebView = Uri.parse('https://github.com/shamim36');

    return Drawer(
      backgroundColor: Color.fromARGB(255, 54, 54, 55),
      surfaceTintColor: Colors.white,
      shadowColor: Colors.white,
      elevation: 50,
      child: Center(
        child: Column(
          children: [
            _drawerHeader(),
            const SizedBox(
              height: 30,
            ),
            const CircleAvatar(
              foregroundImage: AssetImage('assets/images/shamim.jpg'),
              radius: 80,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Flutter Developer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              'Software Engineer Undergadute @DIU',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),

            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, left: 15.0),
              child: Row(
                children: [
                  Text(
                    'Follow me on',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SocialMediaLinks(linkedinWebView: linkedinWebView,gitHubWebView: gitHubWebView),
          ],
        ),
      ),
    );
  }

  UserAccountsDrawerHeader _drawerHeader() {
    return const UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/drawer_header.jpg'),
        ),
      ),
      accountName: Text(
        'Developer Information',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w300,
        ),
      ),
      accountEmail: Text(
        'Md Shamim Ahamed',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),

      //   currentAccountPicture: Image.network(
      //       'https://i.ytimg.com/vi/Q6se2oSVpp4/hqdefault.jpg'),
      // ),
      // currentAccountPicture: CircleAvatar(
      //   foregroundImage: AssetImage('assets/images/shamim.jpg'),
      //   radius: 80,
      // ),
    );
  }
}
