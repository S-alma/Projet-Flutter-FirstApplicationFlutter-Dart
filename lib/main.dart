import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'formulaire.dart';
import 'signin.dart';
import 'signup.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {

  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {

  final String _value = '';
  int _selectedIndex = 0;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;

      if(index == 1){
        Navigator.push(context,MaterialPageRoute(builder: (context) => Formulaire() ));
      }
      if(index ==2){
        Navigator.push(context,MaterialPageRoute(builder: (context) => Signin() ));
      }
      if(index ==3){
        Navigator.push(context,MaterialPageRoute(builder: (context) => Signup() ));
      }
    });
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('The Flutter Application'),
      ),
      ),
      drawer: new Drawer(
        child: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Column(
            children: <Widget>[
              new TextButton(onPressed: () => _onItemTapped(1), child: new Text('Formulaire')),
              new TextButton(onPressed: () => _onItemTapped(2), child: new Text('Sign-in')),
              new TextButton(onPressed: () => _onItemTapped(3), child: new Text('Sign-up')),
              new TextButton(onPressed: () => Navigator.pop(context), child: new Text('Close'),)
            ],
          ),
        ),
      ),
      body: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Column(
            children: <Widget>[
              SizedBox(
                height: 50, // <-- SEE HERE
              ),
              Center(
                child: Text(
                  'Welcome to The Application',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 45),
                ),
              ),
              SizedBox(
                height: 50, // <-- SEE HERE
              ),
              Image(image: AssetImage('assets/welcome.png')),
              new Text(_value),
              SizedBox(
                height: 40, // <-- SEE HERE
              ),
              Center(
                child: Text(
                  'By : Salma CHERKAOUI and Hind ELOUAZZANI',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 25, // <-- SEE HERE
              ),
              Center(
                child: Text(
                  'Class : 5IIR3 Group 1',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          )
      ),
      /*bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_download),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Signin',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Signup',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),*/
    );
  }
}