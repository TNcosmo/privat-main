import 'package:flutter/material.dart';


class verticalBar extends StatelessWidget {
  final Map<String, double> barMap;
  final int index;

  const verticalBar(this.barMap, this.index, {Key? key}) : super(key: key);


  double fillProgressBar(){
    int sum = 0;
    barMap.values.forEach((element) {sum += element.toInt();});
    return  (barMap.values.elementAt(index) / sum);
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            barMap.entries.elementAt(index).key,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
          child: Text(
            barMap.entries.elementAt(index).value.toString(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: RotatedBox(
            quarterTurns: 3,
            child: LinearProgressIndicator(
              minHeight: 10,
              value: fillProgressBar(),
                  //int.parse(progressMap.entries.elementAt(index).value) / 100,
            ),
          ),
        ),
      ],
    );
  }
}
