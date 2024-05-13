import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteHelper{

  var databaseName = "Student.db";
  static final database_version = 1;
  static final tablename = "users";
  static final COLUMN_ID = "column_id";
  static final COLUMN_NAME = "column_name";
  static final COLUMN_EMAIL = "column_email"; 
  static final COLUMN_CONTACT = "column_contact";
  static final COLUMN_PASSWORD = "column_password";

  Database? databaseMain = null; 
  static final SqliteHelper instance = SqliteHelper();

  Future<Database?> get database async{
    if (databaseMain != null) return databaseMain;
    databaseMain = await initDatabase();
    return databaseMain;
  }

  initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path,databaseName);
    return await openDatabase(path,version : database_version,onCreate: tableCreateMethod);
  }

  Future tableCreateMethod(Database db,int version) async {
    await db.execute(
      '''
        CREATE TABLE $tablename(
          $COLUMN_ID INTEGER PRIMARY KEY,
          $COLUMN_NAME TEXT NOT NULL,
          $COLUMN_EMAIL TEXT NOT NULL,
          $COLUMN_CONTACT TEXT NOT NULL,
          $COLUMN_PASSWORD TEXT NOT NULL
        )
      '''
    );
  }

  Future<int> insert(Map<String,dynamic> row) async{
    Database? db = await instance.database;
    return await db!.insert(tablename, row);
  }

  Future<int> update(Map<String,dynamic> row,String contact) async{
    Database? db = await instance.database;
    return await db!.update(tablename,row, where: '$COLUMN_CONTACT = ?',whereArgs: [contact]);
  }

  Future<int> delete(String contact) async{
    Database? db = await instance.database;
    return await db!.delete(tablename, where: '$COLUMN_CONTACT = ?',whereArgs: [contact]);
  }

  Future<List<Map<String,dynamic>>> getAllData() async{
    Database? db = await instance.database;
    return await db!.query(tablename);
  }

  Future<List<Map<String,dynamic>>> getSearchData(String contact) async{
    Database? db = await instance.database;
    return await db!.query(tablename,where: '$COLUMN_CONTACT = ?',whereArgs: [contact]);
  }

}