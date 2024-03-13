import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokebook_app_assessment/src/core/routes/push_navigator.dart';
import 'package:pokebook_app_assessment/src/core/shared/app_colors/app_colors.dart';
import 'package:pokebook_app_assessment/src/features/pokemon_list_view/widgets/show_pokemon_details.dart';

import '../../../core/shared/image_constants/image_constant.dart';

class ListOfPokeMon extends StatefulWidget {
  const ListOfPokeMon({required this.controller, super.key});

  final ScrollController controller;


  @override
  State<ListOfPokeMon> createState() => _ListOfPokeMonState();
}

class _ListOfPokeMonState extends State<ListOfPokeMon> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      controller: widget.controller,
      shrinkWrap: true,
      itemBuilder: (context, i) => Column(
        children: [
          const SizedBox(height: 70),
          Stack(
            clipBehavior: Clip.none,
            alignment: const Alignment(0.2, -2),
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
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        const SizedBox(height: 20),
                        AutoSizeText(
                          'charizard',
                          minFontSize: 25,
                          maxFontSize: 32,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.only(
                                left: 15,
                                right: 15,
                                top: 10,
                                bottom: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey, // Change to your color
                                borderRadius: BorderRadius.circular(53),
                              ),
                              child: Center(
                                child: Text(
                                  'Fire',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontSize: 18,
                                      ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SvgPicture.asset(ImageConstants.kPokeBookLogo),
              Positioned.fill(
                child: Tooltip(
                  message: 'View',
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: InkWell(
                      onTap: () {
                        viewPokeMonDetails(context);
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
      ),
    );
  }
}
