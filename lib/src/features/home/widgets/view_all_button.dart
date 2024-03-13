import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokebook_app_assessment/src/constants/app_constants/app_constants.dart';



class ViewAllButton extends StatelessWidget {
  const ViewAllButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // context.read<HomeBloc>().add(UpdateHomeData());
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
