import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:peaksique/pages/navigation.dart';

class AddSession extends StatefulWidget {
  const AddSession({super.key});

  @override
  State<AddSession> createState() => _AddSessionState();
}

class _AddSessionState extends State<AddSession> {
  
  List<DateTime?> _dates = [];
  bool showCalendar = false;
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(context),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "SESSION NAME",
                    style: TextStyle(fontSize: 12, color: Colors.white60),
                  ),
                  TextField(
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade800,
                      contentPadding: EdgeInsets.only(left: 10, right: 10),
                      hintText: 'Workout',
                      hintStyle: TextStyle(color: Colors.white38, fontSize: 12),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white12, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white38, width: 2),
                      ),
                    ),
                  ),
                  Text(
                    "DATE",
                    style: TextStyle(fontSize: 12, color: Colors.white60),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showCalendar = !showCalendar;
                      });
                    },
                    child: AbsorbPointer(
                      child: TextField(
                        controller: dateController,
                        style: TextStyle(fontSize: 15, color: Colors.white),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade800,
                          contentPadding: EdgeInsets.only(left: 10, right: 10),
                          hintText: 'mm/dd/yyyy',
                          hintStyle: TextStyle(color: Colors.white38, fontSize: 12),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white12, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.white38, width: 2),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  if (showCalendar)
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
                          centerAlignModePicker: true,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar appbar(BuildContext context) {
    return AppBar(
      title: Text(
        "Add Session",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.black,
      elevation: 0.0,
      leading: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: Duration(milliseconds: 500),
              pageBuilder:
                  (context, animation, secondaryAnimation) => MainLayout(),
              transitionsBuilder: (
                context,
                animation,
                secondaryAnimation,
                child,
              ) {
                final tween = Tween(
                  begin: Offset(0, 0.3), // start slightly below
                  end: Offset.zero,
                ).chain(CurveTween(curve: Curves.easeOut));

                return FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  ),
                );
              },
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(3),
          margin: EdgeInsets.all(12),
          width: 30,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: Colors.white54),
          ),
          child: Text(
            "x",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 500),
                pageBuilder:
                    (context, animation, secondaryAnimation) => MainLayout(),
                transitionsBuilder: (
                  context,
                  animation,
                  secondaryAnimation,
                  child,
                ) {
                  final tween = Tween(
                    begin: Offset(0, 0.3), // start slightly below
                    end: Offset.zero,
                  ).chain(CurveTween(curve: Curves.easeOut));

                  return FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    ),
                  );
                },
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(3),
            margin: EdgeInsets.all(12),
            width: 70,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: Colors.white54),
            ),
            child: Text(
              "Save",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,

              ),
            ),
          ),
        ),
      ],
    );
  }
}
