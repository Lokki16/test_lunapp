import 'package:test_lunapp/presentation/template/template.dart';

class PopupLayout extends StatelessWidget {
  final Widget? title;
  final AlignmentGeometry? alignment;
  final double titleTopPadding;
  final double titleBottomPadding;
  final double titleHorizontalPadding;
  final double contentTopPadding;
  final double contentBottomPadding;
  final double contentHorizontalPadding;
  final double borderRadius;
  final List<Widget> children;

  const PopupLayout({
    super.key,
    this.title,
    this.alignment,
    required this.titleTopPadding,
    required this.titleBottomPadding,
    required this.titleHorizontalPadding,
    required this.contentTopPadding,
    required this.contentBottomPadding,
    required this.contentHorizontalPadding,
    this.borderRadius = 0,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: title,
      alignment: alignment,
      insetPadding: EdgeInsets.symmetric(horizontal: 25.w),
      titlePadding: EdgeInsets.only(
        top: titleTopPadding.h,
        bottom: titleBottomPadding.h,
        left: titleHorizontalPadding.w,
        right: titleHorizontalPadding.w,
      ),
      contentPadding: EdgeInsets.only(
        top: contentTopPadding.h,
        bottom: contentBottomPadding.h,
        left: contentHorizontalPadding.w,
        right: contentHorizontalPadding.w,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius.r),
      ),
      elevation: 0,
      children: children,
    );
  }
}
