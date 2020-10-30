import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon.dart';
import 'dart:convert';
import '../models/pokemon_list.dart';

class WebService {
  Future<List<PokemonList>> fetchPokemonList() async {
    final url = "https://pokeapi.co/api/v2/pokemon";
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final Iterable list = data['results'];

      return list.map((item) => PokemonList.fromJson(item)).toList();
    } else {
      throw Exception("Error");
    }
  }

  fetchPokemon(String name) async {
    final url = "https://pokeapi.co/api/v2/pokemon/$name";
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return Pokemon.fromJson(data);
    } else {
      throw Exception("Error");
    }
  }
}