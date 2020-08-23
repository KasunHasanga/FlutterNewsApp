import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/articleModel.dart';
import 'package:news_app/models/category_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> categories=new List<CategoryModel>();
  List<ArticleModel> articles =new List<ArticleModel>();

  bool _loading=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories=getCategories();
    getNews();

  }

  getNews() async{
    News newsClass=News();
    await newsClass.getNews();
    articles =newsClass.news;
    setState(() {
      _loading =false;
    });

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
      body: _loading? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ):

      SingleChildScrollView(
        child: Container(
           padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[

              ///Categories
              Container(
                height: 70.0,
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
              ),

              ///Blog
              Container(
                padding: EdgeInsets.only(top:16),
                child: ListView.builder(

                    itemCount: articles.length,
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                      return BlogTile(
                        imageUrl: articles[index].urlToImage,
                        title: articles[index].title,
                        desc: articles[index].description,
                      );
                    }
                ),
              ),
            ],
          ),
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
class BlogTile extends StatelessWidget {
  final String imageUrl,title,desc;
  BlogTile({@required this.imageUrl,@required  this.desc,@required  this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[

          Image.network(imageUrl),
          Text(title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500
          ),),
          Text(desc)
        ],
      ),
    );
  }
}
