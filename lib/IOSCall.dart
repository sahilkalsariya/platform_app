import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'global.dart';

class IOSCall extends StatefulWidget {
  const IOSCall({Key? key}) : super(key: key);

  @override
  State<IOSCall> createState() => _IOSCallState();
}

class _IOSCallState extends State<IOSCall> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
          children: Global.chat
              .map(
                (e) => Column(children: [
                  Container(
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
                                "${e['time']}",
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: CupertinoColors.inactiveGray),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: CupertinoButton(
                              onPressed: () {},
                              child: Icon(CupertinoIcons.phone_fill),
                            ))
                      ],
                    ),
                  ),
                  const Divider(
                    indent: pi / 2,
                    endIndent: (3 * pi) / 2,
                    height: 1,
                    color: CupertinoColors.quaternaryLabel,
                  )
                ]),
              )
              .toList()),
    );
  }
}
