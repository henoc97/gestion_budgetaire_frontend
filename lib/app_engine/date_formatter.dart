import 'package:intl/intl.dart';

List<String> formatDate(DateTime date) {
  List<String> dateList = [];
  String day = date.day.toString().padLeft(2, '0');
  String month = date.month.toString().padLeft(2, '0');
  String year = date.year.toString();
  dateList.add(day);
  dateList.add(month);
  dateList.add(year);
  return dateList;
}

int periods(List<DateTime?> dateList) {
  // Convertir les deux dates en millisecondes depuis l'époque
  int debutMilliseconds = dateList[0]!.millisecondsSinceEpoch;
  int finMilliseconds = dateList[1]!.millisecondsSinceEpoch;

  // Calculer la différence en millisecondes
  int differenceMilliseconds = finMilliseconds - debutMilliseconds;

  // Convertir la différence en jours
  int intervalleJours = (1+ differenceMilliseconds / (1000 * 60 * 60 * 24)).round();
  print(intervalleJours);
  return intervalleJours;
}

class DateList00{
  static  List<DateTime?> dateList00 = <DateTime>[];
}


String literalyDate(String inputDate) {
  DateTime dateTime = DateTime.parse(inputDate);
  String dayOfWeek = DateFormat('EEEE', 'fr_FR').format(dateTime);
  String dayOfMonth = DateFormat('dd', 'fr_FR').format(dateTime);
  String month = DateFormat('MMMM', 'fr_FR').format(dateTime);
  String year = DateFormat('yyyy').format(dateTime);

  return '${dayOfWeek.substring(0, 3)}, $dayOfMonth $month $year';
}
