import 'package:flutter/material.dart';

class ControlsWidget extends StatelessWidget {
  final VoidCallback onClickedPickImage;
  final VoidCallback onClickedScanText;
  final VoidCallback onClickedClear;
  final VoidCallback onClickedCamera;//

  const ControlsWidget({
    @required this.onClickedPickImage,
    @required this.onClickedCamera,//
    @required this.onClickedScanText,
    @required this.onClickedClear,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            onPressed: onClickedPickImage,
            onLongPress: onClickedCamera,//
            color: Color(0xff96abb0),
            child: Text('Bild auswählen'),
          ),
          const SizedBox(width: 8),
          RaisedButton(
            onPressed: onClickedScanText,
            color: Color(0xff96abb4),
            child: Text('Bild konvertieren'),
          ),
          const SizedBox(width: 8),
          RaisedButton(
            onPressed: onClickedClear,
            color: Color(0xff96abb8),
            child: Text('Neu'),
          )
        ],
      );
}
