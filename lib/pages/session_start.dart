import 'package:flutter/material.dart';
import 'package:peaksique/pages/navigation.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class SessionStart extends StatelessWidget {
  const SessionStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar(context),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PUSH DAY • TUESDAY',
                    style: TextStyle(fontSize: 15, color: Colors.pinkAccent),
                  ),
                  Text(
                    'Chest & Shoulders',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.list, size: 18, color: Colors.grey.shade500),
                      Text(
                        ' 4 exercises',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.timer_sharp,
                        size: 18,
                        color: Colors.grey.shade500,
                      ),
                      Text(
                        ' ~ 55 min',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.water_drop_outlined,
                        size: 18,
                        color: Colors.grey.shade500,
                      ),
                      Text(
                        ' 380 Kcal',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Overall progress',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '2 / 14 sets',
                              style: TextStyle(
                                color: Colors.pinkAccent,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        LinearProgressBar(
                          progressType: ProgressType.linear,
                          maxSteps: 14,
                          currentStep: 2,
                          progressColor: Colors.pinkAccent,
                          backgroundColor: Colors.white24,
                          borderRadius: BorderRadius.circular(25),
                          minHeight: (1).clamp(8, 14).toDouble(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade900,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsetsGeometry.all(10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(7),
                                          width: 30,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(25),
                                            color: Colors.grey.shade800,
                                          ),
                                          child: Text(
                                            '1',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white60,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          'Bench Press',
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.arrow_drop_up,
                                      size: 25,
                                      color: Colors.white54,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(color: Colors.white54, height: 1,),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OutlinedButton(
                                  onPressed: () {
                                    
                                  },
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(color: Colors.white60),
                                    backgroundColor: Colors.grey.shade900,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10 * 0.8),
                                    ),
                                  ),
                                  child: Text(
                                    "+ Add set",
                                    style: TextStyle(fontSize: 12, color: Colors.white),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '0 ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.pinkAccent,
                                      ),
                                    ),
                                    Text(
                                      '/ 4 done',
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Container(
        width: 80,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('•', style: TextStyle(fontSize: 15, color: Colors.pinkAccent)),
            Text('02:47', style: TextStyle(fontSize: 15, color: Colors.white)),
          ],
        ),
      ),
      elevation: 0.0,
      centerTitle: true,
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
          child: Icon(Icons.arrow_back, color: Colors.white, size: 15),
        ),
      ),
    );
  }
}
