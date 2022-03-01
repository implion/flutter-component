import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_component/chart_data.dart';
import 'package:flutter_component/component/component_app_bar.dart';
import 'package:graphic/graphic.dart';
import 'package:intl/intl.dart';

final dataFormatter = DateFormat('yyyy-MM-dd');

class ChartExpPage extends StatelessWidget {
  ChartExpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    // var highData = historyData?.map((e) => e['high'] ?? 0).toList() ?? [];
    return Scaffold(
        appBar: const ComponentAppBar(
          title: 'Chart',
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(children: [
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      width: 300,
                      height: 300,
                      child: graphicData(),
                    )
                  ])),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: 600,
                    height: 320,
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: LineChart(mainData())),
                  )),
            ],
          ),
        ));
  }

  Chart graphicData() {
    var historyData = chartData['historyData'] ?? [];
    var chart = Chart(
      data: historyData,
      variables: {
        'time': Variable(
            accessor: (Map value) => (value['time'] as String),
            scale: OrdinalScale(inflate: true, formatter: (text) => text.substring(5))
            ),
        'high': Variable(
            accessor: (Map value) => value['high'] as int,
            scale: LinearScale(min: 0, max: 200)
        )
      },
      elements: [
        LineElement(
            shape: ShapeAttr(
                value: BasicLineShape(smooth: true)),
            size: SizeAttr(value: 5)),
      ],
      axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
      coord: RectCoord(dimCount: 2, horizontalRange: [0, 2], horizontalRangeUpdater: Defaults.horizontalRangeSignal),
      selections: {
        'touchMove': PointSelection(toggle: true, on: {
          GestureType.tap,
          GestureType.longPressMoveUpdate,
          GestureType.scaleUpdate,
          // GestureType.scaleStart,
          GestureType.scroll,
          // GestureType.scaleEnd
        }, dim: Dim.x),
      },
      tooltip: TooltipGuide(
          followPointer: [false, false],
          align: Alignment.topLeft),
      crosshair: CrosshairGuide(followPointer: [true, false]),

    );
    return chart;
  }

  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  LineChartData mainData() {
    var times = (chartData['historyData'] ?? [])
        .map((e) => e['time']! as String)
        .toList();
    var highList =
        (chartData['historyData'] ?? []).map((e) => e['high']! as int).toList();
    List<FlSpot> spots = [];
    for (int i = 0; i < times.length; i++) {
      spots.add(FlSpot(i.toDouble(), highList[i].toDouble()));
    }
    return LineChartData(
        maxY: 200,
        minY: 0,
        titlesData: FlTitlesData(
            bottomTitles: SideTitles(
                showTitles: true,
                getTitles: (value) => times[value.toInt()].substring(5),
                getTextStyles: (context, value) =>
                    const TextStyle(fontSize: 12)),
            rightTitles: SideTitles(showTitles: false),
            topTitles: SideTitles(showTitles: false)),
        borderData: FlBorderData(show: false),
        gridData: FlGridData(show: false),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            spots: spots,
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
            ],
            barWidth: 5,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(show: true, colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!
                  .withOpacity(0.1),
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!
                  .withOpacity(0.1),
            ]),
          )
        ]);
  }
}
