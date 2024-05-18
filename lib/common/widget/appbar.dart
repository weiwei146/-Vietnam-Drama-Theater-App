import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.leadingOnPress,
    this.actions,
    this.backOnPress,
    this.backgroundColor,
    this.isForceWhiteBackArrow,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final void Function()? leadingOnPress;
  final void Function()? backOnPress;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final bool? isForceWhiteBackArrow;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      leading: showBackArrow
          ? IconButton(
              onPressed: backOnPress ?? () => Get.back(),
              icon: Icon(
                Iconsax.arrow_left,
              ))
          : leadingIcon != null
              ? IconButton(
                  onPressed: () => leadingOnPress,
                  icon: Icon(
                    leadingIcon,
                  ))
              : null,
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(20);
}
