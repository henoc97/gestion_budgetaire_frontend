import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart'; 

import 'app_engine/app_localizations.dart';
import 'backend/blocLogic/budgetlogique/budgetspendsbloc/budgetspends_bloc.dart';
import 'backend/blocLogic/exchangebloc/exchange_bloc.dart';
import 'backend/blocLogic/budgetlogique/makebudgetbloc/makebudget_bloc.dart';
import 'backend/blocLogic/savinglogique/makesavingsbloc/makesavings_bloc.dart';
import 'backend/blocLogic/savinglogique/savingsbankbloc/usersavingsbank_bloc.dart';
import 'backend/blocLogic/transferlogique/transacsbloc/transacs_bloc.dart';
import 'backend/blocLogic/transferlogique/transfertosoldbloc/transfertosold_bloc.dart';
import 'backend/blocLogic/savinglogique/updatesavingsbloc/updatesaving_bloc.dart';
import 'backend/blocLogic/userlogique/useraccount/useraccount_bloc.dart';
import 'backend/blocLogic/userlogique/userbloc/user_bloc.dart';
import 'backend/blocLogic/budgetlogique/userbudgetsbloc/userbudgets_bloc.dart';
import 'backend/blocLogic/userlogique/userlogbloc/user_log_bloc.dart';
import 'backend/blocLogic/savinglogique/usersavingsbloc/usersavings_bloc.dart';
import 'backend/blocLogic/transferlogique/usertransfersbloc/usertransfers_bloc.dart';
import 'screens/log_sign_widgets/log_sign_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  initializeDateFormatting('fr_FR', null).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers : [
         BlocProvider<UserBloc>(
          create: (context) => UserBloc(),
        ),
        BlocProvider<UserLogBloc>(
          create: (context) => UserLogBloc(),
        ),
        BlocProvider<MakebudgetBloc>(
          create: (context) => MakebudgetBloc(),
        ),
        BlocProvider<UserbudegetsBloc>(
          create: (context) => UserbudegetsBloc(),
        ),
        BlocProvider<TransacsBloc>(
          create: (context) => TransacsBloc(),
        ),
        BlocProvider<BudgetspendsBloc>(
          create: (context) => BudgetspendsBloc(),
        ),
        BlocProvider<ExchangeBloc>(
          create: (context) => ExchangeBloc(),
        ),
        BlocProvider<MakesavingsBloc>(
          create: (context) => MakesavingsBloc(),
        ),
        BlocProvider<UsersavingsBloc>(
          create: (context) => UsersavingsBloc(),
        ),
        BlocProvider<UseraccountBloc>(
          create: (context) => UseraccountBloc(),
        ),
        BlocProvider<UpdatesavingBloc>(
          create: (context) => UpdatesavingBloc(),
        ),
        BlocProvider<UsertransfersBloc>(
          create: (context) => UsertransfersBloc(),
        ),
        BlocProvider<TransfertosoldBloc>(
          create: (context) => TransfertosoldBloc(),
        ),
        BlocProvider<UsersavingsbankBloc>(
          create: (context) => UsersavingsbankBloc(),
        )
        ],
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 31, 124, 115)),
          useMaterial3: true,
        ),
        
        localizationsDelegates:  [
          //AppLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
         ],
        
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('fr', 'FR')
        ],
        home: const LogSignPage(),
            ),
      ),
    );
     
  }
}









