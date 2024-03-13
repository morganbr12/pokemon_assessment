import 'package:flutter/material.dart';
import 'package:pokebook_app_assessment/src/core/routes/push_navigator.dart';
import 'package:pokebook_app_assessment/src/core/shared/app_colors/app_colors.dart';

import '../../../core/bloc_providers/pokemon_detail_provider.dart';

class SearchPokeMon extends StatefulWidget {
  const SearchPokeMon({super.key});

  @override
  State<SearchPokeMon> createState() => _SearchPokeMonState();
}

class _SearchPokeMonState extends State<SearchPokeMon> {
  @override
  Widget build(BuildContext context) {
    return Form(
        child: TextFormField(
      decoration: InputDecoration(
        hintText: 'Enter pokemon name',
        hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: Colors.grey,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 18,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 15),
          child: InkWell(
            onTap: () {
              pushNavigator(context, child: pokemonDetailProvider());
            },
            child: const CircleAvatar(
              backgroundColor: AppColors.kPrimaryColor,
              child: Icon(Icons.search, color: AppColors.kWhiteColor),
            ),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 5,
            color: AppColors.kPrimaryColor,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 5,
            color: AppColors.kPrimaryColor,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    ));
  }
}
