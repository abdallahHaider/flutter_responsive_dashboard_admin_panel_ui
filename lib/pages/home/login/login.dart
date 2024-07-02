import 'package:flutter/material.dart';
import 'package:flutter_dashboard/pages/home/login/widgets/login_button.dart';
import 'package:flutter_dashboard/pages/home/login/widgets/logo.dart';
import 'package:flutter_dashboard/responsive.dart';
import 'package:flutter_dashboard/widgets/text_field.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    SizedBox _height(BuildContext context) => SizedBox(
          height: Responsive.isDesktop(context) ? 20 : 20,
        );

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: Responsive.isDesktop(context)||Responsive.isTablet(context)?600:MediaQuery.of(context).size.width-50,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Logo(),
                _height(context),
                const Text("تسجيل الدخول"),
                  const SizedBox(
                  height: 5,
                ),
                const Text("لا يمكنك الدخول الى لوحة التحكم الا اذا كنت مخول",style: TextStyle(color: Colors.grey),),
                  const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                    icon: Icons.email,
                    hint: "البريد الالكتروني",
                    controller: emailController),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  icon: Icons.key,
                  hint: "كلمة المرور",
                  controller: passwordController,
                  isPassword: true,
                ),
                 const SizedBox(
                  height: 10,
                ),
                LoginButton((){
                  SmartDialog.showToast("فشلت عملية تسجيل الدخول");
                  print("login");
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
