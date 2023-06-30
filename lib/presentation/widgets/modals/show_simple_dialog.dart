import 'package:test_lunapp/presentation/template/template.dart';

showSimpleDialog(
  BuildContext context, {
  Widget? title,
  bool barrierDismissible = true,
  AlignmentGeometry? alignment,
  double titleTopPadding = 0,
  double titleBottomPadding = 0,
  double titleHorizontalPadding = 0,
  double contentTopPadding = 0,
  double contentBottomPadding = 0,
  double contentHorizontalPadding = 0,
  double borderRadius = 16,
  required Widget body,
}) {
  Future<bool> onWillPop() {
    if (barrierDismissible) {
      return Future.value(true);
    }
    return Future.value(false);
  }

  return showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) {
      return WillPopScope(
        onWillPop: onWillPop,
        child: PopupLayout(
          title: title,
          alignment: alignment,
          titleTopPadding: titleTopPadding,
          titleBottomPadding: titleBottomPadding,
          titleHorizontalPadding: titleHorizontalPadding,
          contentTopPadding: contentTopPadding,
          contentBottomPadding: contentBottomPadding,
          contentHorizontalPadding: contentHorizontalPadding,
          borderRadius: borderRadius,
          children: [body],
        ),
      );
    },
  );
}
