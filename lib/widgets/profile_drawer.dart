import 'package:flutter/material.dart';
import 'package:mvp/core/app_export.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.png'),
              backgroundColor: Colors.white,
            ),
            // otherAccountsPictures: const <Widget>[
            //   CircleAvatar(
            //     backgroundColor: Colors.white,
            //     backgroundImage: AssetImage('assets/images/profile.png'),
            //   ),
            // ],
            accountName: const Text(
              'End to And',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
            accountEmail: const Text(
              'endtoand2021@gmail.com',
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
            ),
            onDetailsPressed: () {
              print('0');
            },
            decoration:
                const BoxDecoration(color: Color.fromARGB(153, 201, 234, 253)),
            arrowColor: Colors.black,
          ),
          ListTile(
            leading: Icon(
              Icons.menu_book_rounded,
              color: Colors.grey[850],
              size: 30.adaptSize,
            ),
            title: const Text(
              '내가 본 레시피',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              print('1');
            },
            trailing: Icon(
              Icons.add,
              color: Colors.grey[850],
              size: 30.adaptSize,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.bookmark_rounded,
              color: Colors.grey[850],
            ),
            title: const Text(
              '스크랩한 레시피',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              print('2');
            },
            trailing: Icon(
              Icons.add,
              color: Colors.grey[850],
              size: 30.adaptSize,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.help,
              color: Colors.grey[850],
            ),
            title: const Text(
              '문의하기 / 고객센터',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              print('3');
            },
            trailing: Icon(
              Icons.add,
              color: Colors.grey[850],
              size: 30.adaptSize,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.settings_rounded,
              color: Colors.grey[850],
            ),
            title: const Text(
              '설정',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              print('4');
            },
            trailing: Icon(
              Icons.add,
              color: Colors.grey[850],
              size: 30.adaptSize,
            ),
          ),
        ],
      ),
    );
  }
}
