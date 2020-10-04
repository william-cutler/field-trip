import 'package:field_trip_project/data/task.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final WritingTask task;
  final controller = TextEditingController();
  TextWidget({Key key, this.task}) : super(key: key) {
    controller.text = this.task.response;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            width: MediaQuery.of(context).size.width * 0.90,
            child: Text(this.task.prompt,
                style: TextStyle(
                  color: Color(0xff565656),
                  fontSize: 18,
                  fontFamily: "Helvetica Neue",
                  fontWeight: FontWeight.w400,
                ))),
        SizedBox(height: 8),
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: Color(0xff885566))),
            width: MediaQuery.of(context).size.width * 0.90,
            child: TextFormField(
              decoration: new InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
              ),
              maxLines: null,
              controller: this.controller,
            )),
        Center(
            child: Container(
          width: 100.0,
          child: RaisedButton(
              color: Color(0xff885566),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)),
              child: Text('Save',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w400,
                  )),
              onPressed: () {
                this.task.setResponse(controller.text);
              }),
        )),
      ],
    );
  }
}
