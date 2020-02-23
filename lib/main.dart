import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Main(),
    );
  }
}


class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  String tap = 'n'; // n stands for not tapped, y stands for tapped
  Color c = Colors.deepPurple; // border highlight color

  Container builder(String tap){
    if(tap == 'n'){
      return  Container(
        padding: EdgeInsets.only(left: 20.0, right: 20, top: 20, bottom: 120),
        color: Colors.white30,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100.0,
            ),
            Row(
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.deepPurple,
                      width: 5,
                    ),
                  ),
                  child: Opacity(
                    child: Container(
                      color: Colors.deepPurple,
                      height: 38,
                      width: 38,
                    ),
                    opacity: 0.2,
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Text(
                  'Nodules',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.redAccent,
                      width: 5,
                    ),
                  ),
                  child: Opacity(
                    child: Container(
                      color: Colors.redAccent,
                      height: 38,
                      width: 38,
                    ),
                    opacity: 0.2,
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Text(
                  'Hydrothermal Vents',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.grey,
                      width: 5,
                    ),
                  ),
                  child: Opacity(
                    child: Container(
                      color: Colors.grey,
                      height: 38,
                      width: 38,
                    ),
                    opacity: 0.2,
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Text(
                  'Debris',
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'OpenSans',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      );
    }
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 20, top: 20, bottom: 120),
      color: Colors.white30,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 100.0,
          ),
          Row(
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.deepPurple,
                    width: 5,
                  ),
                ),
                child: Opacity(
                  child: Container(
                    color: Colors.deepPurple,
                    height: 38,
                    width: 38,
                  ),
                  opacity: 0.2,
                ),
              ),
              SizedBox(
                width: 40,
              ),
              Text(
                'Nodules',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'OpenSans',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.redAccent,
                    width: 5,
                  ),
                ),
                child: Opacity(
                  child: Container(
                    color: Colors.redAccent,
                    height: 38,
                    width: 38,
                  ),
                  opacity: 0.2,
                ),
              ),
              SizedBox(
                width: 40,
              ),
              Text(
                'Hydrothermal Vents',
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'OpenSans',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.grey,
                    width: 5,
                  ),
                ),
                child: Opacity(
                  child: Container(
                    color: Colors.grey,
                    height: 38,
                    width: 38,
                  ),
                  opacity: 0.2,
                ),
              ),
              SizedBox(
                width: 40,
              ),
              Text(
                'Debris',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'OpenSans',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black,
                  width: 5,
                ),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    'Nodules',
                    style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  Image.asset('images/Nodule.png'),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Depth: 7.8km',
                    style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Uses: Valuable metal deposits that may be used in production for various industries.',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    'Explore further?',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'OpenSans',
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Rent one of our drones',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'OpenSans',
                      color: Colors.lightBlue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6FBFF),
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: builder(tap),
          ),
          Expanded(
            flex: 3,
            child: Stack(
              children: <Widget>[
                Image.asset('images/atlantic.jpg'),
                Positioned(
                  bottom: 170,
                  left: 300,
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 5,
                        ),
                      ),
                      child: Opacity(
                        child: Container(
                          color: Colors.deepPurple,
                          height: 190,
                          width: 110,
                        ),
                        opacity: 0.2,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 200,
                  right: 400,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.redAccent,
                        width: 5,
                      ),
                    ),
                    child: Opacity(
                      child: Container(
                        color: Colors.redAccent,
                        height: 20,
                        width: 20,
                      ),
                      opacity: 0,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 300,
                  right: 380,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.redAccent,
                        width: 5,
                      ),
                    ),
                    child: Opacity(
                      child: Container(
                        color: Colors.redAccent,
                        height: 20,
                        width: 20,
                      ),
                      opacity: 0,
                    ),
                  ),
                ),
                Positioned(
                  top: 200,
                  right: 500,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.redAccent,
                        width: 5,
                      ),
                    ),
                    child: Opacity(
                      child: Container(
                        color: Colors.redAccent,
                        height: 20,
                        width: 20,
                      ),
                      opacity: 0,
                    ),
                  ),
                ),
                Positioned(
                  top: 400,
                  left: 350,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.redAccent,
                        width: 5,
                      ),
                    ),
                    child: Opacity(
                      child: Container(
                        color: Colors.redAccent,
                        height: 20,
                        width: 20,
                      ),
                      opacity: 0,
                    ),
                  ),
                ),
                Positioned(
                  top: 200,
                  right: 350,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.grey,
                        width: 5,
                      ),
                    ),
                    child: Opacity(
                      child: Container(
                        color: Colors.grey,
                        height: 60,
                        width: 80,
                      ),
                      opacity: 0.2,
                    ),
                  ),
                ),
                Positioned(
                  top: 300,
                  right: 460,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.grey,
                        width: 5,
                      ),
                    ),
                    child: Opacity(
                      child: Container(
                        color: Colors.grey,
                        height: 40,
                        width: 60,
                      ),
                      opacity: 0.2,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 415,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        if(tap == 'n'){
                          c = Colors.yellow;
                          tap = 'y';
                        }
                        else{
                          c = Colors.deepPurple;
                          tap = 'n';
                        }
                      });
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: c,
                          width: 5,
                        ),
                      ),
                      child: Opacity(
                        child: Container(
                          color: Colors.deepPurple,
                          height: 90,
                          width: 270,
                        ),
                        opacity: 0.2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

