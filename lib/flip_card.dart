import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:r1a_portfolio/app_state.dart';
import 'package:r1a_portfolio/comment_page.dart';

import 'card_data.dart';

class FlipCard extends StatefulWidget {
  const FlipCard({Key? key, required this.data, this.flipped = false}) : super(key: key);

  final CardData data;
  final bool flipped;

  @override
  _FlipCardState createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard> {
  late bool _showFrontSide;
  late bool _flipXAxis;

  @override
  void initState() {
    super.initState();
    _showFrontSide = !widget.flipped;
    _flipXAxis = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      constraints: BoxConstraints.tight(const Size.square(200.0)),
      child: _buildFlipAnimation(),
    );
  }

  void _switchCard() {
    var appState = Provider.of<AppState>(context, listen: false);
    if (_showFrontSide && appState.triesLeft > 0) {
      appState.answer(widget.data.isFake);
      setState(() {
        _showFrontSide = false;
      });
    }
  }

  Widget _buildFlipAnimation() {
    return GestureDetector(
      onTap: _switchCard,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 800),
        transitionBuilder: __transitionBuilder,
        layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
        child: _showFrontSide ? _buildFront() : _buildRear(),
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeInBack.flipped,
      ),
    );
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_showFrontSide) != widget?.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value = isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: _flipXAxis
              ? (Matrix4.rotationY(value)..setEntry(3, 0, tilt))
              : (Matrix4.rotationX(value)..setEntry(3, 1, tilt)),
          child: widget,
          alignment: Alignment.center,
        );
      },
    );
  }

  Widget _buildFront() {
    return __buildLayout(
      key: const ValueKey(true),
      backgroundColor: Colors.blue,
      faceName: widget.data.question,
    );
  }

  Widget _buildRear() {
    return __buildLayout(
      key: const ValueKey(false),
      backgroundColor: widget.data.isFake ? Colors.red.shade300 : Colors.green.shade300,
      faceName: widget.data.answer,
      child: widget.data.isFake ? null : TextButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CommentPage(
                data: widget.data,
              ),
            ),
          );
        }, 
        child: Text(
          'Learn more',
          style: TextStyle(
            fontSize: 10.0 * MediaQuery.of(context).size.width / 800.0
          ),
        )
      )
    );
  }

  Widget __buildLayout({
    required Key key, 
    Widget? child, 
    required String faceName, 
    required Color backgroundColor
  }) {
    return Container(
      key: key,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20.0),
        color: backgroundColor,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              faceName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.0 * MediaQuery.of(context).size.width / 800.0
              ),
            ),
            if (child != null) 
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: child,
              ),
          ],
        ),
      ),
    );
  }
}