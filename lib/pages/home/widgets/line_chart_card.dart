import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dashboard/pages/home/api_server.dart';
import 'package:flutter_dashboard/responsive.dart';
import 'package:flutter_dashboard/widgets/custom_card.dart';

class LineChartCard extends StatefulWidget {
  @override
  _LineChartCardState createState() => _LineChartCardState();
}

class _LineChartCardState extends State<LineChartCard> {
  List<FlSpot> spots = [];
  var bottomTitle;
  String selectedRange = 'آخر أسبوع';
  late Future<Map<String, dynamic>> _futureData;

  @override
  void initState() {
    super.initState();
  
  }

  void _generateSpots(List data) {
    spots.clear();
    double count = 0;
    for (var i in data) {
      spots.add(FlSpot(count, i));
      count++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          const Text(
                      "احصائيات الستريم",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 20,),
        FutureBuilder(
          future: HomeApi.getStreamChartInformation(_mapRangeToType(selectedRange)),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CustomCard(
                child: SizedBox(),
                width: double.infinity,
                height: 300,
              );
            } else if (snapshot.hasData) {
              var data = snapshot.data;
              _generateSpots(data['data']);
              bottomTitle = getBottomTitle(data['Type']);
              return CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    DropdownButton<String>(
                      value: selectedRange,
                      items: ['آخر أسبوع', 'آخر شهر', 'آخر سنة'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedRange = newValue!;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AspectRatio(
                      aspectRatio: Responsive.isMobile(context) ? 9 / 4 : 16 / 6,
                      child: LineChart(
                        LineChartData(
                          lineTouchData: LineTouchData(
                            handleBuiltInTouches: true,
                          ),
                          gridData: FlGridData(show: false),
                          titlesData: FlTitlesData(
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 32,
                                interval: 1,
                                getTitlesWidget: (double value, TitleMeta meta) {
                                  return bottomTitle[value.toInt()] != null
                                      ? SideTitleWidget(
                                          axisSide: meta.axisSide,
                                          space: 10,
                                          child: Text(
                                              bottomTitle[value.toInt()].toString(),
                                              style: TextStyle(
                                                  fontSize: Responsive.isMobile(context)
                                                      ? 9
                                                      : 12,
                                                  color: Colors.grey[400])),
                                        )
                                      : const SizedBox();
                                },
                              ),
                            ),
                            rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),
                          borderData: FlBorderData(show: false),
                          lineBarsData: [
                            LineChartBarData(
                              isCurved: true,
                              curveSmoothness: 0,
                              color: Theme.of(context).primaryColor,
                              barWidth: 2.5,
                              isStrokeCapRound: true,
                              belowBarData: BarAreaData(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Theme.of(context).primaryColor.withOpacity(0.5),
                                    Colors.transparent
                                  ],
                                ),
                                show: true,
                                color: Theme.of(context).primaryColor.withOpacity(0.5),
                              ),
                              dotData: FlDotData(show: false),
                              spots: spots,
                            ),
                          ],
                          minX: 0,
                          maxX: maxX(data['Type']).toDouble(),
                          maxY: data['Max'] + data['Max'] / 4,
                          minY: 0,
                        ),
                        swapAnimationDuration: const Duration(milliseconds: 250),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const CustomCard(
                width: double.infinity,
                height: 100,
                child: Center(child: Text('حدثت مشكلة بجلب احصائيات الستريم')),
              );
            }
          },
        ),
      ],
    );
  }

  String _mapRangeToType(String range) {
    switch (range) {
      case 'آخر شهر':
        return 'month';
      case 'آخر أسبوع':
        return 'week';
      case 'آخر سنة':
        return 'year';
      default:
        return 'month';
    }
  }
}

int maxX(String type) {
  if (type == 'month') {
    return 29;
  }
  if (type == 'year') {
    return 11;
  }
  return 6;
}

Map<int, String> getBottomTitle(String type) {
  if (type == "week") {
    return {0: "d0", 1: "d1", 2: "d2", 3: "d3", 4: "d4", 5: "d5", 6: "d6"};
  } else if (type == "month") {
    return {
      0: "d0",
      4: "d5",
      9: "d10",
      14: "d15",
      19: "d20",
      24: "d25",
      29: "d30"
    };
  }
  return {
    0: "d0",
    1: "d30",
    2: "d60",
    3: "d90",
    4: "d120",
    5: "d150",
    6: "d180",
    7: "d210",
    8: "d240",
    9: "d270",
    10: "d300",
    11: "d330"
  };
}
