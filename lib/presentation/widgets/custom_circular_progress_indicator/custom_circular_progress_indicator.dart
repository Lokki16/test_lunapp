import 'package:test_lunapp/presentation/template/template.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultBody(
      child: Center(
        child: CircularProgressIndicator(color: ThemeColors.gray3),
      ),
    );
  }
}
