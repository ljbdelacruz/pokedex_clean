


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';






//atom

class IconButtonAtom extends StatelessWidget {
  final Color iconColor;
  final IconData icon;
  final double size;
  final Function event;
  IconButtonAtom({this.icon, this.size=10, this.iconColor = Colors.white, this.event});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(onTap:(){
      if(event != null){
        event();
      }
    }, child: Icon(icon, size:size, color: iconColor));
  }
  
}

class RawMaterialAtom extends StatelessWidget{
  final Function onClick;
  final Color bgColor;
  final double radius;
  final double elevation;
  final Widget content;
  RawMaterialAtom({this.onClick, this.bgColor = Colors.blue, this.radius = 100, this.elevation=0, this.content});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: (){
        if(onClick != null){
          onClick();
        }
      },
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(radius))),
      fillColor: bgColor,
      elevation: elevation,
      child: content
    );
  }
}

class SemiTransparentAtom extends StatelessWidget{
  final Color bgColor;
  SemiTransparentAtom(this.bgColor);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width:MediaQuery.of(context).size.width,
      height:MediaQuery.of(context).size.height,
      color: bgColor.withOpacity(0.6)
    );
  }
}

class EmptyTextFieldAtom extends StatelessWidget{
  final TextAlign align;
  final TextInputType keyboard;
  final TextStyle styleutil;
  final bool isEnabled;
  final Function onChangeEvent;
  final TextEditingController controller;
  final List<TextInputFormatter> inputFormatters;
  final int maxLength;
  final Function onTapEvent;
  final Function onEditComplete;
  final TextStyle toolBarStyle;
  final bool isPassword;
  final String hintText;
  final TextStyle hintTextStyle;
  EmptyTextFieldAtom({this.align = TextAlign.left, this.keyboard=TextInputType.text, this.styleutil, this.isEnabled=true, this.onChangeEvent, this.controller, this.inputFormatters, this.maxLength=0, this.onTapEvent, this.toolBarStyle, this.onEditComplete, this.isPassword=false, this.hintText="", this.hintTextStyle});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
            obscureText: isPassword,
            inputFormatters: inputFormatters,
            keyboardType: keyboard,
            maxLength: maxLength == 0 ? null : maxLength,
            textAlign: align,
            style: styleutil,
            enabled: isEnabled,
            onTap: (){
              if(onTapEvent != null){
                onTapEvent();
              }
            },
            onEditingComplete: (){
              if(onEditComplete != null){
                onEditComplete();
              }
            },
            onChanged: (data){
              if(onChangeEvent != null){
                onChangeEvent();
              }
            },
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: hintTextStyle,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              counterText: "",
            ),
            controller:controller
      );
  }
}

//molecules


//organisms