


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const Color fpv3BGColor = Colors.white;

class CoreThemeBackground extends StatelessWidget{
  final double headerHeight;
  final Widget footer;
  final Widget drawer;
  final Widget endDrawer;
  final Widget header;
  final Color bgColor;
  final Widget content;
  final GlobalKey<ScaffoldState> scaffoldKey;
  CoreThemeBackground(this.content,{this.header, this.headerHeight=0, this.footer, this.drawer, this.endDrawer, this.bgColor = fpv3BGColor, this.scaffoldKey});
  @override
  Widget build(BuildContext context) {
        return SafeArea(child:Scaffold(
              key: scaffoldKey,
              appBar:PreferredSize(preferredSize: Size.fromHeight(headerHeight) , child: header != null ? header : Container()),
              body:Container(
                color:bgColor,
                width:MediaQuery.of(context).size.width,
                height:MediaQuery.of(context).size.height,
                child:content),
              bottomNavigationBar: footer,
              drawer: drawer,
              endDrawer: endDrawer,
            )
        );
  }
}

class CoreThemeImageBackground extends StatelessWidget{
  final double headerHeight;
  final Widget footer;
  final Widget drawer;
  final Widget endDrawer;
  final Widget header;
  final Color bgColor;
  final Widget content;
  final String bgImage;
  final GlobalKey<ScaffoldState> scaffoldKey;
  CoreThemeImageBackground(this.content,{this.header, this.headerHeight=0, this.footer, this.drawer, this.endDrawer, this.bgColor = fpv3BGColor, this.scaffoldKey, this.bgImage});
  @override
  Widget build(BuildContext context) {
        return SafeArea(child:Scaffold(
              key: scaffoldKey,
              appBar:PreferredSize(preferredSize: Size.fromHeight(headerHeight) , child: header != null ? header : Container()),
              body:Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(bgImage),
                    fit: BoxFit.cover,
                  ),
                ),
                width:MediaQuery.of(context).size.width,
                height:MediaQuery.of(context).size.height,
                child:content),
              bottomNavigationBar: footer,
              drawer: drawer,
              endDrawer: endDrawer,
            )
        );
  }
}