
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app_engine/app_engine.dart';
import '../../../../app_engine/app_localizations.dart';

class WeekdayButtons extends StatelessWidget {
  const WeekdayButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          return _buildDayButton(index);
        },
      ),
    );
  }

  Widget _buildDayButton(int index) {
    AppLocalizations? lang = AppLocalizations();

    List<String> days = [lang.monday, lang.tuesday, 
    lang.wednesday, lang.thursday, lang.friday, lang.saturday, lang.sunday];

    int currentDayIndex = DateTime.now().weekday - 1;

    Color? backgroundColor = AppEngine().myColors["myWhite"];
    Color textColor =AppEngine().myColors["myGreen1"]!;
    if (index == currentDayIndex) {
      backgroundColor = AppEngine().myColors["myGreen1"];
      textColor = AppEngine().myColors["myWhite"]!;
    }
    AppEngine appEngine = AppEngine();
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        width: 41.h,
        height: 65.w,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              days[index].substring(0, 3),
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: AppEngine().myFontSize["less"],
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '${DateTime.now().add(Duration(days: index - currentDayIndex)).day}',
              style: TextStyle(
                color: textColor,
                fontSize: AppEngine().myFontSize["less"],
              ),
            ),
          ],
        ),
      ),
    );
  }
}