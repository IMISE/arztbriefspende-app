import 'package:flutter/material.dart';

class TextAreaWidget extends StatelessWidget {
  final String text;
 // final VoidCallback onClickedCopy;

  const TextAreaWidget({
    @required this.text,
  //  @required this.onClickedCopy,
    Key key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: Container(
              height: 187,
              width: Checkbox.width,
              decoration: BoxDecoration(border: Border.all()),
              padding: EdgeInsets.all(5),
              alignment: Alignment.center,
              child: TextField(//SelectableText
               // text.isEmpty ? 'Text aus dem Bild' : text,
                controller: TextEditingController()..text = text,
                onChanged: (text) => {},
                keyboardType: TextInputType.multiline,
                scrollController: ScrollController(),
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,

                ),

                //textAlign: TextAlign.center,
              ),
            ),
          ),
         // const SizedBox(width: 2),
        /*  IconButton(
            icon: Icon(Icons.copy, color: Colors.black),
            color: Colors.blueGrey[50],
            onPressed: onClickedCopy,
          ),*/
        ],
      );
}
