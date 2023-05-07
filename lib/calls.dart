import 'package:flutter/material.dart';

import 'global.dart';

class Calls extends StatefulWidget {
  const Calls({Key? key}) : super(key: key);

  @override
  State<Calls> createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: Global.chat
            .map((e) => Card(
                  elevation: 5,
                  child: ListTile(
                    onTap: () {},
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("${e['profile']}"),
                      backgroundColor: const Color(0xff075E54),
                    ),
                    title: Text("${e['title']}"),
                    subtitle: Text("${e['time']}"),
                    trailing: const Icon(
                      Icons.call,
                      color: Color(0xff075E54),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
