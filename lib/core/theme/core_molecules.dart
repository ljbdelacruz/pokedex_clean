



import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CoreHeaderMol extends StatelessWidget {

  final String header;
  final Function event;
  final double height;
  final Color iconColor;
  final double iconSz;
  final TextStyle titleStyle;
  final Color bgColor;
  CoreHeaderMol({this.header="", this.event, this.height=50, this.iconColor=Colors.white, this.titleStyle, this.iconSz = 20, this.bgColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: bgColor,
        padding:EdgeInsets.only(left:10, right:10),
        width:MediaQuery.of(context).size.width,
        height:height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children:[
            InkWell(onTap:(){
              if(event != null){
                event();
              }
            }, child: Icon(Icons.arrow_back_ios, color: iconColor, size:20)
            ),
            SizedBox(width:30),
            Text(header, style: titleStyle)
        ])
      );
  }
}