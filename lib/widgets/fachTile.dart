import 'package:flutter/material.dart';
import 'package:lern_app/domain/fach.dart';

class fachTile extends StatelessWidget {
  final Fach fullLearnSubjectList;
  final void Function(Fach delSubject) delSubjectTile;

  const fachTile(this.fullLearnSubjectList, this.delSubjectTile, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
      child: Card(
        child: ListTile(
          leading: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.blue,
                width: 2.5,
              ),
            ),
            child: Text(
              fullLearnSubjectList.minutes.toString(),
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          title: Text(fullLearnSubjectList.name),
          subtitle: Text(fullLearnSubjectList.date),
          trailing: IconButton(
            onPressed: () {
              delSubjectTile(fullLearnSubjectList);
            },
            icon: Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
