import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokebook_app_assessment/src/core/shared/dimension/dimension.dart';
import 'package:pokebook_app_assessment/src/core/shared/image_constants/image_constant.dart';
import 'package:pokebook_app_assessment/src/core/widgets/main_scaffold.dart';
import 'package:pokebook_app_assessment/src/features/home/bloc/home_bloc.dart';
import 'package:pokebook_app_assessment/src/features/home/widgets/search_pokemon.dart';

import '../widgets/view_all_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title, super.key});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(const UpdateHomeData());
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SizedBox(
                  width: 0.9.sw,
                  height: 204.6.h,
                  child: SvgPicture.asset(ImageConstants.kPokeBookLogo),
                ),
              ),
              Dimension.k30DH,
              SvgPicture.asset(ImageConstants.kPokeBook),
              Dimension.k20DH,
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return Text(
                    state.homeData?.description ?? 'Description',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  );
                },
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
