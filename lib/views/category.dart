import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:wallpaperapp/data/data.dart';
import 'package:wallpaperapp/model/wallpaper_model.dart';
import 'package:wallpaperapp/widgets/widget.dart';
class Categorie extends StatefulWidget {
  final String categoryName;
  Categorie({this.categoryName});
  @override
  _CategorieState createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {


  List<WallpaperModel> wallpapers = new List();
  getSearchWallpapers( String query) async {
    var response = await http.get("https://api.pexels.com/v1/search?query=$query&per_page=15&page=1", headers: {
      "Authorization" :apiKey
    });

    Map<String,dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element){
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);


    });
    setState(() {});
  }

  @override
  void initState() {
    getSearchWallpapers(widget.categoryName);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[

              SizedBox(height: 16,),
              wallpaperList(wallpapers: wallpapers,context: context),

            ],
          ),
        ),
      ),
    );
  }
}
