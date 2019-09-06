import 'package:flutter/material.dart';
import 'package:flutter_wechat_readbook/content_page.dart';

/**
 * 底部导航框架
 */
class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defalutColor = Colors.grey;
  final _activeColor = Colors.greenAccent;
  int _currentIndex = 0;

  final ContentPageController _contentPageController = ContentPageController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.cyanAccent,
            Colors.greenAccent,
          ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ContentPage(
          contentPageController: _contentPageController,
          onPageChanged: (int index){
            setState(() {
              _currentIndex = index;
            });
          },

        ),
      ),

      //底部导航
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index){
          //控制内容滚动到指定的位置
            _contentPageController.jumpToPage(index);

            setState(() {
              _currentIndex = index;
            });
          },
          items: [
        _bottomItm('本周', Icons.weekend, 0),
        _bottomItm('分享', Icons.explore, 1),
        _bottomItm('免费', Icons.donut_small, 2),
        _bottomItm('长按', Icons.local_pizza, 3),
      ]),
    );
  }

  /**
   * 封装底部导航
   */
  _bottomItm(String title,IconData icon,int index){
    return BottomNavigationBarItem(
        icon: Icon(icon,color: _defalutColor,),
      activeIcon: Icon(icon,color: _activeColor,),
      title: Text(title,style: TextStyle(color: _currentIndex != index ? _defalutColor:_activeColor),)
    );
  }
}
