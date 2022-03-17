import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:lern_app/domain/fach.dart';

class bottomSheet extends StatefulWidget {
  final List<String> faecher;
  List<Fach> lernListe;
  String? dropdownValue;
  final void Function(Fach newSubject) faecherListe;

  bottomSheet(this.faecher, this.dropdownValue, this.lernListe, this.faecherListe,
      {Key? key})
      : super(key: key);

  @override
  State<bottomSheet> createState() => _bottomSheetState();
}

class _bottomSheetState extends State<bottomSheet> {
  late TextEditingController _controler = new TextEditingController();

  DateTime selectedDate = DateTime.now();


  @override
  Widget build(BuildContext context) {
    var dateTime = DateTime.now().toString().split(' ');
    var date = dateTime.first.toString();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: TextField(
            controller: _controler,
            decoration: InputDecoration(labelText: 'Minuten'),
            keyboardType: TextInputType.number,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: DateTimeField(
            decoration: const InputDecoration(
              hintStyle: TextStyle(color: Colors.black45),
              errorStyle: TextStyle(color: Colors.redAccent),
              suffixIcon: Icon(Icons.event_note),
              labelText: 'Datum: ',
            ),
            mode: DateTimeFieldPickerMode.date,
            onDateSelected: (DateTime value) {
              setState(() {
                selectedDate = value;
                dateTime = value.toString().split(' ');
                date = dateTime.first.toString();
                //print(date);
              });
              print(value);
            },
            selectedDate: selectedDate,
          ),
        ),
        DropdownButton(
            value: widget.dropdownValue,
            items: widget.faecher.map((String subjects) {
              return DropdownMenuItem(
                value: subjects,
                child: Text(subjects),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                widget.dropdownValue = newValue!;
              });
            }),
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.all(10.0),
          child: FlatButton(
            child: Text('Einfügen'),
            onPressed: () {
              if(_controler.text.isEmpty){
                throw Exception('IllegalArgumentException');
              }
              var newSubject = new Fach(widget.dropdownValue, double.parse(_controler.text), date);
              widget.faecherListe(newSubject);
                Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}
