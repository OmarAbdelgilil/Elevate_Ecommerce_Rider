// base_builder.dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/assets_manager.dart';
import '../../../../../utils/color_manager.dart';
import '../../../../../utils/strings_manager.dart';

import 'base_states.dart';
import 'base_widgets.dart';

Widget baseBuilder(BuildContext context, BaseState state, Widget child) {
  if (state is LoadingState) {
    return const Center(
      child: SizedBox(
          width: 30,
          height: 30,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: ColorManager.primary,
          )),
    );
  } else if (state is SuccessState) {
    WidgetsBinding.instance.addPostFrameCallback((_) {

      BaseWidgets.showPopUpDialog(context, [
        BaseWidgets.buildAnimatedImage(LottieAssets.success, false),
        BaseWidgets.buildMessage(context, state.message),
      ]);
    });
  } else if (state is EmptyState) {
    return BaseWidgets.buildItemsColumn([
      BaseWidgets.buildAnimatedImage(LottieAssets.noContent, false),
      BaseWidgets.buildMessage(
        context,
        state.message ?? StringsManager.emptyContent.tr(),
        ColorManager.black,
      ),
      BaseWidgets.buildButton(
        displayType: state.displayType,
        context: context,
        onTap: state.retry,
        title: StringsManager.retryAgain.tr(),
      ),
    ]);
  } else if (state is ErrorState) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BaseWidgets.showPopUpDialog(
        context,
        [

          BaseWidgets.buildAnimatedImage(LottieAssets.error, false),
          BaseWidgets.buildMessage(context, state.errorMessage),
          BaseWidgets.buildButton(
            displayType: state.displayType,
            context: context,
            // onTap: state.retry,
            title: StringsManager.retryAgain.tr(),
          ),
        ],
      );
    });
  }

  return child;
}
