import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:peaksique/database/helper.dart';
import 'package:peaksique/models/workout_model.dart';
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
  final TextEditingController sessionNameController = TextEditingController();
  final TextEditingController exerciseNameController = TextEditingController();
  final TextEditingController setController = TextEditingController();
  final TextEditingController repController = TextEditingController();
  final TextEditingController kgController = TextEditingController();
  final TextEditingController restController = TextEditingController();

  @override
  void dispose() {
    sessionNameController.dispose();
    dateController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appbar(context),
      body: SizedBox.expand(
        child: Column(
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
                    SizedBox(height: 3),
                    TextField(
                      controller: sessionNameController,
                      style: TextStyle(fontSize: 15, color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade800,
                        contentPadding: EdgeInsets.only(left: 10, right: 10),
                        hintText: 'Workout',
                        hintStyle: TextStyle(
                          color: Colors.white38,
                          fontSize: 12,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.white12,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.white38,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "DATE",
                      style: TextStyle(fontSize: 12, color: Colors.white60),
                    ),
                    SizedBox(height: 3),
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
                            contentPadding: EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            hintText: 'mm/dd/yyyy',
                            hintStyle: TextStyle(
                              color: Colors.white38,
                              fontSize: 12,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.white12,
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.white38,
                                width: 2,
                              ),
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
            Container(
              color: Colors.black,
              child: Divider(
                indent: 10,
                endIndent: 10,
                thickness: 1,
                color: Colors.grey,
                height: 1,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Exercises",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    SizedBox(
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade800.withOpacity(0.7),
                          border: Border.all(color: Colors.grey.shade700),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  width: 33,
                                  decoration: BoxDecoration(
                                    color: Colors.pink.shade900.withOpacity(
                                      0.5,
                                    ),
                                    border: Border.all(
                                      color: Colors.pink.shade800,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "1", // variable exercise count
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.pinkAccent,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.grey.shade800,
                                      contentPadding: EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                      ),
                                      hintText: 'Bench Press',
                                      hintStyle: TextStyle(
                                        color: Colors.white38,
                                        fontSize: 12,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.white12,
                                          width: 2,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: Colors.white38,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  width: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.black45,
                                    border: Border.all(color: Colors.white30),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.delete_outline,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 30,
                                      child: Text(
                                        "SET",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    SizedBox(
                                      width: 80,
                                      child: Text(
                                        "REPS",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    SizedBox(
                                      width: 80,
                                      child: Text(
                                        "KG",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    SizedBox(
                                      width: 80,
                                      child: Text(
                                        "REST",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  child: Container(
                                    color: Colors.transparent,
                                    padding: EdgeInsets.only(
                                      top: 10,
                                      bottom: 10,
                                    ),
                                    child: Divider(
                                      indent: 4,
                                      endIndent: 4,
                                      thickness: 1,
                                      color: Colors.grey.withOpacity(0.5),
                                      height: 1,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 30,
                                      child: Text(
                                        "1",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    SizedBox(
                                      width: 80,
                                      child: Expanded(
                                        child: TextField(
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            filled: true,
                                            isDense: true,
                                            fillColor: Colors.grey.shade800,
                                            contentPadding: EdgeInsets.all(10),
                                            hintText: '0', // variable
                                            hintStyle: TextStyle(
                                              color: Colors.white38,
                                              fontSize: 12,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.white12,
                                                width: 2,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.white38,
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    SizedBox(
                                      width: 80,
                                      child: Expanded(
                                        child: TextField(
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            filled: true,
                                            isDense: true,
                                            fillColor: Colors.grey.shade800,
                                            contentPadding: EdgeInsets.all(10),
                                            hintText: '0', // variable
                                            hintStyle: TextStyle(
                                              color: Colors.white38,
                                              fontSize: 12,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.white12,
                                                width: 2,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.white38,
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    SizedBox(
                                      width: 80,
                                      child: Expanded(
                                        child: TextField(
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            filled: true,
                                            isDense: true,
                                            fillColor: Colors.grey.shade800,
                                            contentPadding: EdgeInsets.all(10),
                                            hintText: '0', // variable
                                            hintStyle: TextStyle(
                                              color: Colors.white38,
                                              fontSize: 12,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.white12,
                                                width: 2,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.white38,
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    SizedBox(
                                      width: 30,
                                      child: Container(
                                        padding: EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          color: Colors.black87,
                                          border: Border.all(
                                            color: Colors.white38,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            7,
                                          ),
                                        ),
                                        child: Text(
                                          "x",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 30,
                                      child: Text(
                                        "2",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    SizedBox(
                                      width: 80,
                                      child: Expanded(
                                        child: TextField(
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            filled: true,
                                            isDense: true,
                                            fillColor: Colors.grey.shade800,
                                            contentPadding: EdgeInsets.all(10),
                                            hintText: '0', // variable
                                            hintStyle: TextStyle(
                                              color: Colors.white38,
                                              fontSize: 12,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.white12,
                                                width: 2,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.white38,
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    SizedBox(
                                      width: 80,
                                      child: Expanded(
                                        child: TextField(
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            filled: true,
                                            isDense: true,
                                            fillColor: Colors.grey.shade800,
                                            contentPadding: EdgeInsets.all(10),
                                            hintText: '0', // variable
                                            hintStyle: TextStyle(
                                              color: Colors.white38,
                                              fontSize: 12,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.white12,
                                                width: 2,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.white38,
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    SizedBox(
                                      width: 80,
                                      child: Expanded(
                                        child: TextField(
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            filled: true,
                                            isDense: true,
                                            fillColor: Colors.grey.shade800,
                                            contentPadding: EdgeInsets.all(10),
                                            hintText: '0', // variable
                                            hintStyle: TextStyle(
                                              color: Colors.white38,
                                              fontSize: 12,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.white12,
                                                width: 2,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.white38,
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    SizedBox(
                                      width: 30,
                                      child: Container(
                                        padding: EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          color: Colors.black87,
                                          border: Border.all(
                                            color: Colors.white38,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            7,
                                          ),
                                        ),
                                        child: Text(
                                          "x",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 30,
                                      child: Text(
                                        "3",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    SizedBox(
                                      width: 80,
                                      child: Expanded(
                                        child: TextField(
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            filled: true,
                                            isDense: true,
                                            fillColor: Colors.grey.shade800,
                                            contentPadding: EdgeInsets.all(10),
                                            hintText: '0', // variable
                                            hintStyle: TextStyle(
                                              color: Colors.white38,
                                              fontSize: 12,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.white12,
                                                width: 2,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.white38,
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    SizedBox(
                                      width: 80,
                                      child: Expanded(
                                        child: TextField(
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            filled: true,
                                            isDense: true,
                                            fillColor: Colors.grey.shade800,
                                            contentPadding: EdgeInsets.all(10),
                                            hintText: '0', // variable
                                            hintStyle: TextStyle(
                                              color: Colors.white38,
                                              fontSize: 12,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.white12,
                                                width: 2,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.white38,
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    SizedBox(
                                      width: 80,
                                      child: Expanded(
                                        child: TextField(
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                          decoration: InputDecoration(
                                            filled: true,
                                            isDense: true,
                                            fillColor: Colors.grey.shade800,
                                            contentPadding: EdgeInsets.all(10),
                                            hintText: '0', // variable
                                            hintStyle: TextStyle(
                                              color: Colors.white38,
                                              fontSize: 12,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.white12,
                                                width: 2,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.white38,
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    SizedBox(
                                      width: 30,
                                      child: Container(
                                        padding: EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          color: Colors.black87,
                                          border: Border.all(
                                            color: Colors.white38,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            7,
                                          ),
                                        ),
                                        child: Text(
                                          "x",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: 5),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      side: BorderSide(
                                        color: Colors.white54,
                                        width: 1,
                                      ),
                                      elevation: 5,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 5,
                                        horizontal: 12,
                                      ),
                                    ),
                                    child: Text(
                                      "+ Add set",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
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
                            vertical: 5,
                            horizontal: 12,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add, size: 18, color: Colors.white),
                            SizedBox(width: 5),
                            Text(
                              "Add Exercise",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 25, top: 10, left: 10, right: 10),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              final workout = WorkoutModel(
                pId: 1, 
                name: sessionNameController.text, 
                date: DateTime.now().toIso8601String(), 
                status: 'Active',
              );
              final result = await PeaksiqueDatabase.instance.create(workout);

              debugPrint('Saved ID: ${result.wId}');

              final savedWorkout = await PeaksiqueDatabase.instance.read(result.wId!);
              debugPrint('Read back: ${savedWorkout.name}');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              side: BorderSide(color: Colors.white54, width: 1),
              elevation: 5,
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check, size: 18, color: Colors.white),
                SizedBox(width: 5),
                Text(
                  "Save Session",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
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
