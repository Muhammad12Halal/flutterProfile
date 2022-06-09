// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

void main() {
  runApp(Flutterdemo());
}

//  must_be_immutable
class Flutterdemo extends StatelessWidget {
  Flutterdemo({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Profile Halal'),
            backgroundColor: Colors.amberAccent,
          ),
          body: ListView(
            children: [
              Image.asset(
                'images/halal1.jpg',
                width: 200,
                height: 200,
                fit: BoxFit.cover, 
              ),
              titleSection,
              buttonSection,
              textSection,
            ],
          )),
    );
  }

  //Implement title in row
  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          /*1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*2*/
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text('Muhammad Halal Bin Achim',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text('Negeri Sembilan, Malaysia',
                style: TextStyle(
                  color: Color.fromARGB(255, 76, 71, 71),
                ),
              ),
            ],
          ),
        ),
        /*3*/
        Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        const Text('41'),
      ],
    ),
  );

    Widget buttonSection = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildButtonColumn(color, Icons.call, 'CALL'),
      _buildButtonColumn(color, Icons.near_me, 'LOCATION'),
      _buildButtonColumn(color, Icons.share, 'SHARE'),
    ],
    );

    Widget textSection = const Padding(
    padding: EdgeInsets.all(32),
    child: Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the' 
      'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a'
      'half-hour walk through pastures and pine forest, leads you to the '
      'lake, which warms to 20 degrees Celsius in the summer. Activities '
      'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true,
      style: TextStyle(
        fontSize: 12,
        fontFamily: 'Raleway',
        height: 1.5,
        letterSpacing: 1.0, 
      ),
        textAlign: TextAlign.justify,
    ),
  );

}

Color color = ThemeData.light().primaryColor;
Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}
