import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_record/config/app_assets.dart';
import 'package:money_record/config/app_color.dart';
import 'package:money_record/config/sessions.dart';
import 'package:money_record/presentation/controller/c_user.dart';
import 'package:money_record/presentation/page/auth/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cUser = Get.put(Cuser());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const Drawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
            child: Row(
              children: [
                Image.asset('assets/images/profile.png'),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hi,',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Obx(() {
                        return Text(
                          cUser.data.name ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        );
                      })
                    ],
                  ),
                ),
                Builder(builder: (ctx) {
                  //context bentrok dengan context scaffold
                  return Material(
                    borderRadius: BorderRadius.circular(9),
                    color: AppColor.chart,
                    child: InkWell(
                        borderRadius: BorderRadius.circular(9),
                        onTap: () {
                          Scaffold.of(ctx).openEndDrawer();
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.menu,
                            color: AppColor.primary,
                          ),
                        )),
                  );
                }),
              ],
            ),
          ),
          Expanded(
              child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
            children: [
              Text(
                'Pengeluaran Hari Ini',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              DView.spaceHeight(),
              Material(
                color: AppColor.primary,
                child: Column(
                  children: [
                    Text('Rp 500.000.00'),
                    Text('+20% Dibanding Kemarin'),
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              bottomLeft: Radius.circular(8))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Selengkapnya'),
                          Icon(Icons.navigate_next)
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
