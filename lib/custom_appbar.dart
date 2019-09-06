import 'package:flutter/material.dart';

/**
 * 自定义Appbar
 */
class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /**
     * 全面屏/刘海屏的适配
     */
    double paddingTop = MediaQuery.of(context).padding.top;//顶部安全区域.也可以使用SafeArea组件

    return Container(
      margin: EdgeInsets.fromLTRB(20, paddingTop+10, 20, 5),
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        color: Colors.white60
      ),
      child: Row(
        children: <Widget>[
          Icon(Icons.search,color: Colors.blue,),
          SizedBox(//相当于占空行
            width: 10,
            height: 20,
          ),
          Expanded(
            //撑开宽度
            child: Text('好色小姨',style: TextStyle(fontSize: 15,color: Colors.amber),),
          ),
          Container(
            width: 1,
            height: 20,
            margin: EdgeInsets.only(right: 13),
            decoration: BoxDecoration(
              color: Colors.black
            ),
          ),
          Text(
            '小说',style: TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
