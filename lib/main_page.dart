import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r1a_portfolio/app_state.dart';
import 'package:r1a_portfolio/card_data.dart';
import 'package:r1a_portfolio/questions.dart';
import 'package:r1a_portfolio/results_page.dart';

import 'flip_card.dart';

class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late List<CardData> shuffledQuestions;

  @override
  void initState() {
    super.initState();
    shuffledQuestions = [
      ...questions,
    ];
    shuffledQuestions.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);
    var triesLeft = appState.triesLeft;
    var score = appState.score;
    var name = appState.name;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
          40, 40, 40, 0
        ),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 6),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 25.0 * MediaQuery.of(context).size.width / 800.0
                    ),
                  ),
                  const Spacer(flex: 1),
                  Text(
                    'Tries left: $triesLeft',
                    style: TextStyle(
                      fontSize: 15.0 * MediaQuery.of(context).size.width / 800.0
                    ),
                  ),
                  const Spacer(flex: 1),
                  Text(
                    'Score: $score',
                    style: TextStyle(
                      fontSize: 15.0 * MediaQuery.of(context).size.width / 800.0
                    ),
                  ),
                  if (appState.triesLeft == 0)
                    const Spacer(flex: 1),
                  if (appState.triesLeft == 0)
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const ResultsPage()
                          )
                        );
                      }, 
                      child: Text(
                        'Results',
                        style: TextStyle(
                          fontSize: 15.0 * MediaQuery.of(context).size.width / 800.0
                        ),
                      )
                    ),
                  const Spacer(flex: 9),
                ]
              ),
            ),
            SizedBox(width: 40 * MediaQuery.of(context).size.width / 800.0),
            Flexible(
              flex: 5,
              child: GridView.count(
                crossAxisCount: 4,
                children: List<Widget>.generate(
                  shuffledQuestions.length, 
                  (int index) {
                    return FlipCard(
                      key: ValueKey(index),
                      data: shuffledQuestions[index],
                    );
                  }
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}