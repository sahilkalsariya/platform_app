import 'package:flutter/material.dart';

import 'global.dart';

class Alert extends StatefulWidget {
  const Alert({Key? key}) : super(key: key);

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: double.infinity,
        child: Stepper(
          currentStep: Global.index,
          controlsBuilder: (context, _) {
            return Row(
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff075E54)),
                    onPressed: () {
                      setState(() {
                        if (Global.index < 2) {
                          Global.index++;
                        }
                      });
                    },
                    child: (Global.index == 2)
                        ? const Text(
                            "Add",
                            style: TextStyle(fontSize: 10),
                          )
                        : const Text(
                            "Continue",
                            style: TextStyle(fontSize: 10),
                          )),
                const SizedBox(
                  width: 5,
                ),
                (Global.index != 0)
                    ? OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            foregroundColor: Colors
                                .teal.shade900),
                        onPressed: () {
                          setState(() {
                            if (Global.index > 0) {
                              Global.index--;
                            }
                          });
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(fontSize: 10),
                        ))
                    : Container()
              ],
            );
          },
          steps: Global.steps
              .map((e) => Step(
                  isActive: true,
                  state: StepState.editing,
                  title: Text("${e['title']}"),
                  subtitle: Text("${e['subTitle']}"),
                  content: e['content']))
              .toList(),
        ),
      ),
    );
  }
}
