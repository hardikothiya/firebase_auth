import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_parth/profile.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    String email = ' ';
    String password = '';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
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
                    icon: Icon(Icons.security)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () {}, child: Text('Forgot password?'))
                ],
              ),
              RaisedButton(
                padding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
                color: Colors.lightBlueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
                onPressed: () async {
                  print("user name ${email} and password $password");
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email, password: password);
                    print("user credential is ${userCredential.toString()}");

                    Navigator.pushNamed(context, 'profile');
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      Fluttertoast.showToast(
                          msg: 'No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      Fluttertoast.showToast(
                          msg: 'Wrong password provided for that user.');
                    }
                  }
                },
                child: const Text(
                  'Submit',
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
