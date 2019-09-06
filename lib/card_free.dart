//免费听音乐卡片
import 'package:flutter/material.dart';

import 'base_cared.dart';

class CardFree extends BaseCard{
  @override
  BaseCardState createState() => _CardFreeState();
}

const MUSIC_LIST =[
  {'title': '空山新雨后','cover': 'https://gss3.bdstatic.com/7Po3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike180%2C5%2C5%2C180%2C60/sign=2ffb4e18a1c3793169658e7b8aaddc20/e824b899a9014c08390da4bb047b02087bf4f4fe.jpg','price': '5.0'},
  {'title': 'always online','cover': 'https://gss0.bdstatic.com/94o3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike180%2C5%2C5%2C180%2C60/sign=8b0ed73cc48065386fe7ac41f6b4ca21/91ef76c6a7efce1b850b9ab8a151f3deb48f659b.jpg','price': '3.0'},
  {'title': '卡布奇诺','cover': 'https://gss3.bdstatic.com/7Po3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike272%2C5%2C5%2C272%2C90/sign=129d8bd84b10b912abccfeaca2949766/d50735fae6cd7b8941ddf6e0032442a7d9330e24.jpg','price': '2.0'},
  {'title': '刚刚好','cover': 'https://gss0.bdstatic.com/-4o3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike180%2C5%2C5%2C180%2C60/sign=06c55a6debfe9925df01610255c135ba/c8177f3e6709c93d4c234c5f943df8dcd0005440.jpg','price': '7.0'},
  {'title': '雅俗共赏','cover': 'https://gss0.bdstatic.com/94o3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike92%2C5%2C5%2C92%2C30/sign=3e0744acf6246b606f03ba268a917129/18d8bc3eb13533fa028589d1a8d3fd1f41345b19.jpg','price': '6.0'},
  {'title': '未成年','cover': 'https://gss1.bdstatic.com/9vo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike180%2C5%2C5%2C180%2C60/sign=820b9b3301b30f242197e451a9fcba26/b21bb051f8198618cff8dfd644ed2e738bd4e621.jpg','price': '5.0'},
];

class _CardFreeState extends BaseCardState{
  @override
  topTitle(String title) {
    return super.topTitle('音乐阁');
  }

  @override
  void initState() {
    subTitleColor = Colors.deepOrange;
    super.initState();
  }


  @override
  subTitle(String title) {
    return super.subTitle('酷狗是中国领先的数字音乐交互服务提供商，互联网技术创新的领军企业，致力于为互联网用户和数字音乐产业发展提供最佳的解决方案。');
  }

  @override
  bottomContent() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[
            Expanded(child: _musicLists(),),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: _bottomButton(),
            ),
          ],
        ),
      ),
    );
  }

  /**
   * 网格式布局
   */
  _musicLists() {
      return GridView.count(
          crossAxisCount: 3,
          //垂直间距(相对于父容器是column还是row而言垂直水平)
          mainAxisSpacing: 10,
          //水平间距
          crossAxisSpacing: 15,
          childAspectRatio: 0.45,
          padding: EdgeInsets.only(left: 20,right: 20),
          children: MUSIC_LIST.map((item) {
            return _item(item);
          }).toList(),
      );
  }

  _bottomButton() {
    /**
     * FractionallySizedBox让宽度撑满 widthFactor: 1,
     */
    return FractionallySizedBox(
      widthFactor: 1,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: RaisedButton(
          onPressed: (){

          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.only(top: 5,bottom: 5),
          color: Colors.blue,
          child: Text('会员充值',style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }

  /**
   * 解析本地json数据
   * 这里必须要返回widget类型。否则会报错： list<dynamic> is not a subtype  of type list<widgeta>
   */
  Widget _item(Map<String, String> item) {
    return Container(
      child: Column(
        children: <Widget>[
          //绝对布局
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Image.network(item['cover'],fit: BoxFit.cover,),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black38,
                ),
                child: Icon(Icons.play_arrow,color: Colors.white,),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(color: Colors.black54),
                  child: Text('价格：${item['price']}',style: TextStyle(color: Colors.white,fontSize: 10),),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(item['title'],maxLines: 2,overflow: TextOverflow.ellipsis,),
          ),
        ],
      ),
    );
  }
}
