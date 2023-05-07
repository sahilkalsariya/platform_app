import 'package:flutter/material.dart';

import 'global.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  DateTime currentDate = DateTime.now();
  TimeOfDay currentTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      alignment: Alignment.center,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Date",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff075E54)),
              ),
              Text(
                Global.selDate,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff075E54)),
              )
            ],
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  backgroundColor: const Color(0xff075E54)),
              onPressed: () async {
                DateTime? data = await showDatePicker(
                    selectableDayPredicate: (DateTime val) {
                      if (val.isAfter(DateTime.now()
                              .subtract(const Duration(days: 1))) &&
                          val.isBefore(
                              DateTime.now().add(const Duration(days: 7)))) {
                        return true;
                      }
                      return false;
                    },
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: const ColorScheme.light(
                            primary: Color(0xff075E54),
                            onPrimary: Colors.white,
                            onSurface: Color(0xff075E54),
                          ),
                        ),
                        child: child!,
                      );
                    },
                    context: context,
                    initialDate: currentDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2030));
                if (data!.month == 1) {
                  Global.selMonth = 'Jan';
                } else if (data.month == 2) {
                  Global.selMonth = 'Feb';
                } else if (data.month == 3) {
                  Global.selMonth = 'March';
                } else if (data.month == 4) {
                  Global.selMonth = 'April';
                } else if (data.month == 5) {
                  Global.selMonth = 'May';
                } else if (data.month == 6) {
                  Global.selMonth = 'June';
                } else if (data.month == 7) {
                  Global.selMonth = 'July';
                } else if (data.month == 8) {
                  Global.selMonth = 'Aug';
                } else if (data.month == 9) {
                  Global.selMonth = 'Sep';
                } else if (data.month == 10) {
                  Global.selMonth = 'Oct';
                } else if (data.month == 11) {
                  Global.selMonth = 'Nov';
                } else if (data.month == 12) {
                  Global.selMonth = 'Dec';
                }
                setState(() {
                  Global.selDate =
                      ("${data.day},${Global.selMonth} ${data.year}");
                });
              },
              child: const Text("Change Date")),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Time",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff075E54)),
              ),
              Text(
                Global.selTime,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff075E54)),
              )
            ],
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  backgroundColor: const Color(0xff075E54)),
              onPressed: () async {
                TimeOfDay? res = await showTimePicker(
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: const ColorScheme.light(
                          primary: Color(0xff075E54),
                          onPrimary: Colors.white,
                          onSurface: Color(0xff075E54),
                        ),
                      ),
                      child: child!,
                    );
                  },
                  context: context,
                  initialTime: currentTime,
                );
                setState(() {
                  Global.selTime =
                      ("${res!.hour}:${res.minute} ${res.period.name}");
                });
              },
              child: const Text("Change Time"))
        ],
      ),
    );
  }
}
