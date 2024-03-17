
import 'package:flutter/material.dart';
import 'package:pokebook_app_assessment/src/core/repository/pokemon_list/pokemon_db_list.dart';

import '../../../core/shared/dimension/dimension.dart';

class AboutDetails extends StatelessWidget {
  const AboutDetails({this.pokemon, super.key});


  final PokemonList? pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Column(
        children: [
          Text(
            'Height    ${pokemon?.about?.height}m',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
          Dimension.k10DH,
          Text(
            'Weight    ${pokemon?.about?.weight}kg',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
          Dimension.k10DH,
          Text(
            'Abilities  . ${pokemon?.about?.abilities}',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            '                  . chlorophyll',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
