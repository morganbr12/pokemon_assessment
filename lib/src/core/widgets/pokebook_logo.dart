import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokebook_app_assessment/src/features/pokemon_list_view/bloc/pokemon_details_bloc.dart';
import 'package:pokebook_app_assessment/src/features/pokemon_list_view/domain/enum_stats.dart';

import '../shared/app_colors/app_colors.dart';

class PokeBookLogo extends StatelessWidget {
  const PokeBookLogo({this.fontSize, this.mainAxisAlignment, super.key});

  final double? fontSize;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      children: [
        Text(
          'Poké',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: fontSize ?? 54,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
        ),
        BlocSelector<PokemonDetailsBloc, PokemonDetailsState, SelectedTheme>(
          selector: (state) {
            return state.activeSelectedTheme;
          },
          builder: (context, selectedTheme) {
            return Text(
              ' book',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: colorTheme(selectedTheme),
                    fontSize: fontSize ?? 54,
                    fontWeight: FontWeight.bold,
                  ),
            );
          },
        )
      ],
    );
  }
}
