import 'package:test_lunapp/presentation/template/template.dart';

class DefaultBody extends StatelessWidget {
  final double topPadding;
  final double bottomPadding;
  final double horizontalPadding;
  final double floatingTopPadding;
  final double floatingBottomPadding;
  final double floatingHorizontalPadding;
  final Widget? floatingActionButton;
  final Widget child;

  const DefaultBody({
    super.key,
    this.topPadding = 0,
    this.bottomPadding = 0,
    this.horizontalPadding = 0,
    this.floatingTopPadding = 0,
    this.floatingBottomPadding = 0,
    this.floatingHorizontalPadding = 0,
    this.floatingActionButton,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          top: floatingTopPadding.h,
          bottom: floatingBottomPadding.h,
          left: floatingHorizontalPadding.w,
          right: floatingHorizontalPadding.w,
        ),
        child: floatingActionButton,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: topPadding.h,
            bottom: bottomPadding.h,
            left: horizontalPadding.w,
            right: horizontalPadding.w,
          ),
          child: child,
        ),
      ),
    );
  }
}
