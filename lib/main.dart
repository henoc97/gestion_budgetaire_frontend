import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart'; 
import 'package:web_socket_channel/io.dart';

import 'app_engine/app_localizations.dart';
import 'backend/blocLogic/budgetlogique/budgetspendsbloc/budgetspends_bloc.dart';
import 'backend/blocLogic/budgetlogique/deletebudgetbloc/deletebudget_bloc.dart';
import 'backend/blocLogic/exchangebloc/exchange_bloc.dart';
import 'backend/blocLogic/budgetlogique/makebudgetbloc/makebudget_bloc.dart';
import 'backend/blocLogic/savinglogique/deletesavingbloc/deletesaving_bloc.dart';
import 'backend/blocLogic/savinglogique/makesavingsbloc/makesavings_bloc.dart';
import 'backend/blocLogic/savinglogique/savingsbankbloc/usersavingsbank_bloc.dart';
import 'backend/blocLogic/transferlogique/deletetransferbloc/deletetransfer_bloc.dart';
import 'backend/blocLogic/transferlogique/transacsbloc/transacs_bloc.dart';
import 'backend/blocLogic/transferlogique/transfertosoldbloc/transfertosold_bloc.dart';
import 'backend/blocLogic/savinglogique/updatesavingsbloc/updatesaving_bloc.dart';
import 'backend/blocLogic/userlogique/useraccount/useraccount_bloc.dart';
import 'backend/blocLogic/userlogique/userbloc/user_bloc.dart';
import 'backend/blocLogic/budgetlogique/userbudgetsbloc/userbudgets_bloc.dart';
import 'backend/blocLogic/userlogique/userlogbloc/user_log_bloc.dart';
import 'backend/blocLogic/savinglogique/usersavingsbloc/usersavings_bloc.dart';
import 'backend/blocLogic/transferlogique/usertransfersbloc/usertransfers_bloc.dart';
import 'backend/socket/mysocket.dart';
import 'screens/log_sign_widgets/log_sign_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
       WidgetsFlutterBinding.ensureInitialized();
      initializeDateFormatting('fr_FR', null).then((_) {
      runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  //final channel = IOWebSocketChannel.connect(Uri.parse('ws://192.168.137.1:8080'));

   

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
        ),
        BlocProvider<DeletebudgetBloc>(
          create: (context) => DeletebudgetBloc(),
        ),
        BlocProvider<DeletesavingBloc>(
          create: (context) => DeletesavingBloc(),
        ),
        BlocProvider<DeletetransferBloc>(
          create: (context) => DeletetransferBloc(),
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

      //   Scaffold(
      //   appBar: AppBar(
      //     title: Text('WebSocket Example'),
      //   ),
      //   body: StreamBuilder(
      //     stream: WebSocketSingleton.broadcastStream,
      //     builder: (context, snapshot) {
      //       if (snapshot.hasError) {
      //         return Text('Error: ${snapshot.error}');
      //       }

      //       if (snapshot.hasData) {
      //         // Traitez les données reçues ici
      //         print("cool");
      //         return Text('Received: ${jsonDecode(snapshot.data!)}');
      //       } else {
      //         return Text('Waiting for data...');
      //       }
      //     },
      //   ),
      // ),
            ),
      ),
      
    );
     
  }
  }









