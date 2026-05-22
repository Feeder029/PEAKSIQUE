import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  List<DateTime?> _dates = [];
  bool showCalendar = false;
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                color: Colors.black,
                child: CalendarDatePicker2(
                  config: CalendarDatePicker2Config(
                    dayTextStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    controlsTextStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    weekdayLabelTextStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    todayTextStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    selectedDayTextStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    selectedDayHighlightColor: Colors.pinkAccent,
                    centerAlignModePicker: false,
                    customModePickerIcon: SizedBox(),
                  ),

                  value: _dates,

                  onValueChanged: (dates) {
                    setState(() {
                      _dates = dates;
                      showCalendar = false; // 👈 auto close

                      if (_dates.isNotEmpty && _dates.first != null) {
                        dateController.text =
                            "${_dates.first!.month}/${_dates.first!.day}/${_dates.first!.year}";
                      }
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Divider(height: 5, color: Colors.grey),
              ),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "THURSDAY, MAY 7", // variable date
                          style: TextStyle(color: Colors.white54, fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade800.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white12, width: 2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.pink.shade800.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.white12,
                                    width: 2,
                                  ),
                                ),
                                child: Icon(
                                  Icons.self_improvement_sharp,
                                  size: 30,
                                  color: Colors.pinkAccent,
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Core & Cardio",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Abs",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white54,
                                          ),
                                        ),
                                        Text(
                                          " • ",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white54,
                                          ),
                                        ),
                                        Text(
                                          "Relapse",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "10:00",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.pinkAccent,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                  top: 5,
                                  bottom: 5,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.white30,
                                    width: 1,
                                  ),
                                ),
                                child: Icon(
                                  Icons.edit_square,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 5),
                              Container(
                                padding: EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                  top: 5,
                                  bottom: 5,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.white30,
                                    width: 1,
                                  ),
                                ),
                                child: Icon(
                                  Icons.delete,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            side: BorderSide(color: Colors.white54, width: 1),
                            elevation: 5,
                            padding: EdgeInsets.symmetric(
                              vertical: 3,
                              horizontal: 12,
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add, size: 15, color: Colors.white),
                              SizedBox(width: 5),
                              Text(
                                "Add Session",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
