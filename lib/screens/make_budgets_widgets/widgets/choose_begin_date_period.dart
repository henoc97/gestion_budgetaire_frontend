import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_engine/app_engine.dart';
import '../../../app_engine/app_localizations.dart';
import '../../../app_engine/date_formatter.dart';

class BeginDateAndPeriod extends StatefulWidget {
  const BeginDateAndPeriod({super.key});

  @override
  State<BeginDateAndPeriod> createState() => _BeginDateAndPeriodState();
}

class _BeginDateAndPeriodState extends State<BeginDateAndPeriod> {

  List<DateTime?> _dates = [DateTime.now()];
  List<DateTime?> get dates => _dates;
  set date (List<DateTime> value){
    setState(() {
      _dates = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations? lang = AppLocalizations(); //.of(context);
    AppEngine appEngine = AppEngine();
    return Center(
      child: Card(
        child: Container(
          height: 280.h, width: 300.h,
          child: CalendarDatePicker2(
          config: CalendarDatePicker2Config(
            selectedYearTextStyle : TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["less"],  color: appEngine.myColors["myWhite"]),
            yearTextStyle : TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["less"],  color: appEngine.myColors["myBlack"]),
            dayTextStyle : TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["less"],  color: appEngine.myColors["myBlack"]),
            calendarType: CalendarDatePicker2Type.range,
          ),
          value: _dates,
          onValueChanged: (dates) {
            dates = dates;
            DateList00.dateList00 = dates;
            //if(dates.length == 2){print("periods : ${periods(_dates)}");}
            print(dates);
          
          } ,
        ),
        ),
      ),
    );
  }
}