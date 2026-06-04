import 'package:flutter/material.dart';
import 'package:peaksique/database/helper.dart';
import 'package:peaksique/models/activity_model.dart';
import 'package:peaksique/models/workout_model.dart';
import 'package:peaksique/pages/session_start.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  Set<int> expandedIndexes = {};

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
            Expanded(
              child: FutureBuilder<List<WorkoutModel>>(
                future: PeaksiqueDatabase.instance.readAllWorkout(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text("Loading...");
                  }

                  if (!snapshot.hasData) {
                    return const Text("No workout");
                  }

                  final workouts = snapshot.data!;

                  return ListView.builder(
                    itemCount: workouts.length,
                    itemBuilder: (context, index) {
                      final workout = workouts[index];
                      final date = DateTime.parse(workout.date);
                      const days = [
                        'MONDAY',
                        'TUESDAY',
                        'WEDNESDAY',
                        'THURSDAY',
                        'FRIDAY',
                        'SATURDAY',
                        'SUNDAY',
                      ];

                      return Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 7),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${days[date.weekday - 1]} - ${date.month}/${date.day}/${date.year}',
                                        style: TextStyle(
                                          color: Colors.pink.shade300,
                                          fontSize: 15,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            if (expandedIndexes.contains(index)) {
                                              expandedIndexes.remove(index);
                                            } else {
                                              expandedIndexes.add(index);
                                            }
                                          });
                                        },
                                        child: Icon(
                                          expandedIndexes.contains(index)
                                              ? Icons.arrow_drop_down
                                              : Icons.arrow_drop_up,
                                          color: Colors.white54,
                                          size: 25,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  height: 3,
                                  color: Colors.white30,
                                  indent: 0,
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    workout.name,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  if (!expandedIndexes.contains(index))
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 5,
                                      ),
                                      child: FutureBuilder<List<ActivityModel>>(
                                        future:
                                            PeaksiqueDatabase.instance
                                                .readActivitiesByWorkoutId(workout.wId!),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const CircularProgressIndicator();
                                          }

                                          if (snapshot.hasError) {
                                            return Text(
                                              'Error: ${snapshot.error}',
                                            );
                                          }

                                          final activities =
                                              snapshot.data ?? [];

                                          return Wrap(
                                            spacing: 5,
                                            runSpacing: 5,
                                            children:
                                                activities.map((activity) {
                                                  return Container(
                                                    padding: EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            25,
                                                          ),
                                                      color: Colors.white12,
                                                    ),
                                                    child: Text(
                                                      activity.name,
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.white54,
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                          );
                                        },
                                      ),
                                    ),
                                  if (expandedIndexes.contains(index)) // more info of exercise name list
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FutureBuilder<List<ActivityModel>>(
                                          future: PeaksiqueDatabase.instance
                                              .readActivitiesByWorkoutId(
                                                workout.wId!,
                                              ),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return const CircularProgressIndicator();
                                            }

                                            if (snapshot.hasError) {
                                              return Text(
                                                'Error: ${snapshot.error}',
                                              );
                                            }
                                            final activities = snapshot.data!;

                                            return Wrap(
                                              children:
                                                  activities.map((activity) {
                                                    return Container(
                                                      width: double.infinity,
                                                      padding: EdgeInsets.all(
                                                        10,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: Colors.white30,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              12,
                                                            ),
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            activity.name,
                                                            textAlign:
                                                                TextAlign
                                                                    .center,
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsGeometry.all(
                                                                  10,
                                                                ),
                                                            child: Divider(
                                                              color:
                                                                  Colors
                                                                      .white12,
                                                              height: 1,
                                                            ),
                                                          ),
                                                          FutureBuilder(
                                                            future: PeaksiqueDatabase
                                                                .instance
                                                                .readSetsActId(
                                                                  activity
                                                                      .actId!,
                                                                ),
                                                            builder: (
                                                              context,
                                                              snapshot,
                                                            ) {
                                                              if (snapshot
                                                                      .connectionState ==
                                                                  ConnectionState
                                                                      .waiting) {
                                                                return const CircularProgressIndicator();
                                                              }

                                                              if (snapshot
                                                                  .hasError) {
                                                                return Text(
                                                                  'Error: ${snapshot.error}',
                                                                );
                                                              }

                                                              final setsData =
                                                                  snapshot
                                                                      .data!;

                                                              return Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  Container(
                                                                    width: 90,
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                          10,
                                                                        ),
                                                                    decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                        color:
                                                                            Colors.transparent,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            12,
                                                                          ),
                                                                      color:
                                                                          Colors
                                                                              .grey
                                                                              .shade800,
                                                                    ),
                                                                    child: Column(
                                                                      children: [
                                                                        Text(
                                                                          '${setsData.sets}',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'SETS',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: TextStyle(
                                                                            fontSize:
                                                                                13,
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Container(
                                                                    width: 90,
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                          10,
                                                                        ),
                                                                    decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                        color:
                                                                            Colors.transparent,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            12,
                                                                          ),
                                                                      color:
                                                                          Colors
                                                                              .grey
                                                                              .shade800,
                                                                    ),
                                                                    child: Column(
                                                                      children: [
                                                                        Text(
                                                                          '${setsData.reps}',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'REPS',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: TextStyle(
                                                                            fontSize:
                                                                                13,
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Container(
                                                                    width: 90,
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                          10,
                                                                        ),
                                                                    decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                        color:
                                                                            Colors.transparent,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            12,
                                                                          ),
                                                                      color:
                                                                          Colors
                                                                              .grey
                                                                              .shade800,
                                                                    ),
                                                                    child: Column(
                                                                      children: [
                                                                        Text(
                                                                          '${setsData.rest}',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          'KG',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: TextStyle(
                                                                            fontSize:
                                                                                13,
                                                                            color:
                                                                                Colors.white,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }).toList(),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  SizedBox(height: 10),
                                  OutlinedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          transitionDuration: Duration(
                                            milliseconds: 500,
                                          ),
                                          pageBuilder:
                                              (
                                                context,
                                                animation,
                                                secondaryAnimation,
                                              ) => SessionStart(),
                                          transitionsBuilder: (
                                            context,
                                            animation,
                                            secondaryAnimation,
                                            child,
                                          ) {
                                            final tween = Tween(
                                              begin: Offset(
                                                0,
                                                0.3,
                                              ), // start slightly below
                                              end: Offset.zero,
                                            ).chain(
                                              CurveTween(curve: Curves.easeOut),
                                            );

                                            return FadeTransition(
                                              opacity: animation,
                                              child: SlideTransition(
                                                position: animation.drive(
                                                  tween,
                                                ),
                                                child: child,
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                        color: Colors.white60,
                                      ),
                                      backgroundColor: const Color.fromARGB(
                                        255,
                                        50,
                                        50,
                                        49,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          15 * 0.8,
                                        ),
                                      ),
                                      minimumSize: Size(double.infinity, 50),
                                    ),
                                    child: Text(
                                      "Start Session ➤",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
