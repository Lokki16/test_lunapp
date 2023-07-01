import 'package:test_lunapp/presentation/template/template.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double buttonHeight;
  final Color? textColor;
  final Color buttonColor;
  final VoidCallback? onTap;

  const CustomButton({
    super.key,
    required this.text,
    this.buttonHeight = 42,
    this.textColor,
    this.buttonColor = ThemeColors.gray2,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        height: buttonHeight,
        decoration: BoxDecoration(
          color: buttonColor,
          boxShadow: ThemeShadows.shadow,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: CustomText(
            text: text,
            textStyle: ThemeTextInter.s1294w700.apply(color: textColor),
          ),
        ),
      ),
    );
  }
}
