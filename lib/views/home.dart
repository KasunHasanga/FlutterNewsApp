import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Flutter'
            ),
            Text(
              "News",
              style: TextStyle(
                color: Colors.blue
              ),
            )
          ],
        ),
      ),
    );
  }
}
class CategoryTile extends StatelessWidget {
  final imageUrl ,categoryName;
  CategoryTile({this.imageUrl,this.categoryName});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.network(imageUrl,width: 120,height: 60,)
        ],
      ),
    );
  }
}
