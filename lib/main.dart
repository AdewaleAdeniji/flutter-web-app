import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(const SignupApp());

class SignupApp extends StatelessWidget {
  const SignupApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      routes: {
        '/': (context) => const SignupScreen(),
        '/dashboard': (context) => const WelcomeScreen()
      },
    );
  }
}

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: const Center(
        child: SizedBox(
          width: 400,
          height: 300,
          child: Card(
            child: SignupForm(),
          ),
        ),
      ),
    );
  }
}
class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);
  @override
  _SignUpFormState createState() => _SignUpFormState();
}
class _SignUpFormState extends State<SignupForm> {
   final _NameTextController = TextEditingController();
   final _UsernameTextController =  TextEditingController();
    double formProgress = 0;
   @override
  Widget build(BuildContext context) {
    // TODO: implement build
     void showWelcomeScreen() {
       Navigator.of(context).pushNamed('/dashboard');
     }
     void updateFormProgress(){
       var progress = 0.0;
        final allForm = [_NameTextController, _UsernameTextController];
        for(final formInput in allForm){
          if(formInput.value.text.isNotEmpty){
            progress += 1/allForm.length;
          }
        }
        setState(() {
          formProgress =  progress;
        });
     }
    return Form(
        onChanged: updateFormProgress,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(padding: EdgeInsets.all(8.0),
            child:
            Text('Sign up', style: TextStyle(
              fontSize: 20,
              color: Colors.green,
            ),),),
            Padding(padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _NameTextController,
              decoration: const InputDecoration(hintText: 'First Name'),
            ),),
            Padding(padding:const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _UsernameTextController,
                decoration: const InputDecoration(hintText: 'Your User Name'),
              ),),
            Padding(
                padding: const EdgeInsets.all(20),
            child: TextButton(
                onPressed: formProgress == 1 ? showWelcomeScreen : null,
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                    return Colors.white;
                  }),
                  backgroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                    return Colors.green;
                  }),
                ),
                child: const Text('Proceed to Dashboard')
            )
           )
          ],
    )
    );
  }

}
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Welcome to the dashboard', style: TextStyle(
          fontSize: 20
        )),
      ),
    );
  }
}