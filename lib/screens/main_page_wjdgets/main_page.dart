import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';


import '../../app_engine/app_engine.dart';
import '../../app_engine/app_localizations.dart';
import '../../app_engine/app_transition.dart';
import 'widgets/account_page/account_page.dart';
import 'widgets/calendar/topcalendar.dart';
import 'widgets/exchange_currency_widget/exchange_currency_page.dart';
import 'widgets/home_page_widgets/home_page.dart';
import 'widgets/notification_page/main_notif_page.dart';
import 'widgets/objectif_savings_widgets/objectif_savings_page.dart';




class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 2;
  int get currentIndex => _currentIndex;
  set currentIndex(int value){
    setState(() {
      _currentIndex = value;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    AppLocalizations? lang = AppLocalizations(); //.of(context);
    AppEngine appEngine = AppEngine();
    final List<String> bigTitles = [lang.mainPageTitle0, lang.mainPageTitle1, lang.mainPageTitle2, lang.mainPageTitle3];
    return Scaffold(
      
      bottomNavigationBar: SalomonBottomBar(
        margin: const EdgeInsets.only(bottom: 4),
          curve: Curves.linear,
          currentIndex: currentIndex,
          onTap: (i) {
            currentIndex = i;
            if (currentIndex == 2) {
            
            }
          } ,
          items: [
            
            SalomonBottomBarItem(
              icon: Icon(Icons.account_balance_wallet_outlined, size: appEngine.myFontSize['iconSize'],),
              title: Text("My account", style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["less"],),),
              
            ),
       
            SalomonBottomBarItem(
              icon: Icon(Icons.savings_outlined, size: appEngine.myFontSize['iconSize'],),
              title: Text("Savings", style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["less"],),),
              
            ),


            SalomonBottomBarItem(
              icon: Icon(Icons.home_outlined, size: appEngine.myFontSize['iconSize'],),
              title: Text("Home", style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["less"],),),
              selectedColor: appEngine.myColors['myGreen1'],
              unselectedColor : appEngine.myColors['myBlack']
            ),

  
            SalomonBottomBarItem(
              icon: Icon(Icons.currency_exchange_outlined, size: appEngine.myFontSize['iconSize'],),
              title: Text("Exchange", style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], fontSize: appEngine.myFontSize["less"],),),
              selectedColor:  appEngine.myColors['myGreen1'],
              unselectedColor : appEngine.myColors['myBlack']
            ),]),
      
      
      
      body: SafeArea(child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 30.sp, width: 30.sp,
                child: SvgPicture.asset("assets/svg/sort_menu.svg",
                                    colorFilter: ColorFilter.mode(appEngine.myColors["myGreen1"]!, BlendMode.srcIn),
                                    ),
              ),
              GestureDetector(
                onTap: () {
                  AppTransition.standardGoTo(
                              context, const MainNotificationPage());
                },
                child: Icon(Icons.circle_notifications_outlined, size: 30.sp, color: appEngine.myColors["myGreen1"],))
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left : 5.0, right: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(bigTitles[currentIndex], 
                style: TextStyle(fontFamily: appEngine.myFontfamilies["st"],
                  fontWeight: FontWeight.bold,
                  fontSize: appEngine.myFontSize["hintText"], 
                  color: appEngine.myColors["myBlack"]),),
          
              Text("  ${DateTime.now().month} - ${DateTime.now().year}", 
              style: TextStyle(fontFamily: appEngine.myFontfamilies["st"], 
              fontWeight: FontWeight.bold,
              fontSize: appEngine.myFontSize["hintText"], 
              color: appEngine.myColors["myGreen1"]),),
            ],
          ),
        ),
        SizedBox( height: 68.h,
          child: const WeekdayButtons()),
        
         

        Expanded(child:currentIndex == 2? 
        const HomePage():
        currentIndex == 1? const ObjectifSavings() : 
        currentIndex == 3? const ExchangeCurrencyPage() : 
        const AccountPage()
        )
      ]),)
      
      )
      ;
  }
}