import 'package:test_lunapp/presentation/template/template.dart';

class CustomImage extends StatelessWidget {
  final String image;
  final double? width;
  final double? height;

  const CustomImage({
    super.key,
    required this.image,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?.w,
      height: height?.h,
      child: CircleAvatar(
        backgroundImage: AssetImage(image),
      ),
    );
  }
}
