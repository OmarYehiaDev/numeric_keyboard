library numeric_keyboard;

import 'package:flutter/material.dart';

typedef KeyboardTapCallback = void Function(String text);

class NumericKeyboard extends StatefulWidget {
  /// Color of the text [default = Colors.black]
  final Color textColor;

  /// Display a custom right icon
  final Icon? rightIcon;

  /// Action to trigger when right button is pressed
  final Function()? rightButtonFn;

  /// Action to trigger when right button is long pressed
  final Function()? rightButtonLongFn;

  /// Display a custom left icon
  final Icon? leftIcon;

  /// Action to trigger when left button is pressed
  final Function()? leftButtonFn;

  /// Action to trigger when left button is long pressed
  final Function()? leftButtonLongFn;

  /// Callback when an item is pressed
  final KeyboardTapCallback onKeyboardTap;

  /// Main axis alignment [default = MainAxisAlignment.spaceEvenly]
  final MainAxisAlignment mainAxisAlignment;

  /// Top padding  [default = 20]
  final double topPadding;

  /// Bottom padding [default = 0]
  final double bottomPadding;

  /// Start padding [default = 32]
  final double startPadding;

  /// End padding [default = 32]
  final double endPadding;

  NumericKeyboard({
    Key? key,
    required this.onKeyboardTap,
    this.textColor = Colors.black,
    this.rightButtonFn,
    this.rightButtonLongFn,
    this.rightIcon,
    this.leftButtonFn,
    this.leftButtonLongFn,
    this.leftIcon,
    this.mainAxisAlignment = MainAxisAlignment.spaceEvenly,
    this.topPadding = 20,
    this.bottomPadding = 0,
    this.startPadding = 32,
    this.endPadding = 32,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NumericKeyboardState();
  }
}

class _NumericKeyboardState extends State<NumericKeyboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        start: widget.startPadding,
        end: widget.endPadding,
        top: widget.topPadding,
        bottom: widget.bottomPadding,
      ),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('1'),
              _calcButton('2'),
              _calcButton('3'),
            ],
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('4'),
              _calcButton('5'),
              _calcButton('6'),
            ],
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('7'),
              _calcButton('8'),
              _calcButton('9'),
            ],
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              InkWell(
                borderRadius: BorderRadius.circular(45),
                onTap: widget.leftButtonFn,
                onLongPress: widget.leftButtonLongFn,
                child: Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 50,
                  child: widget.leftIcon,
                ),
              ),
              _calcButton('0'),
              InkWell(
                borderRadius: BorderRadius.circular(45),
                onTap: widget.rightButtonFn,
                onLongPress: widget.rightButtonLongFn,
                child: Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 50,
                  child: widget.rightIcon,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _calcButton(String value) {
    return InkWell(
      borderRadius: BorderRadius.circular(45),
      onTap: () {
        widget.onKeyboardTap(value);
      },
      child: Container(
        alignment: Alignment.center,
        width: 50,
        height: 50,
        child: Text(
          value,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: widget.textColor,
          ),
        ),
      ),
    );
  }
}
