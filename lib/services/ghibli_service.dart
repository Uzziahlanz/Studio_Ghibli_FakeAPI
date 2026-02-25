import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/film.dart';
import '../models/person.dart';
import '../models/location.dart';
import '../models/species.dart';

class GhibliService {
  final String baseUrl = "https://ghibliapi.vercel.app";

  Future<List<Film>> fetchFilms() async {
    final response = await http.get(Uri.parse("$baseUrl/films"));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => Film.fromJson(e)).toList();
    }
    throw Exception("Failed to load films");
  }

  Future<List<Person>> fetchPeople() async {
    final response = await http.get(Uri.parse("$baseUrl/people"));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => Person.fromJson(e)).toList();
    }
    throw Exception("Failed loading people");
  }

  Future<List<GhibliLocation>> fetchLocations() async {
    final response = await http.get(Uri.parse("$baseUrl/locations"));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => GhibliLocation.fromJson(e)).toList();
    }
    throw Exception("Failed loading locations");
  }

  Future<List<Species>> fetchSpecies() async {
    final response = await http.get(Uri.parse("$baseUrl/species"));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => Species.fromJson(e)).toList();
    }
    throw Exception("Failed loading species");
  }
}
