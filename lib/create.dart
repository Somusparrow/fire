import 'package:firec/auth.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class create extends StatefulWidget {
  const create({super.key});

  @override
  State<create> createState() => _createState();
}

class _createState extends State<create> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 400,
              child: TextField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                ),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              width: 400,
              child: TextField(
                controller: passwordcontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              ),
            ),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: () async{
              final message = await AuthService().registration(
                  email: emailcontroller.text, password: passwordcontroller.text,);
              if (message!.contains('Success')) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context)=> home()));
              }
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                 ));
            }, child: Text('Create Account')),
          ],
        ),
      ),
    );
  }


}
