import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddUserForm extends StatefulWidget {

  @override
  _State createState() => new _State();
}

class _State extends State<AddUserForm> {

  TextEditingController _name = new TextEditingController();
  TextEditingController _company = new TextEditingController();
  int age = 0;
  int code = 0;
  final formKey = GlobalKey<FormState>();

  Future<void> addUser() {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    //Call the user's CollectionReference to add a new user

    return users
        .add({
      'full_name': _name.text,
      'company': _company.text,
      'age': age
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Name here'),
        ),
        body: new Container(
            padding: EdgeInsets.all(30.0),
            child: Form(
              key: formKey,
              child: new Column(
                  children: <Widget>[
                    new TextFormField(
                      decoration: new InputDecoration(
                          labelText: 'Full Name',
                          hintText: 'Tapez votre nom',
                          icon: new Icon(Icons.person)
                      ),
                      validator: (value){
                        if(value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value!)){
                          return "Enter a correct name";
                        } else{
                          return null;
                        }
                      },
                      autocorrect: true,
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      onChanged: (value) => {_name.text= value},
                      //onSubmitted: _onSubmit,
                    ),
                    new TextFormField(
                      decoration: new InputDecoration(
                          labelText: 'Company',
                          hintText: 'Write your company',
                          icon: new Icon(Icons.people)
                      ),
                      validator: (value){
                        if(value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value!)){
                          return "Enter a correct name";
                        } else{
                          return null;
                        }
                      },
                      autocorrect: true,
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      onChanged: (value) => {_company.text= value},
                      //onSubmitted: _onSubmit,
                    ),
                    new TextFormField(
                      decoration: new InputDecoration(
                          labelText: 'Age',
                          hintText: 'Write your age',
                          icon: new Icon(Icons.people)
                      ),
                      validator: (value){
                        if(value!.isEmpty || RegExp(r'^[a-z A-Z]+$').hasMatch(value!)){
                          return "Enter a correct name";
                        } else{
                          return null;
                        }
                      },
                      autocorrect: true,
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      onChanged: (value) => {age = int.parse(value)},
                      //onSubmitted: _onSubmit,
                    ),
                    SizedBox(
                      height: 25, // <-- SEE HERE
                    ),
                    Container(
                        padding: EdgeInsets.all(30.0),
                        child: ElevatedButton(
                          onPressed: addUser,
                          child: Text("Gradient"),
                        )
                    ),
                    /*TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.all(16.0),
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: addUser,
                      child: const Text('Gradient'),
                    ),*/
                  ]),
            )
        )

    );
  }
}