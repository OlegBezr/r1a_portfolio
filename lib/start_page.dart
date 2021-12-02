import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r1a_portfolio/app_state.dart';
import 'package:r1a_portfolio/main_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({ Key? key }) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final _formKey = GlobalKey<FormState>();

  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          80 * MediaQuery.of(context).size.width / 800.0,
          40 * MediaQuery.of(context).size.width / 800.0, 
          80 * MediaQuery.of(context).size.width / 800.0,
          0
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Test how well ' 
              'you know Oleg Bezrukavnikov as a writer. '
              'On the next page, try to guess the true facts '
              'about his R1A experience.',
              style: TextStyle(
                fontSize: 20.0 * MediaQuery.of(context).size.width / 800.0,
              ),
            ),
            const Spacer(flex: 3),
            Form(
              key: _formKey,
              child: TextFormField(
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0 * MediaQuery.of(context).size.width / 800.0,
                ),
                decoration: const InputDecoration(
                  hintText: 'Enter your name',
                ),
                validator: (value) {
                  if (value == '') {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  name = value ?? '';
                }
              ),
            ),
            const Spacer(flex: 1),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  var appState = Provider.of<AppState>(context, listen: false);
                  appState.setName(name);
                  
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const MainPage()
                    ),
                  );
                }
              },
              child: Text(
                'Start',
                style: TextStyle(
                  fontSize: 35.0 * MediaQuery.of(context).size.width / 800.0,
                )
              ),
            ),
            const Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}