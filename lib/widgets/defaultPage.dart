import 'package:flutter/material.dart';

class defaultPage extends StatelessWidget {
  const defaultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
        child: Text(
          'Bitte Fächer Eingeben',
      ),
    );
  }
}