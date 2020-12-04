import '../common/importer.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../common/importer.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GraphPage extends StatefulWidget {
  GraphPage({Key key}) : super(key: key);

  @override
  _GraphPageState createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  @override
  Widget build(BuildContext context) {
    List<charts.Series> barList = _createBarChartData();
    List<charts.Series> stackBarList = _createStackBarChartData();
    List<charts.Series<LinearSales, int>> lineList = _createLineChartData();
    List<charts.Series> pieList = _createPieData();
    var gridView = GridView.extent(
      maxCrossAxisExtent: 200,
      padding: const EdgeInsets.all(20),
      children: <Widget>[
        Card(
            child: new charts.BarChart(
          barList,
          animate: false,
        )),
        Card(
            child: new charts.BarChart(
          barList,
          animate: true,
        )),
        Card(
            child: new charts.BarChart(
          stackBarList,
          animate: false,
          barGroupingType: charts.BarGroupingType.stacked,
        )),
        Card(
            child: new charts.BarChart(
          stackBarList,
          animate: true,
          animationDuration: Duration(seconds: 5),
          barGroupingType: charts.BarGroupingType.stacked,
        )),
        Card(
            child: new charts.LineChart(
          lineList,
          animate: false,
        )),
        Card(
            child: new charts.LineChart(
          lineList,
          animate: true,
        )),
        Card(
            child: new charts.PieChart(
          pieList,
          animate: false,
          behaviors: [
            new charts.DatumLegend(
              position: charts.BehaviorPosition.end,
              outsideJustification: charts.OutsideJustification.endDrawArea,
              horizontalFirst: false,
              desiredMaxRows: 2,
              cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
              entryTextStyle: charts.TextStyleSpec(
                  color: charts.MaterialPalette.purple.shadeDefault,
                  fontFamily: 'Georgia',
                  fontSize: 11),
            )
          ],
        )),
        Card(
            child: new charts.PieChart(
          pieList,
          animate: true,
          behaviors: [
            new charts.DatumLegend(
              position: charts.BehaviorPosition.end,
              outsideJustification: charts.OutsideJustification.endDrawArea,
              horizontalFirst: false,
              desiredMaxRows: 2,
              cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
              entryTextStyle: charts.TextStyleSpec(
                  color: charts.MaterialPalette.purple.shadeDefault,
                  fontFamily: 'Georgia',
                  fontSize: 11),
            )
          ],
        )),
        Card(
          child: Text("test"),
        ),
      ],
    );
    return Scaffold(
      appBar: HeaderComponent(title: "グラフ"),
      body: gridView,
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createBarChartData() {
    final data = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
    ];
    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }

  static List<charts.Series<OrdinalSales, String>> _createStackBarChartData() {
    final desktopSalesData = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
    ];

    final tableSalesData = [
      new OrdinalSales('2014', 25),
      new OrdinalSales('2015', 50),
      new OrdinalSales('2016', 10),
      new OrdinalSales('2017', 20),
    ];

    final mobileSalesData = [
      new OrdinalSales('2014', 10),
      new OrdinalSales('2015', 15),
      new OrdinalSales('2016', 50),
      new OrdinalSales('2017', 45),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Desktop',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Mobile',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData,
      ),
    ];
  }

  static List<charts.Series<LinearSales, int>> _createLineChartData() {
    final myFakeDesktopData = [
      new LinearSales(0, 5),
      new LinearSales(1, 15),
      new LinearSales(2, null),
      new LinearSales(3, 75),
      new LinearSales(4, 100),
      new LinearSales(5, 90),
      new LinearSales(6, 75),
    ];

    final myFakeTabletData = [
      new LinearSales(0, 10),
      new LinearSales(1, 30),
      new LinearSales(2, 50),
      new LinearSales(3, 150),
      new LinearSales(4, 200),
      new LinearSales(5, 180),
      new LinearSales(6, 150),
    ];

    final myFakeMobileData = [
      new LinearSales(0, 15),
      new LinearSales(1, 45),
      new LinearSales(2, null),
      new LinearSales(3, 225),
      new LinearSales(4, null),
      new LinearSales(5, 270),
      new LinearSales(6, 225),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeDesktopData,
      ),
      new charts.Series<LinearSales, int>(
        id: 'Tablet',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeTabletData,
      ),
      new charts.Series<LinearSales, int>(
        id: 'Mobile',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeMobileData,
      ),
    ];
  }

  static List<charts.Series<LinearSales, int>> _createPieData() {
    final data = [
      new LinearSales(0, 100),
      new LinearSales(1, 75),
      new LinearSales(2, 25),
      new LinearSales(3, 5),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
