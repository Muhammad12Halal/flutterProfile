// ignore_for_file: must_be_immutable, avoid_unnecessary_containers
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() {
  runApp(const DatafromAPI());
}

//  must_be_immutable
// class Flutterdemo extends StatelessWidget {
//   Flutterdemo({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Layout Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: Scaffold(
//           appBar: AppBar(
//             title: const Text('Profile Halal'),
//             backgroundColor: Colors.amberAccent,
//           ),
//           body: ListView(
//             children: [
//               Image.asset(
//                 'images/halal1.jpg',
//                 width: 200,
//                 height: 200,
//                 fit: BoxFit.cover,
//               ),
//               titleSection,
//               buttonSection,
//               textSection,
//             ],
//           )),
//     );
//   }

//   //Implement title in row
//   Widget titleSection = Container(
//     padding: const EdgeInsets.all(32),
//     child: Row(
//       children: [
//         Expanded(
//           /*1*/
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               /*2*/
//               Container(
//                 padding: const EdgeInsets.only(bottom: 8),
//                 child: const Text(
//                   'Muhammad Halal Bin Achim',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               const Text(
//                 'Negeri Sembilan, Malaysia',
//                 style: TextStyle(
//                   color: Color.fromARGB(255, 76, 71, 71),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         /*3*/
//         Icon(
//           Icons.star,
//           color: Colors.red[500],
//         ),
//         const Text('41'),
//       ],
//     ),
//   );

//   Widget buttonSection = Row(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: [
//       _buildButtonColumn(color, Icons.call, 'CALL'),
//       _buildButtonColumn(color, Icons.near_me, 'LOCATION'),
//       _buildButtonColumn(color, Icons.share, 'SHARE'),
//     ],
//   );

//   Widget textSection = const Padding(
//     padding: EdgeInsets.all(32),
//     child: Text(
//       'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the'
//       'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a'
//       'half-hour walk through pastures and pine forest, leads you to the '
//       'lake, which warms to 20 degrees Celsius in the summer. Activities '
//       'enjoyed here include rowing, and riding the summer toboggan run.',
//       softWrap: true,
//       style: TextStyle(
//         fontSize: 12,
//         fontFamily: 'Raleway',
//         height: 1.5,
//         letterSpacing: 1.0,
//       ),
//       textAlign: TextAlign.justify,
//     ),
//   );
// }

//Api
class DatafromAPI extends StatefulWidget {
  const DatafromAPI({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _DatafromAPIState createState() => _DatafromAPIState();
}

class User {
  final String name, email, username, website;
  User(this.name, this.email, this.username, this.website);
}

class _DatafromAPIState extends State<DatafromAPI> {
  Future getUserData() async {
    // ignore: prefer_typing_uninitialized_variables
    var url = Uri.https('jsonplaceholder.typicode.com', 'users');
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    List<User> users = [];

    for (var u in jsonData) {
      User user = User(u['name'], u['email'], u['username'], u['website']);
      users.add(user);
    }

    // ignore: avoid_print
    print(users.length);
    return users;
  }

  //This widgert root
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
              title: const Text('Profile API'),
              backgroundColor: Colors.amberAccent,
            ),
            body: Container(
                          child: Card(
                              child: FutureBuilder<dynamic>(
                                  future: getUserData(),
                                  builder: (context, snapshot) {
                                    if (snapshot.data == null) {
                                      return Container(
                                        child: const Center(
                                          child: Text('loading....'),
                                        ),
                                      );
                                    } else {
                                      return ListView.builder(
                                          itemCount: snapshot.data!.length,
                                          itemBuilder: (context, i) {
                                            return ListTile(
                                              leading: const Icon( Icons.person_pin, color: Colors.blueAccent, size: 40.0, ),
                                              title:
                                                 Text(
                                                  snapshot.data![i].name,
                                                  softWrap: true,
                                                  style: const TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'Raleway',
                                                  fontWeight: FontWeight.bold,
                                                  height: 1.5,
                                                  letterSpacing: 1.0,
                                                  ),
                                                  textAlign: TextAlign.justify,
                                                  ),

                                              subtitle: Text(
                                                  snapshot.data![i].email,
                                                  softWrap: true,
                                                  style: const TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'Roboto',
                                                  height: 1.5,
                                                  letterSpacing: 1.0,
                                                  ),
                                                  textAlign: TextAlign.justify,
                                                  ),

                                              trailing:                                       
                                                  Text(
                                                  snapshot.data![i].username,
                                                  softWrap: true,
                                                  style: const TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: 'Raleway',
                                                  height: 1.5,
                                                  letterSpacing: 1.0,
                                                  ),
                                                  ),

                                                                             
                                             );
                                          }
                                      );
                                    }
                                  }
                                  )
                                  )
                              )
                             )
                          );
                      }
                        Widget buttonSection = Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildButtonColumn(color, Icons.call, 'CALL'),
                          _buildButtonColumn(color, Icons.near_me, 'LOCATION'),
                          _buildButtonColumn(color, Icons.share, 'SHARE'),
                        ],
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
