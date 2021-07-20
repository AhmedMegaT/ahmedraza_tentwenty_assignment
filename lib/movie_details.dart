import 'dart:developer';

import 'package:ahmedraza_tentwenty_assignment/ProgressHUD.dart';
import 'package:ahmedraza_tentwenty_assignment/baseUrl.dart';
import 'package:ahmedraza_tentwenty_assignment/model/MovieDetailsModel.dart';
import 'package:ahmedraza_tentwenty_assignment/model/MovieModel.dart';
import 'package:ahmedraza_tentwenty_assignment/play_trailler.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MovieDetails extends StatefulWidget {
  int? movieId;

  MovieDetails({Key? key, this.movieId}) : super(key: key);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {

  MovieDetailsModel? movieDetailsModel;
  bool isLoading=false;
  String? genere= '';
  @override
  void initState() {
    // TODO: implement initState
    getMoviesDetails();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: !isLoading?SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 30.0.h,
              child: CachedNetworkImage(
                imageUrl: '$imageBaseUrl${movieDetailsModel!.backdropPath}',
                fit: BoxFit.fill,
                imageBuilder: (context, imageProvider) => Container(
                  width: MediaQuery.of(context).size.width,
                  height: 30.0.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
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
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${movieDetailsModel!.title}',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayTrailler()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      color: Colors.grey[300],
                      child: Center(
                        child: Text(
                          'Watch Trailer',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Genres',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                  Text(
                    '${genere}',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Date',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                  Text(
                    '${movieDetailsModel!.releaseDate}',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Overview',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                  Text(
                    '${movieDetailsModel!.overview}',
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ):Center(child: CircularProgressIndicator(),),
    );
  }

  Future getMoviesDetails() async {
    try {
      setState(() {
        isLoading=true;
      });
      var responce = await Dio().get(
        '$baseUrl/${widget.movieId}',
        queryParameters: {'api_key': '$apiKey'},
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
          movieDetailsModel= MovieDetailsModel.fromJson(data);

          movieDetailsModel!.genres!.forEach((element) {
            genere=genere!+element.name!+', ';
          });
        });
      }
    } catch (e) {
      log('${e.toString()}');
    }
  }
}
