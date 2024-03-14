import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokebook_app_assessment/src/constants/app_constants/app_constants.dart';
import 'package:pokebook_app_assessment/src/features/pokemon_list_view/bloc/pokemon_details_bloc.dart';



class ViewAllButton extends StatelessWidget {
  const ViewAllButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            context.read<PokemonDetailsBloc>().add(const UpdatePokemonListData());
          },
          child: Column(
            children: [
              Text(
                AppConstants.kViewAll,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Divider(
                height: 1,
                endIndent: 0.37.sw,
                indent: 0.37.sw,
                thickness: 2,
                color: Colors.black,
              )
            ],
          ),
        ),
      ],
    );
  }
}
