
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
  int differenceJours = (differenceMilliseconds / (1000 * 60 * 60 * 24)).round();
  print(differenceJours);
  return differenceJours;
}

class DateList00{
  static  List<DateTime?> dateList00 = <DateTime>[];
}

