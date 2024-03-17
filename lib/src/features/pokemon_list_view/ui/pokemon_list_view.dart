import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokebook_app_assessment/src/core/shared/dimension/dimension.dart';
import 'package:pokebook_app_assessment/src/core/widgets/main_scaffold.dart';
import 'package:pokebook_app_assessment/src/features/pokemon_list_view/widgets/list_of_pokemon.dart';

import '../widgets/app_bar.dart';
import '../widgets/search_pokemon.dart';

class PokeMonListViewScreen extends StatefulWidget {
  const PokeMonListViewScreen({super.key});

  @override
  State<PokeMonListViewScreen> createState() => _PokeMonListViewScreenState();
}

class _PokeMonListViewScreenState extends State<PokeMonListViewScreen> {
  final _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      appBar: const PokeMonAppBar(),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Dimension.k30DH,
              const SearchPokeMonListView(),
              // Dimension.k30DH,
              ListOfPokeMon(
                controller: _controller,
              ),
              Dimension.k70DH,
            ],
          ),
        ),
      ),
    );
  }
}
