import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokebook_app_assessment/src/features/pokemon_list_view/widgets/show_pokemon_details.dart';
import 'package:provider/provider.dart';

import '../../../core/shared/image_constants/image_constant.dart';
import '../domain/json_pokmon_list.dart';

class ListOfPokeMon extends StatefulWidget {
  const ListOfPokeMon({
    required this.controller,
    super.key,
  });

  final ScrollController controller;

  @override
  State<ListOfPokeMon> createState() => _ListOfPokeMonState();
}

class _ListOfPokeMonState extends State<ListOfPokeMon> {
  int currentPage = 1;
  int itemPerPage = 2;

  @override
  Widget build(BuildContext context) {
    final pokemonList =
        Provider.of<PokemonListJson>(context, listen: false).getPokemonList;
    return pokemonList.isEmpty
        ? Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: SizedBox(
              child: Text(
                'There is no Poke Book available',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.black,
                    ),
              ),
            ),
          )
        : ListView.builder(
            itemCount: currentPage * itemPerPage < pokemonList.length
                ? currentPage * itemPerPage + 1
                : pokemonList.length,
            controller: widget.controller,
            shrinkWrap: true,
            itemBuilder: (context, i) {
              if (i == currentPage * itemPerPage) {
                return ElevatedButton(
                  onPressed: () {
                    currentPage++;
                    setState(() {});
                  },
                  child: Text(((currentPage + 1)).toString()));
              } else {
                final pokemon = pokemonList[i];
                return Column(
                  children: [
                    const SizedBox(height: 70),
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: const Alignment(0.2, -3),
                      children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Card(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 170,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  AutoSizeText(
                                    pokemon.name,
                                    minFontSize: 25,
                                    maxFontSize: 32,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: pokemon.categories.isEmpty
                                        ? []
                                        : pokemon.categories
                                            .map(
                                              (e) => Container(
                                                margin: const EdgeInsets.only(
                                                    right: 10),
                                                padding: const EdgeInsets.only(
                                                  left: 15,
                                                  right: 15,
                                                  top: 10,
                                                  bottom: 10,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey
                                                      .withOpacity(0.2),
                                                  // Change to your color
                                                  borderRadius:
                                                      BorderRadius.circular(53),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    e.title,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                          fontSize: 18,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: 251,
                            width: 257,
                            child: Image.asset(pokemon.imagePath)),
                        Positioned.fill(
                          child: Tooltip(
                            message: 'View',
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: InkWell(
                                onTap: () {
                                  viewPokeMonDetails(context, pokemon: pokemon);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
            },
          );
  }
}
