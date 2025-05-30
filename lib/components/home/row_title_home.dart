import 'package:flutter/material.dart';
import 'package:estate2/constant/colors.dart';

class RowTitleHome extends StatelessWidget {
  final VoidCallback onPress;
  final String title, subtitle;

  const RowTitleHome(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 25,
              color: AppColors.textPrimary),
        ),
        InkWell(
          onTap: onPress,
          child: Text(
            subtitle,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: const Color(0xff234F68), fontSize: 16),
          ),
        ),
      ],
    );
  }
}
