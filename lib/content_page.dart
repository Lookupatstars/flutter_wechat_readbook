import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'card_free.dart';
import 'card_recommend.dart';
import 'card_share.dart';
import 'card_special.dart';
import 'custom_appbar.dart';

/**
 * 页面滑动切换[主页面的开发]
 */
class ContentPage extends StatefulWidget {
  final ValueChanged<int> onPageChanged;//回调
  final ContentPageController contentPageController;

  //dart的构造方法
  //super(key: key) 是类的初始化列表
  const ContentPage({Key key, this.onPageChanged, this.contentPageController}) : super(key: key);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  PageController _pageController = PageController(
//    视窗比例
    viewportFraction: 0.8
  );


  static List<Color> _colors = [
    Colors.deepPurple,
    Colors.red,
    Colors.orange,
    Colors.yellow,
  ];

  @override
  void initState() {
    if(widget.contentPageController !=null){
      widget.contentPageController._controller = _pageController;//把当前pageview的controller赋值给自定义的ContentPageController类
    }
    _statusBar();//沉浸式状态栏
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
      //上面是appbar
        CustomAppBar(),


      //下面是滑动组件
        Expanded(
          child: PageView(
            //让当前视图窗口可以显示下不知一个page，这就需要改变比例viewportFraction
            controller: _pageController,
            onPageChanged: widget.onPageChanged,//这里的widget就代表state<ContentPage>中的ContentPage
            children: <Widget>[
              _wrapItem(CardRecommend()),
              _wrapItem(CardShare()),
              _wrapItem(CardFree()),
              _wrapItem(CardSpecial()),
            ],
          ),
        ),
      ],
    );
  }

  /**
   * 封装PageView每个item要显示的内容
   * Dart可以有返回值也可以不写返回值。
   * _wrapItem() 等价于 Widget _wrapItem()
   */
  _wrapItem(Widget widget){
    return Padding(
      padding: EdgeInsets.all(10),
      child: widget,
    );
  }

  /**
   * 设置状态栏样式，实现沉浸式状态栏
   */
  _statusBar(){
    SystemUiOverlayStyle uiOverlayStyle = SystemUiOverlayStyle(
      //黑色沉浸式状态栏。基于SystemUiOverlayStyle.dark修改了statusBarColor
      systemNavigationBarColor: Color(0xFF000000),
      systemNavigationBarDividerColor: null,
      statusBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(uiOverlayStyle);
  }
}

/**
 * 内容区域的控制器
 */
class ContentPageController{
  PageController _controller;
  void jumpToPage(int page){
    //安全的调用： dart 和kotlin一样
    _controller?.jumpToPage(page);
  }
}