import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'home.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  @override
  Widget build(BuildContext context) {
    String email = ' ', password = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (value) {
                  email = value;
                },
                decoration: const InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  icon: Icon(Icons.attach_email),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      icon: Icon(Icons.security))),
              SizedBox(height: 20),
              RaisedButton(
                padding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
                color: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0))),
                onPressed: () async {
                  try {
                    bool loading = true;
                    UserCredential userCredential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: email, password: password);
                    Navigator.pushNamed(context, 'home');
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      Fluttertoast.showToast(
                          msg: 'The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      Fluttertoast.showToast(
                          msg: 'The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text(
                  'Create',
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
