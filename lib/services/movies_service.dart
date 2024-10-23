import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:eru1/models/movies.dart';

class MoviesService {
  Future<List<Movie>> fetchmovies() async {
    try{
    final response = await rootBundle.loadString('assets/datos.json');
    final List<dynamic> data = jsonDecode(response);

    return data.map((userJson)=> Movie.fromJson(userJson)).toList();
    }catch(e){
      print("Algo salio mal: $e");
      throw Exception(e);
    }   
  }
}