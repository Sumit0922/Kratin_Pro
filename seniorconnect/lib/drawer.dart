import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 120,
            child: const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'RamKishor',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.phone),
            title: const Text('HELP LINE'),
            onTap: () {},
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.userLarge),
            title: const Text('About?'),
            onTap: () {},
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.bookMedical),
            title: const Text('Medical List'),
            onTap: () {},
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.userDoctor),
            title: const Text('DOCTOR +'),
            onTap: () {},
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.placeOfWorship),
            title: const Text('Place Of Worship'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
