import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/sliver.dart';
import 'package:firebase_parth/profile.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text('Complete profile'))),
        body: SafeArea(
          child: Container(
            child: ListView(
              children: [
                SizedBox(height: 20),
                CircleAvatar(radius: 60, child: Icon(Icons.person, size: 60)),
                TextField(
                    decoration: const InputDecoration(
                        hintText: 'Full name',
                        labelText: 'Full name',
                        icon: Icon(Icons.person))),
                SizedBox(height: 20),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'profile');
                  },
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: Text('Submit',
                      style: TextStyle(fontSize: 15.0, color: Colors.white)),
                  color: Colors.lightBlueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
