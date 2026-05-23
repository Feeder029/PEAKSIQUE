import 'package:flutter/material.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  bool preview = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 35,
          left: 25,
          right: 25,
          bottom: 25,
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Workout',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 50, 50, 49),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'TUESDAY - PUSH DAY',
                              style: TextStyle(
                                color: Colors.pink.shade300,
                                fontSize: 15,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  preview = !preview;
                                });
                              },
                              child: Icon(
                                preview ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                                color: Colors.white54,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(height: 3, color: Colors.white30, indent: 0),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Chest & Shoulders',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (preview)
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Wrap(
                              spacing: 5,
                              runSpacing: 5,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.white12,
                                  ),
                                  child: Text(
                                    'Bench Press',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white54,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.white12,
                                  ),
                                  child: Text(
                                    'OHP',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white54,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.white12,
                                  ),
                                  child: Text(
                                    'Incline DB',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white54,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.white12,
                                  ),
                                  child: Text(
                                    'Lateral Raise',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white54,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if(!preview)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white30),
                                  borderRadius: BorderRadius.circular(12)
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      'Bench Press',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsGeometry.all(10),
                                      child: Divider(
                                        color: Colors.white12,
                                        height: 1,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          width: 90,
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            border: Border.all(color:Colors.transparent),
                                            borderRadius: BorderRadius.circular(12),
                                            color: Colors.grey.shade800
                                          ),
                                          child: Column(
                                            children: [
                                              Text(
                                                 '3',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold
                                                  ),
                                              ),
                                              Text(
                                                 'SETS',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold
                                                  ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 5,),
                                        Container(
                                          width: 90,
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            border: Border.all(color:Colors.transparent),
                                            borderRadius: BorderRadius.circular(12),
                                            color: Colors.grey.shade800
                                          ),
                                          child: Column(
                                            children: [
                                              Text(
                                                 '36',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold
                                                  ),
                                              ),
                                              Text(
                                                 'REPS',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold
                                                  ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 5,),
                                        Container(
                                          width: 90,
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            border: Border.all(color:Colors.transparent),
                                            borderRadius: BorderRadius.circular(12),
                                            color: Colors.grey.shade800
                                          ),
                                          child: Column(
                                            children: [
                                              Text(
                                                 '120',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold
                                                  ),
                                              ),
                                              Text(
                                                 'KG',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold
                                                  ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        SizedBox(height: 10),
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.white60),
                            backgroundColor: const Color.fromARGB(
                              255,
                              50,
                              50,
                              49,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15 * 0.8),
                            ),
                            minimumSize: Size(double.infinity, 50),
                          ),
                          child: Text(
                            "Start Session ➤",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
