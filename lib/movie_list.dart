import 'dart:developer';

import 'package:ahmedraza_tentwenty_assignment/baseUrl.dart';
import 'package:ahmedraza_tentwenty_assignment/book_ticket_screen.dart';
import 'package:ahmedraza_tentwenty_assignment/model/MovieModel.dart';
import 'package:ahmedraza_tentwenty_assignment/movie_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MoviesList extends StatefulWidget {
   MoviesList({Key? key}) : super(key: key);

  @override
  _MoviesListState createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {

  List<MovieModel> movieList=[];
  int pageNumber=1;
  int totalPageNumber=1;
  ScrollController? controller;
  bool isNextLoading=false;
  bool isLoading=false;
  @override
  void initState() {
    // TODO: implement initState
    getMovies();
    controller = new ScrollController()..addListener(_scrollListener);
    super.initState();
  }
  void _scrollListener() {
    //  print(controller.position.extentAfter);
    if (controller!.position.extentAfter < 500) {
      if(pageNumber<=totalPageNumber)
      !isNextLoading?getMoviesNext():null;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ten twenty app'),
        backgroundColor: Colors.blueAccent,
      ),
      body:!isLoading? Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              controller: controller,
                itemCount: movieList.length,
                itemBuilder: (context,index){
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetails(
                    movieId: movieList[index].id,
                  )));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 20.0.w,
                            height: 18.0.h,
                            child: CachedNetworkImage(
                              imageUrl: '$imageBaseUrl${movieList[index].posterPath}',
                              fit: BoxFit.cover,
                              imageBuilder: (context, imageProvider) => Container(
                                width: 20.0.w,
                                height: 18.0.h,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) => new SizedBox(
                                width: 6.0.w,
                                height: 6.0.w,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.blue,
                                    strokeWidth: 0.7.w,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${movieList[index].title}'),
                                SizedBox(height: 5,),
                                Text('${movieList[index].releaseDate}', style: TextStyle(
                                  color: Colors.grey,fontSize: 13
                                ),),
                                SizedBox(height: 5,),
                                Text(movieList[index].adult! ?'Adult':'Non adult',
                                    style: TextStyle(
                                        color: Colors.grey,fontSize: 13
                                    )),
                              ],
                            ),
                          ),SizedBox(width: 30,),
                          Container(
                            width: 80,
                            height: 40,
                            child: RaisedButton(
                              color: Colors.white,
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>BookTicket()));
                              },
                              child: Text('Book',style: TextStyle(
                                color: Colors.blue
                              ),),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width-100,
                        color: Colors.grey[200],
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
          isNextLoading?Center(child: CircularProgressIndicator(),):Container()
        ],
      ):Center(child: CircularProgressIndicator(),),
    );
  }

   Future getMovies() async {
    try {
      setState(() {
        isLoading=true;
      });
      var responce = await Dio().get(
        '$baseUrl/upcoming',
        queryParameters: {'api_key': '$apiKey','page':'$pageNumber'},
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
          followRedirects: false,
          validateStatus: (status) {
            return status! <= 500;
          },
        ),
      );
      setState(() {
        isLoading=false;
      });
      var data = responce.data;
      log('data is = $data');
      print('status code is = ${responce.statusCode}');
      if (responce.statusCode == 200) {
       setState(() {
         totalPageNumber=data['total_pages'];
         pageNumber++;
        List<MovieModel> movieListTemp = List<MovieModel>.from(
             data['results'].map((model) => MovieModel.fromJson(model)));
        movieList.addAll(movieListTemp);
       });
      }
    } catch (e) {
      log('${e.toString()}');
    }
  }
  Future getMoviesNext() async {
    try {
      setState(() {
        isNextLoading=true;
      });
      var responce = await Dio().get(
        '$baseUrl/upcoming',
        queryParameters: {'api_key': '$apiKey','page':'$pageNumber'},
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
          followRedirects: false,
          validateStatus: (status) {
            return status! <= 500;
          },
        ),
      );
      setState(() {
        isNextLoading=false;
      });
      var data = responce.data;
      log('data is = $data');
      print('status code is = ${responce.statusCode}');
      if (responce.statusCode == 200) {
        setState(() {
          totalPageNumber=data['total_pages'];
          pageNumber++;
          List<MovieModel> movieListTemp = List<MovieModel>.from(
              data['results'].map((model) => MovieModel.fromJson(model)));
          movieList.addAll(movieListTemp);
        });
      }
    } catch (e) {
      log('${e.toString()}');
    }
  }
}
