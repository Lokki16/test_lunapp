import 'package:test_lunapp/presentation/template/template.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? textEditingController;

  const CustomTextFormField({super.key, this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      keyboardType: TextInputType.text,
      controller: textEditingController,
      style: ThemeTextInter.s1056w400.apply(color: ThemeColors.black),
      decoration: InputDecoration(
        counter: const Offstage(),
        isDense: true,
        contentPadding: EdgeInsets.only(
          top: 19.h,
          bottom: 19.h,
          left: 28.w,
          right: 28.w,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.w,
            color: ThemeColors.black,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.w,
            color: ThemeColors.black,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
