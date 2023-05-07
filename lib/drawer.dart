import 'package:flutter/material.dart';

import 'global.dart';

class DrawerVal extends StatefulWidget {
  const DrawerVal({Key? key}) : super(key: key);

  @override
  State<DrawerVal> createState() => _DrawerValState();
}

class _DrawerValState extends State<DrawerVal> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.teal.shade900,
                width: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('asset/image/my.jpg'),
                        backgroundColor: Colors.teal,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Dhara Nayani",
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "+91 9426002648",
                        style: TextStyle(color: Colors.white.withOpacity(0.5)),
                      )
                    ]),
              )),
          Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children: Global.drawer
                      .map((e) => ListTile(
                            leading: Icon(e['icon']),
                            title: Text("${e['name']}"),
                          ))
                      .toList(),
                ),
              ))
        ],
      ),
    );
  }
}
