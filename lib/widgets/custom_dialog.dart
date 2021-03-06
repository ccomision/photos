import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title, buttonText, oldValue;
  final Function buttonAction;

  CustomDialog({
    @required this.title,
    @required this.buttonText,
    this.oldValue,
    this.buttonAction,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController inputController = TextEditingController(text: oldValue);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 0.0,
      backgroundColor: Colors.white,
      child: _dialogContent(context, inputController),
    );
  }

  _dialogContent(BuildContext context, TextEditingController inputController) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: new BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter name',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter a collection name';
              } else if (value.isNotEmpty) {
                return null;
              }
              return null;
            },
            controller: inputController,
          ),
          SizedBox(height: 24.0),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {
                buttonAction(inputController.text);
              },
              child: Container(
                alignment: Alignment.center,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.blue,
                ),
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
