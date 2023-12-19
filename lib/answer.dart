import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;
  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        // Set the button style
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
        // Set the text color
        child: Text(
          answerText,
          style: TextStyle(color: Colors.white), // Corrected syntax
        ),
        // Execute the provided function when the button is pressed
        onPressed: selectHandler, // Pass the selectHandler function here
      ),
    );
  }
}
