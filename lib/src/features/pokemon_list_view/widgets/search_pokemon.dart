import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPokeMonListView extends StatelessWidget {
  const SearchPokeMonListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: SearchBar(
        hintText: 'Enter pokeman name',
        hintStyle: MaterialStateProperty.resolveWith<TextStyle?>((states) {
          return Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Colors.grey,
          );
        }),
        elevation: MaterialStateProperty.resolveWith<double?>((states) {
          return 2.0;
        }),
        leading: const Icon(Icons.search),
      ),
    );
  }
}
