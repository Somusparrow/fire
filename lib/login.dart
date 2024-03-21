import 'package:flutter/material.dart';
import 'auth.dart';
import 'create.dart';
import 'home.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
              final message = await AuthService().login(
                email: emailcontroller.text, password: passwordcontroller.text,);
              if (message!.contains('Success')) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context)=> home()));
              }
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                  ));
            }, child: Text('Login')),
            SizedBox(height: 50,),
            TextButton(onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => create(),),
              );
            }, child: Text('Create Account'))
          ],
        ),
      ),
    );
  }
}
