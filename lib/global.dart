import 'package:flutter/material.dart';
import 'package:platform/IOSCall.dart';
import 'package:platform/IOSSettings.dart';
import 'package:platform/ioschat.dart';
import 'package:platform/settings.dart';

import 'calls.dart';
import 'chats.dart';

class Global {
  static List<Widget> pages = [
    const Chats(),
    const Calls(),
    const Setting(),
  ];

  static List<Map<String, dynamic>> chat = [
    {
      'profile': 'asset/image/1st.webp',
      'title': 'Tom Cruise',
      'subtitle': 'I will message you',
      'contact': 94456002648,
      'time': 12.45,
    },
    {
      'profile': 'asset/image/2nd.webp',
      'title': 'Matt Lanter',
      'subtitle': 'I will message you',
      'contact': 9924429649,
      'time': 12.00,
    },
    {
      'profile': 'asset/image/3rd.jpg',
      'title': 'Vijay South',
      'subtitle': 'I will message you',
      'contact': 88493783390,
      'time': 2.45,
    },
    {
      'profile': 'asset/image/4th.jpg',
      'title': 'Hrithik Roshan',
      'subtitle': 'I will message you',
      'contact': 98241259166,
      'time': 3.25,
    },
    {
      'profile': 'asset/image/hugh_jackman.jpg',
      'title': 'Hung Jackman',
      'subtitle': 'I will message you',
      'contact': 6351976777,
      'time': 4.50,
    },
    {
      'profile': 'asset/image/6th.webp',
      'title': 'Amitab Banchan',
      'subtitle': 'I will message you',
      'contact': 9909949649,
      'time': 1.45,
    },
    {
      'profile': 'asset/image/d4f2a57a73c33e7959379b5cde397c06.png',
      'title': 'Sidharth Malhotra',
      'subtitle': 'I will message you',
      'contact': 9404967949,
      'time': 15.23,
    },
    {
      'profile': 'asset/image/8th.webp',
      'title': 'Tony Stack',
      'subtitle': 'I will message you',
      'contact': 9723130304,
      'time': 9.15,
    },
    {
      'profile': 'asset/image/9th.jpg',
      'title': 'Dhanush',
      'subtitle': 'I will message you',
      'contact': 8791182374,
      'time': 6.30,
    },
    {
      'profile': 'asset/image/10th.jpeg',
      'title': 'Amir Khan',
      'subtitle': 'I will message you',
      'contact': 7016382441,
      'time': 4.36,
    },
  ];

  static int index = 0;

  static List<Map<String, dynamic>> steps = [
    {
      'title': 'Profile photo',
      'subTitle': 'Add Profile Photo',
      'content': Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xff075E54).withOpacity(0.2),
            child: Text(
              "Add",
              style: TextStyle(color: Color(0xff075E54)),
            ),
          ),
          FloatingActionButton(
            backgroundColor: Color(0xff075E54),
            onPressed: () {},
            child: Icon(Icons.add),
            mini: true,
          )
        ],
      )
    },
    {
      'title': 'Name',
      'subTitle': 'Enter Name',
      'content': TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(), hintText: 'Dhara Nayani'),
      )
    },
    {
      'title': 'Contact',
      'subTitle': 'Enter Contact Number',
      'content': TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(), hintText: '9426002648'),
      )
    },
  ];

  static List<Map<String, dynamic>> drawer = [
    {
      'icon': Icons.people_alt_outlined,
      'name': 'New Group',
    },
    {
      'icon': Icons.person_outline_outlined,
      'name': 'New Contact',
    },
    {
      'icon': Icons.call_outlined,
      'name': 'Calls',
    },
    {
      'icon': Icons.bookmark_border_outlined,
      'name': 'Saved Message',
    },
    {
      'icon': Icons.settings_outlined,
      'name': 'Settings',
    },
  ];

  static String selDate =
      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
  static String selMonth = '';

  static String selTime = '';

  static int selHour = 0;

  static bool switchVal = false;

  static List<Widget> IOSPages = [
    const IOSCall(),
    const IOSChat(),
    const IOSSetting()
  ];
}
