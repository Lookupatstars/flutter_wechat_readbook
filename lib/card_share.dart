//分享卡片

import 'package:flutter/material.dart';
import 'package:flutter_wechat_readbook/base_cared.dart';

class CardShare extends BaseCard{

  @override
  BaseCardState createState() => _CardShareState();
}

class _CardShareState extends BaseCardState{
  @override
  topTitle(String title) {
    return super.topTitle('分享社区');
  }

  @override
  subTitle(String title) {
    return super.subTitle('分享是一种乐趣，快和您的朋友关注作者"孤寂之狼"并分享小说吧~');
  }

  @override
  void initState() {
    subTitleColor = Colors.deepPurple;
    bottomTitleColor = Colors.blueAccent;
    super.initState();
  }

  @override
  bottomContent() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(color: Color(0xfff6f7f9)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 20,bottom: 20),
              child: Image.network('http://qzonestyle.gtimg.cn/qzone/qzactStatics/imgs/20190823182955_78960e.jpg',fit: BoxFit.cover,),
            ),
          ),

          Container(
            alignment: AlignmentDirectional.center,//重写父布局的位置约束，
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: bottomTitle('下载QQ , 分享至朋友圈'),
            ),
          ),
        ],),
      ),
    );
  }

  @override
  topTitle2() {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: Text(' / 第01期',style: TextStyle(fontSize: 10),),
    );
  }


}