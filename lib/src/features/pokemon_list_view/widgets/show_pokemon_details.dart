import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokebook_app_assessment/src/core/repository/pokemon_list/pokemon_db_list.dart';
import 'package:pokebook_app_assessment/src/core/shared/dimension/dimension.dart';
import 'package:pokebook_app_assessment/src/features/pokemon_list_view/bloc/pokemon_details_bloc.dart';
import 'package:pokebook_app_assessment/src/features/pokemon_list_view/domain/enum_stats.dart';
import 'package:pokebook_app_assessment/src/features/pokemon_list_view/widgets/details.dart';

import '../../../core/shared/app_colors/app_colors.dart';
import '../../../core/shared/image_constants/image_constant.dart';

void viewPokeMonDetails(BuildContext context, {PokemonList? pokemon}) {
  showBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        height: 1.sh,
        width: 1.sw,
        color: Colors.white12,
        child: Column(
          children: [
            Stack(
              alignment: const Alignment(0.2, 2.5),
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 283.h,
                  width: 1.sw,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromRGBO(127, 202, 209, 1),
                          Color.fromRGBO(61, 160, 169, 1),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, bottom: 120),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            height: 38.h,
                            width: 38.w,
                            decoration: BoxDecoration(
                                color: AppColors.kWhiteColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: const Icon(Icons.west_rounded),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(ImageConstants.kPokeBookLogo),
              ],
            ),
            Dimension.k70DH,
             Details(pokemon: pokemon),
          ],
        ),
      );
    },
  );
}

class Details extends StatelessWidget {
  const Details({required this.pokemon, super.key});

  final PokemonList? pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AutoSizeText(
          pokemon!.name,
          minFontSize: 46,
          maxFontSize: 60,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        Dimension.k10DH,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: pokemon!.categories.map((e) => Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              // top: 5,
              // bottom: 5,
            ),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(53),
            ),
            child: Center(
              child: Text(
                e.title,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
          ),).toList(),
        ),
        Dimension.k20DH,
        BlocSelector<PokemonDetailsBloc, PokemonDetailsState, SelectedTab>(
          selector: (state) {
            return state.activeSelectedTab;
          },
          builder: (context, selectedTab) {
            switch (selectedTab) {
              case SelectedTab.stats:
                return Text(
                  'Stats',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 19,
                      ),
                );
              case SelectedTab.similar:
                return Text(
                  'Similar',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 19,
                      ),
                );
              default:
                return Text(
                  'About',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 19,
                      ),
                );
            }
          },
        ),
        Dimension.k20DH,
        BlocSelector<PokemonDetailsBloc, PokemonDetailsState, SelectedTab>(
          selector: (state) {
            return state.activeSelectedTab;
          },
          builder: (context, state) {
            switch (state) {
              case SelectedTab.stats:
                return Container();
              case SelectedTab.similar:
                return Container();
              default:
                return AboutDetails(pokemon: pokemon);
            }
          },
        ),
        Dimension.k100DH,
        Container(
          margin: const EdgeInsets.only(left: 30, right: 30),
          padding: const EdgeInsets.only(
            top: 5,
            left: 10,
            right: 10,
            bottom: 5,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey.withOpacity(0.4),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectedTabBar(
                text: 'About',
                selectedTab: SelectedTab.about,
              ),
              SelectedTabBar(
                text: 'Stats',
                selectedTab: SelectedTab.stats,
              ),
              SelectedTabBar(
                text: 'Similar',
                selectedTab: SelectedTab.similar,
              )
            ],
          ),
        )
      ],
    );
  }
}

class SelectedTabBar extends StatelessWidget {
  const SelectedTabBar({
    required this.text,
    required this.selectedTab,
    super.key,
  });

  final String text;
  final SelectedTab selectedTab;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PokemonDetailsBloc, PokemonDetailsState, SelectedTab>(
      selector: (state) {
        return state.activeSelectedTab;
      },
      builder: (context, activeSelectedTab) {
        return GestureDetector(
          onTap: () {
            context
                .read<PokemonDetailsBloc>()
                .add(UpdateSelectedTab(selectedTab: selectedTab));
          },
          child: Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
              color: activeSelectedTab == selectedTab
                  ? AppColors.kWhiteColor
                  : null,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 12,
                    ),
              ),
            ),
          ),
        );
      },
    );
  }
}
