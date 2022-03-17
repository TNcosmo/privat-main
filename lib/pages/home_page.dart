import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lern_app/domain/fach.dart';
import 'package:lern_app/widgets/defaultPage.dart';
import 'package:lern_app/widgets/bottomSheet.dart';
import 'package:lern_app/widgets/defaultPage.dart';
import 'package:lern_app/widgets/faecherAnzeige.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Fach> lernListe = [];

  Map<String, double> barMap = {};

  @override
  Widget build(BuildContext context) {
    var list = [
      'GGP',
      'POS',
      'AM',
    ];

    String? dropdownValue = list[0];

    void loescher(Fach delSubject) {
      setState(() {
        lernListe.remove(delSubject);
        if (barMap.keys.contains(delSubject.name)) {
          var temp = barMap.entries
              .where((element) => element.key == delSubject.name);
          barMap.update(
              delSubject.name,
              (value) => (value.toInt() - delSubject.minutes).toDouble());

          if (temp.first.value.toInt() == 0) {
            barMap.removeWhere((key, value) => key == delSubject.name);
          }
        }
      });
    }

    void updateFach(Fach newSubject) {
      setState(() {
        lernListe.add(newSubject);

        if (barMap.containsKey(newSubject.name)) {
          barMap.update(
              newSubject.name,
              (value) => (value.toInt() + (newSubject.minutes)).toDouble());
              //              (value) => (value.toInt() - delSubject.minutes).toDouble());
        }

        barMap.putIfAbsent(newSubject.name, () => newSubject.minutes);
        var sortedMap = Map.fromEntries(barMap.entries.toList()
          ..sort(
              (e1, e2) => e2.value.compareTo(e1.value)));
        barMap.clear();
        barMap.addAll(sortedMap);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Zum lernen: '),
      ),
      body: (lernListe.isEmpty)
          ? defaultPage()
          : faecherAnzeige(lernListe, loescher, barMap),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => bottomSheet(
              list,
              dropdownValue,
              lernListe,
              updateFach,
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
