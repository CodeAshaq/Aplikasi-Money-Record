import 'package:course_money_record/config/app_asset.dart';
import 'package:course_money_record/config/app_color.dart';
import 'package:course_money_record/data/source/source_user.dart';
import 'package:course_money_record/presentation/page/auth/register_page.dart';
import 'package:course_money_record/presentation/page/home_page.dart';
import 'package:d_info/d_info.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final controllerEmail = TextEditingController();
    final controllerPassword = TextEditingController();
    final formkey = GlobalKey<FormState>();
    login() async {
      if (formkey.currentState!.validate()) {
        bool success = await SourceUser.login(
          controllerEmail.text,
          controllerPassword.text,
        );
        if (success) {
          DInfo.dialogSuccess('Berhasil Login');
          DInfo.closeDialog(actionAfterClose: () {
            Get.off(() => const HomePage());
          });
        } else {
          DInfo.dialogError('Gagal Login');
          DInfo.closeDialog();
        }
      }
    }

    return Scaffold(
      backgroundColor: AppColor.bg,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DView.nothing(),
                  Form(
                      key: formkey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          children: [
                            Image.asset(AppAsset.logo),
                            DView.spaceHeight(40),
                            TextFormField(
                              controller: controllerEmail,
                              validator: (value) =>
                                  value == '' ? 'Jangan Kosong' : null,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                  fillColor: AppColor.primary.withOpacity(0.5),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'email',
                                  isDense:
                                      true, //lebih tipis dri tinggi inputnya
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 16,
                                  )),
                            ),
                            DView.spaceHeight(20),
                            TextFormField(
                              controller: controllerPassword,
                              validator: (value) =>
                                  value == '' ? 'Jangan Kosong' : null,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              obscureText: true,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                  fillColor: AppColor.primary.withOpacity(0.5),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide.none,
                                  ),
                                  hintText: 'password',
                                  isDense:
                                      true, //lebih tipis dri tinggi inputnya
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 16,
                                  )),
                            ),
                            DView.spaceHeight(30),
                            Material(
                              color: AppColor.primary,
                              borderRadius: BorderRadius.circular(15),
                              child: InkWell(
                                onTap: (() => login()),
                                borderRadius: BorderRadius.circular(15),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 16),
                                  child: Text(
                                    'LOGIN',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 25),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Belum punya akun?',
                            style: TextStyle(fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const RegisterPage());
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                  color: AppColor.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          )
                        ]),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
