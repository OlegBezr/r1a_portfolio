import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r1a_portfolio/app_state.dart';
import 'package:r1a_portfolio/flip_card.dart';
import 'package:r1a_portfolio/questions.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);
    var name = appState.name;
    var score = appState.score;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 0.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                "$name, you scored $score out of 8.",
                style: TextStyle(
                  fontSize: 30.0 * MediaQuery.of(context).size.width / 800.0
                ),
              )
            ),
            SizedBox(height: 50 * MediaQuery.of(context).size.height / 800.0),
            Text(
              "See all true facts about Oleg's R1A experience below.",
              style: TextStyle(
                fontSize: 25.0 * MediaQuery.of(context).size.width / 800.0
              ),
            ),
            SizedBox(height: 40 * MediaQuery.of(context).size.height / 800.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.count(
                  crossAxisCount: 4,
                  children: List<Widget>.generate(
                    trueQuestions.length, 
                    (int index) {
                      return FlipCard(
                        data: trueQuestions[index],
                        flipped: true,
                      );
                    }
                  ),
                ),
              ),
            ),
          ]
        ),
      )
    );
  }
}