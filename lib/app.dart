import 'package:test_lunapp/presentation/template/template.dart';

class LunApp extends StatelessWidget {
  const LunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: Constants.showModeBanner,
          title: Constants.appTitle,
          theme: AppTheme.lightTheme,
          navigatorKey: GlobalVariable.navState,
          routes: AppRoutes.getRoutes,
          initialRoute: AppRoutes.routeToMainMenuPage,
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          ),
        ),
      ),
    );
  }
}
