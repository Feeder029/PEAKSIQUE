import 'dart:math';

import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(20),
        children: [
          Container(
            height: 250,
            padding: EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good Morning!', //variable for greeting based on time of day
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                Text(
                  'Mark Reven', //variable for user name
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 100,
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 115,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '4', //variable for workout count
                              style: TextStyle(
                                color: Colors.pinkAccent,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'WORKOUTS', //variable for workout label
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 115,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '2,840', //variable for workout count
                              style: TextStyle(
                                color: Colors.pinkAccent,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'KG LIFTED', //variable for workout label
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 115,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '12', //variable for workout count
                              style: TextStyle(
                                color: Colors.pinkAccent,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'DAY STREAK', //variable for workout label
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  height: 50,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Weekly Goal',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '4 / 5 sessions', //variable for goal progress
                            style: TextStyle(
                              color: Colors.pinkAccent,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: LinearProgressBar(
                          progressType: ProgressType.linear,
                          maxSteps: 3, //variable for total goal sessions
                          currentStep: 2, //variable for completed goal sessions
                          progressColor: Colors.pinkAccent,
                          backgroundColor: Colors.white24,
                          borderRadius: BorderRadius.circular(10),
                          minHeight: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Today\'s Session',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'View All',
                          style: TextStyle(
                            color: Colors.pinkAccent,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'TUESDAY - PUSH DAY', //variable for session name
                            style: TextStyle(
                              color: Colors.pink.shade300,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            'Chest & Shoulders', //variable for session details
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only( bottom: 10),
                            child: SizedBox(
                              width: double.infinity,
                              child: Wrap(
                                spacing: 5,
                                children: [
                                  Chip(
                                    label: Text(
                                      'Bench Press', //variable for session duration
                                      style: TextStyle(color: Colors.white70, fontSize: 12),
                                    ),
                                    shape: StadiumBorder(
                                      side: BorderSide(color: Colors.transparent)
                                    ),
                                  ),
                                  Chip(
                                    label: Text(
                                      'OHP', //variable for session duration
                                      style: TextStyle(color: Colors.white70, fontSize: 12),
                                    ),
                                    shape: StadiumBorder(
                                      side: BorderSide(color: Colors.transparent)
                                    ),
                                  ),
                                  Chip(
                                    label: Text(
                                      'Incline DB', //variable for session duration
                                      style: TextStyle(color: Colors.white70, fontSize: 12),
                                    ),
                                    shape: StadiumBorder(
                                      side: BorderSide(color: Colors.transparent)
                                    ),
                                  ),
                                  Chip(
                                    label: Text(
                                      'Lateral Raise', //variable for session duration
                                      style: TextStyle(color: Colors.white70, fontSize: 12),
                                    ),
                                    shape: StadiumBorder(
                                      side: BorderSide(color: Colors.transparent)
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: OutlinedButton(
                              onPressed: () {
                                // Navigate to session details page
                              },
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.white60),
                                backgroundColor: const Color.fromARGB(255, 50, 50, 49),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                minimumSize: Size(double.infinity, 50),
                              ),
                              child: const Text(
                                "Start Session ➤",
                                style: TextStyle(fontSize: 14, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}
