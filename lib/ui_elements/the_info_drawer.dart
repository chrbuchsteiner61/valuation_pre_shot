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
          color: Colors.lightBlue,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Datenschutzerklärung',
              ),
              Text('Diese App sammelt und verarbeitet keine Personendaten'),
              Text('Ihre eingegebenen Daten werden '),
              Text('mit Schliessen der App gelöscht.'),
            ],
          ),
        ),
        Text(''),
        Container(
          color: Colors.lightBlue,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kontakt',
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
