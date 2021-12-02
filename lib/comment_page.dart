import 'package:flutter/material.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:r1a_portfolio/card_data.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({ Key? key, required this.data }) : super(key: key);

  final CardData data;

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  String _comment = '';
  String _quote = '';

  Future<void> getFileData() async {
    var comment = await rootBundle.loadString('assets/comment${widget.data.id}.md');
    var quote = await rootBundle.loadString('assets/quote${widget.data.id}.md');

    setState(() {
      _comment = comment;
      _quote = quote;
    });
  }

  @override
  void initState() {
    super.initState();

    getFileData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 10.0),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Return",
                    style: TextStyle(
                      fontSize: 30.0 * MediaQuery.of(context).size.width / 800.0
                    ),
                  )
                ),
              ),
              SizedBox(height: 50.0 * MediaQuery.of(context).size.height / 800.0),
              Text(
                widget.data.question,
                style: TextStyle(
                  fontSize: 20.0 * MediaQuery.of(context).size.width / 800.0
                ),
              ),
              SizedBox(height: 50.0 * MediaQuery.of(context).size.height / 800.0),
              if (_quote != '')
                MarkdownBody(
                  data: _quote,
                  styleSheet: MarkdownStyleSheet(
                    p: TextStyle(
                      fontSize: 15.0 * MediaQuery.of(context).size.width / 800.0
                    ),
                  ),
                ),
              SizedBox(height: 50.0 * MediaQuery.of(context).size.height / 800.0),
              if (_comment != '')
                MarkdownBody(
                  data: _comment,
                  styleSheet: MarkdownStyleSheet(
                    p: TextStyle(
                      fontSize: 15.0 * MediaQuery.of(context).size.width / 800.0
                    ),
                  ),
                ),
              const SizedBox(height: 10.0),
            ]
          ),
        ),
      ),
    );
  }
}