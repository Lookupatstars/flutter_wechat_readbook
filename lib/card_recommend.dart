import 'package:flutter/cupertino.dart';
import 'package:flutter_wechat_readbook/base_cared.dart';

/**
 * 重写基类
 *
 * 本周推荐页面
 */
class CardRecommend extends BaseCard{
  @override
  BaseCardState createState()  => _CardRecommendState();
}

class _CardRecommendState extends BaseCardState{
  @override
  void initState() {
    subTitleColor = Color(0xffb99444);
    super.initState();
  }

  @override
  topTitle(String title) {
    return super.topTitle('本周推荐');
  }

  @override
  subTitle(String title) {
    return super.subTitle('“小姨，我要……”“乖乖，我来了……当你有一个漂亮 ...“');
  }

  @override
  bottomContent() {
    return Expanded(//高度撑满
        child: Container(
          //适配android添加约束:盒子约束去尽可能撑开父布局
          constraints: BoxConstraints.expand(),
          margin: EdgeInsets.only(top: 5),
          child: Image.network('http://www.owolove.com/uploads/allimg/c170402/14911330GX240-112Q.jpg',fit: BoxFit.cover,),
        ), 
    );
  }

}