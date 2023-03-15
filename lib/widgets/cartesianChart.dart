import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CartesianChart extends StatefulWidget{
  const CartesianChart({super.key});

  @override
  CartesianChartState createState() => CartesianChartState();
}

class CartesianChartState extends State<CartesianChart>{

  late TooltipBehavior _tooltipBehavior;
  final List<_CartesianData> data = <_CartesianData> [
    _CartesianData("Lunes", 7.8, 9.0, 5.2),
    _CartesianData("Martes", 6.4, 9.2, 10.0),
    _CartesianData("Miercoles", 3.4, 4.5, 6.5),
    _CartesianData("Jueves", 5.4, 5.6, 5.1),
    _CartesianData("Viernes", 4.5, 6.5, 7.2),
  ];

  @override
  void initState(){
    _tooltipBehavior = TooltipBehavior(enable: true); // activar detalles
    super.initState();
  }

  ClipRRect cartesian(){
    // Gráfico que representa los días de la semana
    // Junto a la calificacion obtenida por alumno
    return ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child : Container(
          color: Colors.white,
          width: double.maxFinite,
          height: 500,
          child: SfCartesianChart(
            tooltipBehavior: _tooltipBehavior,
            legend: Legend(isVisible: true),
            primaryXAxis: CategoryAxis(),
            series: <LineSeries<_CartesianData, String>>[
              LineSeries(
                  enableTooltip: true,
                  dataSource: data,
                  name : "Alumno 1",
                  xValueMapper: (_CartesianData alumnoUno,  _) => alumnoUno.x ,
                  yValueMapper: (_CartesianData alumnoUno, _) => alumnoUno.y,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
              ),
              LineSeries(
                enableTooltip: true,
                  dataSource: data,
                  name: "Alumno 2",
                  xValueMapper: (_CartesianData alumnoDos, _) => alumnoDos.x,
                  yValueMapper: (_CartesianData alumnoDos, _) => alumnoDos.y2,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
              ),
              LineSeries(
                  enableTooltip: true,
                  dataSource: data,
                  name: "Alumno 3",
                  xValueMapper: (_CartesianData alumnoTres, _) => alumnoTres.x,
                  yValueMapper: (_CartesianData alumnoTres, _) => alumnoTres.y3,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
              ),
            ],
          ),
        ),
    );
  }

  ClipRRect title(){
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child : Container(
        width: double.maxFinite,
        height: 100,
        color: Colors.white,
        child: const Center(
            child : Text("Resultados Semanales", style: TextStyle(color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold,), textAlign: TextAlign.center,)),
      ),
    );
}

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          // Titulo
            title(),
            const SizedBox(height: 15,),
          // Grafico cartesiano
            cartesian(),
        ],
      ),
    );
  }
}

class _CartesianData{
  _CartesianData(this.x, this.y, this.y2, this.y3);
  final String x;
  final double y;
  final double y2;
  final double y3;
}