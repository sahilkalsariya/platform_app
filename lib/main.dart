import 'dart:math';

import 'package:flutter/material.dart';

import 'package:platform/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:platform/ioschat.dart';
import 'alert.dart';
import 'global.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  late TabController tabController;
  PageController pageController = PageController();
  final CupertinoTabController _controller = CupertinoTabController();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return (Global.switchVal == true)
        ? CupertinoApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => CupertinoPageScaffold(
                    navigationBar: CupertinoNavigationBar(
                      middle: const Text(
                        "Platform Converter",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: CupertinoColors.black),
                      ),
                      leading: CupertinoButton(
                          onPressed: () {},
                          child: const Icon(
                            CupertinoIcons.line_horizontal_3,
                            color: CupertinoColors.black,
                          )),
                      trailing: CupertinoSwitch(
                        activeColor:
                            CupertinoColors.inactiveGray.withOpacity(0.2),
                        onChanged: (val) {
                          setState(() {
                            Global.switchVal = val;
                          });
                        },
                        value: Global.switchVal,
                      ),
                      backgroundColor: CupertinoColors.white,
                      border: const Border(bottom: BorderSide.none),
                    ),
                    child: CupertinoTabScaffold(
                      controller: _controller,
                      backgroundColor: CupertinoColors.white,
                      tabBuilder: (context, i) {
                        return CupertinoPageScaffold(
                            child: SingleChildScrollView(
                          child: Column(
                            children: Global.IOSPages.map((e) => e).toList(),
                          ),
                        ));
                      },
                      tabBar: CupertinoTabBar(
                        onTap: (val) {
                          setState(() {});
                        },
                        backgroundColor:
                            CupertinoColors.inactiveGray.withOpacity(0.2),
                        items: const <BottomNavigationBarItem>[
                          BottomNavigationBarItem(
                              icon: Icon(CupertinoIcons.chat_bubble_2)),
                          BottomNavigationBarItem(
                              icon: Icon(CupertinoIcons.phone)),
                          BottomNavigationBarItem(
                              icon: Icon(CupertinoIcons.settings)),
                        ],
                      ),
                    ),
                  ),
            },
          )
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/': (context) => Scaffold(
                    appBar: AppBar(
                      title: const Text("Platform Converter"),
                      actions: [
                        Switch(
                            activeColor:
                                const Color(0xff075E54).withOpacity(0.2),
                            activeTrackColor: Colors.teal.shade900,
                            hoverColor: const Color(0xff075E54),
                            value: Global.switchVal,
                            onChanged: (val) {
                              setState(() {
                                Global.switchVal = val;
                              });
                            })
                      ],
                      backgroundColor: const Color(0xff075E54),
                      bottom: TabBar(
                          controller: tabController,
                          indicatorColor: Colors.white,
                          onTap: (val) {
                            setState(() {
                              Global.index = val;
                              pageController.animateToPage(val,
                                  duration: const Duration(milliseconds: 100),
                                  curve: Curves.easeIn);
                            });
                          },
                          tabs: const [
                            Tab(text: "CHATS"),
                            Tab(text: "CALLS"),
                            Tab(text: "SETTINGS"),
                          ]),
                    ),
                    floatingActionButton: (tabController.index == 0)
                        ? FloatingActionButton(
                            backgroundColor: const Color(0xff075E54),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Alert();
                                  });
                            },
                            child: const Icon(Icons.add),
                          )
                        : null,
                    drawer: const DrawerVal(),
                    body: PageView(
                      controller: pageController,
                      onPageChanged: (val) {
                        setState(() {
                          tabController.animateTo(val);
                          Global.index = val;
                        });
                      },
                      children: Global.pages.map((e) => e).toList(),
                    ),
                  )
            },
          );
  }
}
