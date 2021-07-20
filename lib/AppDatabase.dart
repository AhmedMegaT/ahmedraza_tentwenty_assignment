import 'dart:async';
import 'package:ahmedraza_tentwenty_assignment/DAO/MovieDao.dart';
import 'package:ahmedraza_tentwenty_assignment/model/MovieModel.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;



part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [MovieModel])
abstract class AppDatabase extends FloorDatabase {
  MovieDao get movieDao;
}