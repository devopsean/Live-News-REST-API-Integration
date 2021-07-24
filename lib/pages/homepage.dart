import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rest_api_integration_youtube/models/newsinfo.dart';
import 'package:rest_api_integration_youtube/services/api_manager.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<NewsModel> _newsModel;

  @override
  void initState() {
    _newsModel = API_Manager().getNews();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: Container(
        child: FutureBuilder<NewsModel>(
          future: _newsModel,
          builder: (context, snapshot) {
            // ignore: missing_return
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.articles.length,
                itemBuilder: (context, index) {
                  var article = snapshot.data.articles[index];
                  return Container(margin: EdgeInsets.all(8),
                    height: 100,
                    child: Row(
                      children: <Widget>[
                        Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.network(article.urlToImage,
                                fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(width: 16,),
                        Flexible(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                article.title,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                article.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            } else {
              print(snapshot);
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
