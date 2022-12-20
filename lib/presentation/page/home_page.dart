import 'package:course_money_record/config/app_asset.dart';
import 'package:course_money_record/config/app_color.dart';
import 'package:course_money_record/presentation/controller/c_user.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cUser = Get.put(CUser());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: const Drawer(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
              child: Row(
                children: [
                  Image.asset(AppAsset.profile),
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
                    return Material(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColor.chart,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(4),
                        onTap: () {
                          Scaffold.of(ctx).openEndDrawer();
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.menu, color: AppColor.primary),
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
            Expanded(
                child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
              children: [
                Text(
                  'Pengeluaran Hari ini',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                DView.spaceHeight(),
                Material(
                  color: AppColor.primary,
                  child: Column(
                    children: [
                      const Text('RP. 500.000,00'),
                      const Text('+20% dibanding kemarin'),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Selengkapnya',
                              style: TextStyle(color: AppColor.primary),
                            ),
                            Icon(
                              Icons.navigate_next,
                              color: AppColor.primary,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
          ],
        ));
  }
}
