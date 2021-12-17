import 'package:flutter/material.dart';

class MyFirst extends StatefulWidget {
  const MyFirst({Key? key}) : super(key: key);

  @override
  _MyFirstState createState() => _MyFirstState();
}

class _MyFirstState extends State<MyFirst> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Welcome'),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 200),
              RaisedButton(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 63.0),
                  onPressed: () {
                    Navigator.pushNamed(context, 'login');
                  },
                  color: Colors.lightBlueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  )),
              SizedBox(height: 20),
              RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
                onPressed: () {
                  Navigator.pushNamed(context, 'register');
                },
                color: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 15.0, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
