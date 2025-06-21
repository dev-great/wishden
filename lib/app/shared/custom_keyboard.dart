import 'package:wishden/app/shared/app_decoration.dart';
import 'package:wishden/app/styels/ui_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NumericKeypad extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  const NumericKeypad(
      {super.key, required this.controller, required this.focusNode});

  @override
  State<NumericKeypad> createState() => _NumericKeypadState();
}

class _NumericKeypadState extends State<NumericKeypad> {
  late TextEditingController _controller;
  late TextSelection _selection;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    // add listener to controller
    _controller = widget.controller..addListener(_onSelectionChanged);
    _selection = _controller.selection;
    _focusNode = widget.focusNode;
  }

  @override
  void dispose() {
    // remove listener
    _controller.removeListener(_onSelectionChanged);

    super.dispose();
  }

  void _onSelectionChanged() {
    setState(() {
      // update selection on change (updating position too)
      _selection = _controller.selection;
    });
    if (kDebugMode) {
      print('Cursor position: ${_selection.base.offset}');
    } // print position
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(19.0),
      child: Column(
        children: [
          Row(
            children: [
              _buildButton('1', '', true),
              _buildButton('2', '', true),
              _buildButton('3', '', true),
            ],
          ),
          Row(
            children: [
              _buildButton('4', '', true),
              _buildButton('5', '', true),
              _buildButton('6', '', true),
            ],
          ),
          Row(
            children: [
              _buildButton('7', '', true),
              _buildButton('8', '', true),
              _buildButton('9', '', true),
            ],
          ),
          Row(
            children: [
              _buildButton('', '', false, onPressed: _hideKeyboard),
              _buildButton('0', '', true),
              _buildButton('⌫', '', false, onPressed: _backspace),
            ],
          ),
        ],
      ),
    );
  }

// Individual keys
  Widget _buildButton(String text, String? buttomtext, bool? bgcolor,
      {VoidCallback? onPressed}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 80,
          width: screenWidth(context, 3.3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.transparent,
          ),
          child: InkWell(
            onTap: onPressed ?? () => _input(text),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: headerTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _input(String text) {
    int position = _selection.base.offset; // gets position of cursor
    var value = _controller.text; // text in our textfield
    if (value.length + text.length <= 6) {
      if (value.isNotEmpty) {
        var suffix = value.substring(position, value.length);

        value = value.substring(0, position) + text + suffix;

        _controller.text =
            value; // 3) set our controller text to the gotten value
        _controller.selection = TextSelection.fromPosition(
            TextPosition(offset: position + 1)); // 4) update selection
        // to update our position.
      } else {
        value =
            _controller.text + text; // 5) appends controller text and new input
        // and assigns to value
        _controller.text =
            value; // 6) set our controller text to the gotten value
        _controller.selection =
            TextSelection.fromPosition(const TextPosition(offset: 1));
      }
    }
  }

  void _backspace() {
    int position = _selection.base.offset; // cursor position
    final value = _controller.text; // string in out textfield

    // 1) only erase when string in textfield is not empty and when position is not zero (at the start)
    if (value.isNotEmpty && position != 0) {
      var suffix = value.substring(
          position, value.length); // 2) get string after cursor position
      _controller.text = value.substring(0, position - 1) +
          suffix; // 3) get string before the cursor and append to
      // suffix after removing the last char before the cursor
      _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: position - 1)); // 4) update the cursor
    }
  }

  _hideKeyboard() => _focusNode.unfocus();
}
