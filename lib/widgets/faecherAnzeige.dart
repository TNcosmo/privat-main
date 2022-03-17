import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lern_app/domain/fach.dart';
import 'package:lern_app/widgets/verticalBar.dart';
import 'package:lern_app/widgets/fachTile.dart';

class faecherAnzeige extends StatelessWidget {
  final List<Fach> lernListe;
  final void Function(Fach delSubject) loescher;
  final Map<String, double> barMap;

  faecherAnzeige(this.lernListe, this.loescher, this.barMap,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            //singelChildeScrollfield
            child: ListView.builder(
              itemBuilder: (_, index) => verticalBar(barMap, index),
              itemCount: barMap.length,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, index) =>
                  fachTile(lernListe[index], loescher),
              itemCount: lernListe.length,
            ),
          ),
        ],
      ),
    );
  }
}
