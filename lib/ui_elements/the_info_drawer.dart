import 'package:flutter/material.dart';

class TheInfoDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.green,
          ),
          child: Text('Informationen'),
        ),
        Container(
          child: const Column(
            children: [
              Text(
                'Datenschutzerklärung',
              ),
              Text('Diese App sammelt keine Personendaten'),
              Text('Ihre eingegebenen Daten werden '),
              Text('mit Schliessen der App gelöscht.'),
            ],
          ),
        ),
        Container(
          child: const Column(
            children: [
              Text(
                'Impressum',
              ),
              Text('Christian Buchsteiner'),
              Text('christian@buchsteinerconsulting.de'),
              Text('Wacholderweg 15a, D-61440 Oberursel')
            ],
          ),
        ),
      ],
    ));
  }
}
