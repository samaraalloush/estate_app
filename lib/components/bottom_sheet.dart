import 'package:flutter/material.dart';
import 'package:estate2/components/app_button.dart';
import 'package:estate2/components/gap.dart';
import 'package:estate2/constant/colors.dart';
import 'package:estate2/utils/route_name.dart';
import 'package:estate2/utils/storage.dart';

class BottomSheetModal extends StatelessWidget {
  final String title;
  final double height;
  final bool condition;
  const BottomSheetModal(
      {Key? key, this.title = '', this.height = 50, this.condition = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appHeight = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Center(
      child: AppButton(
          title: title,
          height: height,
          textColor: AppColors.whiteColor,
          onPress: () {
            showModalBottomSheet<void>(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              builder: (BuildContext context) {
                return Container(
                  height: appHeight / 0.75,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Image(
                          width: 150,
                          image: AssetImage("lib/assets/icons/success.png"),
                          fit: BoxFit.cover,
                        ),
                        Gap(
                          isWidth: false,
                          isHeight: true,
                          height: appHeight * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Account ",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    color: AppColors.textPrimary,
                                  ),
                            ),
                            Text(
                              "successfully",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      color: AppColors.textPrimary,
                                      fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(
                          "created",
                          style:
                              Theme.of(context).textTheme.displayMedium!.copyWith(
                                    color: AppColors.textPrimary,
                                  ),
                        ),
                        Gap(
                          isWidth: false,
                          isHeight: true,
                          height: appHeight * 0.02,
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur.",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: AppColors.textPrimary,
                                  ),
                        ),
                        Gap(
                          isWidth: false,
                          isHeight: true,
                          height: appHeight * 0.02,
                        ),
                        AppButton(
                          onPress: () async {
                            final prefs = await myStroage();
                            prefs.setBool("isLogin", true);
                            Navigator.pushNamed(context, RoutesName.authScreen);
                          },
                          title: "Finsh",
                          textColor: AppColors.whiteColor,
                          radius: 15,
                          height: 65,
                          width: width / 1.20,
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
