import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:localization/localization.dart';
import 'package:sizer/sizer.dart';
import 'core.dart';

// CLASSE COM A ARQUITETURA DO APLICATIVO
// ADICIONA O TEMA, AS ROTAS E O NOME DA APLICAÇÃO
// CONTROLA O SIZE DO APLICATIVO
class AppWidget extends StatefulWidget {
  AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final AppThemeController _controller = AppThemeController();

  @override
  Widget build(BuildContext context) {
    // SIZER É UM WIDGET QUE DEIXA FAZER TODOS OS TIPOS DE CONTROLE DE LAYOUT
    print(_controller.themeMode);

    return Sizer(builder: (context, orientation, deviceType) {
      // OBSERVER VAI FICAR OBSERVANDO AS ALTERAÇÕES DO TEMA
      return Observer(builder: (_) {
        return MaterialApp(
          supportedLocales: const [
            Locale('pt', 'BR'),
            Locale('es', 'ES'),
            Locale('en', 'US'),
          ],
          //DESABILITA O BANNER "DEBUG"
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            LocalJsonLocalization.delegate,
          ],
          title: "Notes Ignite",
          // CONTROLLER USANDO MOBX PARA O TEMA
          themeMode: _controller.themeMode,
          // GERAÇÃO DE ROTAS DO APLICATIVO (COMEÇA NA '/')
          onGenerateRoute: RouterClass.generateRoute,
        );
      });
    });
  }
}