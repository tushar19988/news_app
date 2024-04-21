import 'package:flutter/cupertino.dart';
import '../services/api_call_status.dart';

class MyWidgetsAnimator extends StatelessWidget {
  final ApiCallStatus apiCallStatus;
  final Widget Function() loadingWidget;
  final Widget Function() successWidget;
  final Widget Function() errorWidget;
  final Widget Function()? emptyWidget;
  final Widget Function()? holdingWidget;
  final Widget Function()? refreshWidget;
  final Duration? animationDuration;
  final Widget Function(Widget, Animation<double>)? transitionBuilder;

  final bool hideSuccessWidgetWhileRefreshing;

  const MyWidgetsAnimator({
    super.key,
    required this.apiCallStatus,
    required this.loadingWidget,
    required this.errorWidget,
    required this.successWidget,
    this.holdingWidget,
    this.emptyWidget,
    this.refreshWidget,
    this.animationDuration,
    this.transitionBuilder,
    this.hideSuccessWidgetWhileRefreshing = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: animationDuration ?? const Duration(milliseconds: 300),
      transitionBuilder:
          transitionBuilder ?? AnimatedSwitcher.defaultTransitionBuilder,
      child: switch (apiCallStatus) {
        (ApiCallStatus.success) => successWidget,
        (ApiCallStatus.error) => errorWidget,
        (ApiCallStatus.holding) => holdingWidget ??
            () {
              return const SizedBox();
            },
        (ApiCallStatus.loading) => loadingWidget,
        (ApiCallStatus.empty) => emptyWidget ??
            () {
              return const SizedBox();
            },
        (ApiCallStatus.refresh) => refreshWidget ??
            (hideSuccessWidgetWhileRefreshing
                ? successWidget
                : () {
                    return const SizedBox();
                  }),
        (ApiCallStatus.cache) => successWidget,
      }(),
    );
  }
}
