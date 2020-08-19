import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/models/category_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> categories=new List<CategoryModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories=getCategories();
  }

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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: <Widget>[
            Container(
              height: 120.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: categories.length,
                  itemBuilder: (context, index){
                    return CategoryTile(
                      imageUrl: categories[index].imageUrl,
                      categoryName: categories[index].categoryName,
                    );
                  }

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
    return GestureDetector(
      onTap: (){

      },
      child: Container(

        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(imageUrl,width: 120,height: 60,fit: BoxFit.fitWidth,)),
            Container(
            width: 120,
              alignment:Alignment.center,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                color: Colors.black38
              ),
              child: Text(categoryName,

              style: TextStyle(color: Colors.white,
              fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}
