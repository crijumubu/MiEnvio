
import 'package:frontend/model/product.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper{
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future <Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "products.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      
    );
  }

  Future _onCreate(Database db, int version) async{
    await db.execute('''
      CREATE TABLE products(
        id INTEFER PRIMARY KEY,
        img TEXT,
        nombre TEXT,
        vendedor TEXT,
        calificacion TEXT,
        favorito INT,

      
      )

    ''');
  }

  Future <List<Product>> getProductsFavorites() async{
    Database db = await instance.database;
    var favorites = await db.query("products", orderBy: "nombre");
    List<Product> favoriteList = favorites.isNotEmpty ? favorites.map((e) => Product.fromMap(e)).toList() : [];
    
    return favoriteList;
  }

}