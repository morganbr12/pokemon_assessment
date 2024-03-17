import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokebook_app_assessment/src/core/shared/app_colors/app_colors.dart';
import 'package:pokebook_app_assessment/src/core/shared/image_constants/image_constant.dart';

import '../../../core/widgets/pokebook_logo.dart';
import '../bloc/pokemon_details_bloc.dart';
import '../domain/enum_stats.dart';

class PokeMonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PokeMonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100.h,
      backgroundColor: AppColors.kWhiteColor,
      automaticallyImplyLeading: false,
      leadingWidth: 114.11.w,
      elevation: 3,
      leading: Padding(
        padding: const EdgeInsets.only(left: 15.0, top: 15),
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: SizedBox(
            // width: .11.w,
            height: 74.06.h,
            child: SvgPicture.asset(
              ImageConstants.kPokeBookLogo,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      title: const SizedBox(
        height: 25,
        width: 900,
        child: PokeBookLogo(
          fontSize: 18,
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              barrierColor: Colors.grey.withOpacity(0.7),
              builder: (context) => AlertDialog(
                titlePadding: const EdgeInsets.all(0),
                title: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: Container(
                    width: 1.sw,
                    height: 0.08.sh,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: AppColors.kWhiteColor,
                    ),
                    child: Text(
                      "Chose Theme",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
                actionsAlignment: MainAxisAlignment.center,
                actionsPadding: const EdgeInsets.only(top: 40, bottom: 40),
                actions: const [
                  ChooseTheme(
                    color: Color.fromRGBO(232, 83, 130, 1),
                    selectedTheme: SelectedTheme.primary,
                  ),
                  ChooseTheme(
                    color: Colors.lightBlueAccent,
                    selectedTheme: SelectedTheme.secondary,
                  ),
                  ChooseTheme(
                    color: Colors.amberAccent,
                    selectedTheme: SelectedTheme.tertiary,
                  ),
                ],
              ),
            );
          },
          borderRadius: BorderRadius.circular(100),
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey, width: 1),
              color: Colors.white,
            ),
            child: CircleAvatar(
              backgroundColor: AppColors().kPrimaryColor,
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(85.06);
}

class ChooseTheme extends StatelessWidget {
  const ChooseTheme(
      {required this.color, required this.selectedTheme, super.key});

  final Color? color;
  final SelectedTheme selectedTheme;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<PokemonDetailsBloc, PokemonDetailsState, SelectedTheme>(
      selector: (state) {
        return state.activeSelectedTheme;
      },
      builder: (context, themeState) {
        return InkWell(
          onTap: () {
            context.read<PokemonDetailsBloc>().add(
                  UpdatedSelectedTheme(
                    selectedTheme: selectedTheme,
                  ),
                );
          },
          borderRadius: BorderRadius.circular(100),
          child: Container(
            padding:
                themeState == selectedTheme ? const EdgeInsets.all(5) : null,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: themeState == selectedTheme
                  ? Border.all(color: Colors.grey, width: 1)
                  : null,
              color: Colors.white,
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: color,
            ),
          ),
        );
      },
    );
  }
}
