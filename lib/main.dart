import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:money_record/config/app_color.dart';
import 'package:money_record/config/sessions.dart';
import 'package:money_record/data/model/user.dart';
import 'package:money_record/presentation/page/auth/login_page.dart';
import 'package:money_record/presentation/page/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //harus diinitial agar beberapa fitur seperti sharedpreference bisa berjalan
  initializeDateFormatting('id_ID').then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: Session.getUser(),
        builder: (context, AsyncSnapshot<User> snapshot) {
          if (snapshot.data != null && snapshot.data!.idUser != null) {
            return const HomePage();
          }
          return const LoginPage();
        },
      ),
      theme: ThemeData.light().copyWith(
          primaryColor: AppColor.primary,
          colorScheme: const ColorScheme.light(
            primary: AppColor.primary,
            secondary: AppColor.secondary,
          ),
          appBarTheme: const AppBarTheme(
              backgroundColor: AppColor.primary,
              foregroundColor: Colors.white)),
    );
  }
}
