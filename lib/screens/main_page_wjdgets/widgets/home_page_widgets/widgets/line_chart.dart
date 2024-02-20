import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../app_engine/app_engine.dart';
import '../../../../../app_engine/app_localizations.dart';

class SpendsMonthlyLineChart extends StatefulWidget {
  const SpendsMonthlyLineChart({super.key});

  @override
  State<SpendsMonthlyLineChart> createState() => _SpendsMonthlyLineChartState();
}

class _SpendsMonthlyLineChartState extends State<SpendsMonthlyLineChart> {
  

  bool showAvg = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AppLocalizations? lang = AppLocalizations(); //.of(context);
    AppEngine appEngine = AppEngine();
    
    
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.60,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 15,
              left: 8,
              top: 12,
              bottom: 0,
            ),
            child: LineChart(
              showAvg ? avgData() : mainData(),
            ),
          ),
        ),
        SizedBox(
          width: 60,
          height: 34,
          child: TextButton(
            onPressed: () {
              setState(() {
                showAvg = !showAvg;
              });
            },
            child: Text(
              'avg',
              style: TextStyle(
                fontSize: 12,
                color: showAvg ? Colors.white.withOpacity(0.5) : Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    AppEngine appEngine = AppEngine();
    TextStyle style = TextStyle(
      fontFamily: appEngine.myFontfamilies["st"],
      fontSize: appEngine.myFontSize['less'],
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text =  Text('J', style: style);
        break;
      case 1:
        text =  Text('F', style: style);
        break;
      case 2:
        text =  Text('M', style: style);
        break;
      case 3:
        text =  Text('A', style: style);
        break;
      case 4:
        text =  Text('M', style: style);
        break;
      case 5:
        text =  Text('J', style: style);
        break;
      case 6:
        text =  Text('J', style: style);
        break;
      case 7:
        text =  Text('A', style: style);
        break;
      case 8:
        text =  Text('S', style: style);
        break;
      case 9:
        text =  Text('O', style: style);
        break;
      case 10:
        text =  Text('N', style: style);
        break;
      case 11:
        text =  Text('D', style: style);
        break;
      default:
        text =  Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    AppEngine appEngine = AppEngine();
    TextStyle style = TextStyle(
      fontFamily: appEngine.myFontfamilies["st"],
      fontSize: appEngine.myFontSize['less'],
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '1K';
        break;
      case 2:
        text = '2k';
        break;
      case 3:
        text = '3k';
        break;
      case 4:
        text = '4k';
        break;
      case 5:
        text = '5k';
        break;
      case 6:
        text = '6k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    AppEngine appEngine = AppEngine();
    return LineChartData(
      gridData: const FlGridData(
        show: false),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(1, 2),
            FlSpot(3, 5),
            FlSpot(4, 3.1),
            FlSpot(5, 4),
            FlSpot(6, 3),
            FlSpot(7, 4),
            FlSpot(8, 3),
            FlSpot(9, 3),
            FlSpot(10, 5),
            FlSpot(11, 4.6),
            
            
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: appEngine.mygradColors["lineChartGrad"]!,
          ),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              
              colors: appEngine.mygradColors["lineChartGrad"]!
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    AppEngine appEngine = AppEngine();
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: appEngine.mygradColors["lineChartGrad"]![0], end: appEngine.mygradColors["lineChartGrad"]![1])
                  .lerp(0.2)!,
              ColorTween(begin: appEngine.mygradColors["lineChartGrad"]![0], end: appEngine.mygradColors["lineChartGrad"]![1])
                  .lerp(0.2)!,
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: appEngine.mygradColors["lineChartGrad"]![0], end: appEngine.mygradColors["lineChartGrad"]![1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
                ColorTween(begin: appEngine.mygradColors["lineChartGrad"]![0], end: appEngine.mygradColors["lineChartGrad"]![1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
