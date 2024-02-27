import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'backend/blocLogic/budgetspendsbloc/budgetspends_bloc.dart';
import 'backend/blocLogic/exchangebloc/exchange_bloc.dart';
import 'backend/blocLogic/makebudgetbloc/makebudget_bloc.dart';
import 'backend/blocLogic/makesavingsbloc/makesavings_bloc.dart';
import 'backend/blocLogic/transacsbloc/transacs_bloc.dart';
import 'backend/blocLogic/useraccount/useraccount_bloc.dart';
import 'backend/blocLogic/userbloc/user_bloc.dart';
import 'backend/blocLogic/userbudgetsbloc/userbudgets_bloc.dart';
import 'backend/blocLogic/userlogbloc/user_log_bloc.dart';
import 'backend/blocLogic/usersavingsbloc/usersavings_bloc.dart';
import 'screens/log_sign_widgets/log_sign_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
        )
        ],
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 31, 124, 115)),
          useMaterial3: true,
        ),
        
        // localizationsDelegates: const [
        
        //   GlobalCupertinoLocalizations.delegate,
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate
        // ],
        
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









