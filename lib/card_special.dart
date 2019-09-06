//android开发艺术探索
import 'package:flutter/material.dart';

import 'base_cared.dart';

class CardSpecial extends BaseCard{
  @override
  BaseCardState createState() => _CardSpecialState();
}

class _CardSpecialState extends BaseCardState{

  @override
  void initState() {
    subTitleColor = Colors.red;
    bottomTitleColor = Colors.blueAccent;
    super.initState();
  }

  @override
  topContent() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 66,right: 66,top: 36,bottom: 30),
          decoration: BoxDecoration(color: Color(0xfffffcf7)),
          child: Container(
            //设置阴影
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 20,//模糊半径
                  offset: Offset(0,10),
                ),
              ],
            ),
            child: Image.network('https://gss2.bdstatic.com/-fo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike92%2C5%2C5%2C92%2C30/sign=fc9707ae1dd5ad6ebef46cb8e0a252be/21a4462309f79052b6ae7b540af3d7ca7bcbd522.jpg'),
          ),
        ),
        
        Container(
          padding: EdgeInsets.only(left: 20,top: 15,bottom: 15,right: 20),
          decoration: BoxDecoration(
            color: Colors.tealAccent,
          ),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Android开发艺术探索',style: TextStyle(fontSize: 18,color: Colors.black54),),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text('任玉刚',style: TextStyle(fontSize: 13,color: Colors.black45),),
                  ),
                ],
              ),

              Container(
                margin: EdgeInsets.only(left: 20),
                padding: EdgeInsets.only(left: 10,right: 10,bottom: 5,top: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffd9bc82),
                      Color(0xffecd9ae),
                    ]
                  ),
                ),
                child: Text('京东正品',style: TextStyle(color: Colors.white,fontSize: 13),),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bottomContent() {
    return Expanded(
      child: Column(
        //撑开容器（相当于是撑开父布局。这样子布局才能对应排列达到效果）
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network('http://47.103.18.122/yinlei/touxiang.jpg',height: 100,width: 100,),
                Text('Android进阶类书籍')
              ],
            ),
          ),

          bottomTitle('京东正品，等你来购...')
        ],
      ),
    );
  }
}