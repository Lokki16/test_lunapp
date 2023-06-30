import 'package:test_lunapp/presentation/template/template.dart';

errorDialog(BuildContext context) {
  showSimpleDialog(
    context,
    titleTopPadding: 16,
    titleBottomPadding: 10,
    contentTopPadding: 10,
    contentBottomPadding: 16,
    contentHorizontalPadding: 10,
    title: const Icon(
      Icons.error,
      color: ThemeColors.red,
      size: 20,
    ),
    body: Center(
      child: CustomText(
        text: 'Ошибка!',
        textStyle: ThemeTextInter.s1294w400.apply(color: ThemeColors.red),
      ),
    ),
  );
}
