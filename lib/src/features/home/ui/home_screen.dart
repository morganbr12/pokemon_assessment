import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokebook_app_assessment/src/constants/app_constants/app_constants.dart';
import 'package:pokebook_app_assessment/src/core/shared/dimension/dimension.dart';
import 'package:pokebook_app_assessment/src/core/shared/image_constants/image_constant.dart';
import 'package:pokebook_app_assessment/src/core/widgets/main_scaffold.dart';
import 'package:pokebook_app_assessment/src/features/home/widgets/search_pokemon.dart';

import '../widgets/view_all_button.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 0.8.sw,
                height: 204.6.h,
                child: SvgPicture.asset(ImageConstants.kPokeBookLogo),
              ),
              Dimension.k30DH,
              SvgPicture.asset(ImageConstants.kPokeBook),
              Dimension.k20DH,
              Text(
                AppConstants.kHomeDescription,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Dimension.k50DH,
              const SearchPokeMon(),
              Dimension.k10DH,
              const ViewAllButton()
            ],
          ),
        ),
      ),
    );
  }
}
