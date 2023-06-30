import 'package:test_lunapp/presentation/template/template.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final double? width;
  final double? height;

  const CustomText({
    super.key,
    required this.text,
    this.textStyle,
    this.textAlign,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Text(text, style: textStyle, textAlign: textAlign),
    );
  }
}
