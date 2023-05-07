import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'global.dart';

class IOSChat extends StatefulWidget {
  const IOSChat({Key? key}) : super(key: key);

  @override
  State<IOSChat> createState() => _IOSChatState();
}

class _IOSChatState extends State<IOSChat> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: Global.chat
            .map((e) => Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: CupertinoColors.white,
              ),
              height: 50,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: CupertinoColors.systemIndigo,
                      backgroundImage: AssetImage(e['profile']),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${e['title']}",
                          style: const TextStyle(fontSize: 17),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          "${e['subtitle']}",
                          style: const TextStyle(
                              fontSize: 15,
                              color: CupertinoColors.inactiveGray),
                        ),
                      ],
                    ),
                  ),
                  // Expanded(
                  //     flex: 1,
                  //     child: Text(
                  //       "${e['time']}",
                  //       style: const TextStyle(fontSize: 18),
                  //     ))
                ],
              ),
            ))
            .toList());
  }
}
