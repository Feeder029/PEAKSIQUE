import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

    // Responsive scale helpers
    final double sp = w / 375; // scale factor based on 375pt baseline (iPhone 14)
    final double hp = h / 812; // height scale factor based on 812pt baseline

    // Responsive text sizes
    final double textXS   = (10 * sp).clamp(9,  13).toDouble();
    final double textSM   = (12 * sp).clamp(11, 15).toDouble();
    final double textMD   = (14 * sp).clamp(13, 17).toDouble();
    final double textLG   = (16 * sp).clamp(14, 20).toDouble();
    final double textXL   = (18 * sp).clamp(16, 22).toDouble();
    final double text2XL  = (24 * sp).clamp(20, 30).toDouble();
    final double text3XL  = (25 * sp).clamp(20, 32).toDouble();
    final double text4XL  = (30 * sp).clamp(24, 38).toDouble();

    // Responsive spacing
    final double paddingXS  = (5  * sp).clamp(4,  8).toDouble();
    final double paddingSM  = (10 * sp).clamp(8,  16).toDouble();
    final double paddingMD  = (15 * sp).clamp(12, 20).toDouble();
    final double paddingLG  = (20 * sp).clamp(16, 28).toDouble();
    final double paddingXL  = (30 * sp).clamp(20, 40).toDouble();

    // Responsive heights
    final double headerHeight     = (250 * hp).clamp(200, 320).toDouble();
    final double statsCardHeight  = (100 * hp).clamp(80,  130).toDouble();
    final double buttonMinHeight  = (40  * hp).clamp(36,  52).toDouble();
    final double borderRadius     = (12  * sp).clamp(10,  18).toDouble();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: EdgeInsets.all(paddingLG),
          children: [
            // ── Header ──────────────────────────────────────────────────────
            SizedBox(
              height: headerHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good Morning!',
                    style: TextStyle(color: Colors.white70, fontSize: textLG),
                  ),
                  SizedBox(height: paddingXS),
                  Text(
                    'Mark Reven',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: text4XL,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // ── Stats Row ──────────────────────────────────────────────
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: paddingSM),
                      child: Row(
                        children: [
                          _StatCard(
                            value: '4',
                            label: 'WORKOUTS',
                            valueSize: text2XL,
                            labelSize: textMD,
                            borderRadius: borderRadius,
                          ),
                          SizedBox(width: paddingSM),
                          _StatCard(
                            value: '2,840',
                            label: 'KG LIFTED',
                            valueSize: text2XL,
                            labelSize: textMD,
                            borderRadius: borderRadius,
                          ),
                          SizedBox(width: paddingSM),
                          _StatCard(
                            value: '12',
                            label: 'DAY STREAK',
                            valueSize: text2XL,
                            labelSize: textMD,
                            borderRadius: borderRadius,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ── Weekly Goal ────────────────────────────────────────────
                  Padding(
                    padding: EdgeInsets.only(top: paddingSM),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Weekly Goal',
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: textMD,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '4 / 5 sessions',
                              style: TextStyle(
                                color: Colors.pinkAccent,
                                fontSize: textMD,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: paddingXS),
                        LinearProgressBar(
                          progressType: ProgressType.linear,
                          maxSteps: 5,
                          currentStep: 4,
                          progressColor: Colors.pinkAccent,
                          backgroundColor: Colors.white24,
                          borderRadius: BorderRadius.circular(borderRadius),
                          minHeight: (10 * hp).clamp(8, 14).toDouble(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // ── Today's Session ──────────────────────────────────────────────
            Container(
              margin: EdgeInsets.only(top: paddingLG),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _SectionHeader(
                    title: "Today's Session",
                    titleSize: textXL,
                    actionSize: textMD,
                  ),
                  SizedBox(height: paddingMD),
                  Container(
                    padding: EdgeInsets.all(paddingSM),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 50, 50, 49),
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'TUESDAY - PUSH DAY',
                          style: TextStyle(
                            color: Colors.pink.shade300,
                            fontSize: textSM,
                          ),
                        ),
                        SizedBox(height: paddingXS),
                        Text(
                          'Chest & Shoulders',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: text3XL,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: paddingSM),
                          child: Wrap(
                            spacing: paddingXS,
                            runSpacing: paddingXS,
                            children: ['Bench Press', 'OHP', 'Incline DB', 'Lateral Raise']
                                .map((label) => _ExerciseChip(
                                      label: label,
                                      fontSize: textXS,
                                      borderRadius: borderRadius,
                                    ))
                                .toList(),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.white60),
                            backgroundColor: const Color.fromARGB(255, 50, 50, 49),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(borderRadius * 0.8),
                            ),
                            minimumSize: Size(double.infinity, buttonMinHeight),
                          ),
                          child: Text(
                            "Start Session ➤",
                            style: TextStyle(fontSize: textMD, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // ── Recent Activity ──────────────────────────────────────────────
            Container(
              margin: EdgeInsets.only(top: paddingLG),
              child: Column(
                children: [
                  _SectionHeader(
                    title: 'Recent Activity',
                    titleSize: textXL,
                    actionSize: textMD,
                  ),
                  SizedBox(height: paddingSM),
                  ...[
                    {
                      'name': 'Back & Biceps',
                      'day': 'Monday',
                      'exercises': '3 Exercises',
                      'duration': '45 mins',
                      'kg': '+320 KG',
                    },
                    {
                      'name': 'Leg Day',
                      'day': 'Sunday',
                      'exercises': '4 Exercises',
                      'duration': '55 mins',
                      'kg': '+480 KG',
                    },
                  ].map(
                    (activity) => Padding(
                      padding: EdgeInsets.only(bottom: paddingSM),
                      child: _ActivityCard(
                        name: activity['name']!,
                        day: activity['day']!,
                        exercises: activity['exercises']!,
                        duration: activity['duration']!,
                        kg: activity['kg']!,
                        nameFontSize: textLG,
                        detailFontSize: textSM,
                        kgFontSize: textSM,
                        padding: paddingMD,
                        borderRadius: borderRadius,
                      ),
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

// ── Reusable Widgets ──────────────────────────────────────────────────────────

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  final double valueSize;
  final double labelSize;
  final double borderRadius;

  const _StatCard({
    required this.value,
    required this.label,
    required this.valueSize,
    required this.labelSize,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 50, 50, 49),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                value,
                style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: valueSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label,
                style: TextStyle(color: Colors.white70, fontSize: labelSize),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final double titleSize;
  final double actionSize;

  const _SectionHeader({
    required this.title,
    required this.titleSize,
    required this.actionSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: titleSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            'View All',
            style: TextStyle(
              color: Colors.pinkAccent,
              fontSize: actionSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class _ExerciseChip extends StatelessWidget {
  final String label;
  final double fontSize;
  final double borderRadius;

  const _ExerciseChip({
    required this.label,
    required this.fontSize,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(color: Colors.white70, fontSize: fontSize),
      ),
      shape: StadiumBorder(side: BorderSide(color: Colors.transparent)),
      backgroundColor: Colors.grey.shade700,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 0),
    );
  }
}

class _ActivityCard extends StatelessWidget {
  final String name;
  final String day;
  final String exercises;
  final String duration;
  final String kg;
  final double nameFontSize;
  final double detailFontSize;
  final double kgFontSize;
  final double padding;
  final double borderRadius;

  const _ActivityCard({
    required this.name,
    required this.day,
    required this.exercises,
    required this.duration,
    required this.kg,
    required this.nameFontSize,
    required this.detailFontSize,
    required this.kgFontSize,
    required this.padding,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 50, 50, 49),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '•',
            style: TextStyle(
              color: Colors.pinkAccent,
              fontSize: nameFontSize * 1.8,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: padding),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: nameFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2),
                Wrap(
                  children: [
                    Text('$day • ', style: TextStyle(color: Colors.white70, fontSize: detailFontSize)),
                    Text('$exercises • ', style: TextStyle(color: Colors.white70, fontSize: detailFontSize)),
                    Text(duration, style: TextStyle(color: Colors.white70, fontSize: detailFontSize)),
                  ],
                ),
              ],
            ),
          ),
          Text(
            kg,
            style: TextStyle(
              color: Colors.pinkAccent,
              fontSize: kgFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}