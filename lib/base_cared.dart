import 'package:flutter/material.dart';

/**
 * 卡片布局的基类/
 */
class BaseCard extends StatefulWidget {
  @override
  BaseCardState createState() => BaseCardState();
}

class BaseCardState extends State<BaseCard> {
  Color subTitleColor = Colors.grey;
  Color bottomTitleColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    /**
     * PhysicalModel组件进行裁切
     */
    return PhysicalModel(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(15),
      clipBehavior: Clip.antiAlias, //抗锯齿
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: <Widget>[
            topContent(),
            bottomContent(),
          ],
        ),
      ),
    );
  }

  topContent() {
    return Padding(
      padding: EdgeInsets.only(left: 20, top: 26, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              topTitle(''),
              topTitle2(),
            ],
          ),
          subTitle('')
        ],
      ),
    );
  }

  /**
   * 子类自己去覆盖自定义
   */
  bottomContent() {
    return Container();
  }

  subTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: Text(
        title,
        style: TextStyle(fontSize: 11, color: subTitleColor),
      ),
    );
  }

  topTitle(String title) {
    return Text(title,style: TextStyle(fontSize: 22),);
  }

  topTitle2() {
    return Container();
  }

  bottomTitle(String title){
    return Text(title,textAlign:TextAlign.center,style: TextStyle(fontSize: 12,color:bottomTitleColor ),);
  }
}
