import 'package:flutter/material.dart';
import 'global.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
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
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25))),
                          builder: (context) {
                            return BottomSheet(
                                onClosing: () {},
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(25))),
                                builder: (context) {
                                  return Container(
                                    padding: const EdgeInsets.all(25),
                                    height: 350,
                                    width: double.infinity,
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 70,
                                          backgroundImage:
                                              AssetImage("${e['profile']}"),
                                          backgroundColor: Colors.teal.shade900,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text("${e['title']}"),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text("+91 ${e['contact']}"),
                                        SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.teal.shade900),
                                              onPressed: () {},
                                              child:
                                                  const Text("Share Contact")),
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.teal.shade900),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text("Cancel")),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          });
                    },
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("${e['profile']}"),
                      backgroundColor: const Color(0xff075E54),
                    ),
                    title: Text("${e['title']}"),
                    subtitle: Text("${e['subtitle']}"),
                    trailing: Text("${e['time']}"),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
