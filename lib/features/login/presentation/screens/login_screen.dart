import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project/core/colors_app.dart';
import 'package:project/core/components.dart';
import 'package:project/features/login/presentation/cubit/login_cubit.dart';
import 'package:project/features/login/presentation/widgets/separated_widget_row.dart';
import 'package:project/features/login/presentation/widgets/social_auth.dart';
import 'package:project/features/register/presentation/screens/register_page.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailControler = TextEditingController();
  TextEditingController passControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = LoginCubit.get(context);
            return Scaffold(
              appBar: DefaultAppBar(
                leading: IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.arrowLeft,
                    color: ColorApp.hint,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                context: context,
                title: 'Log in',
                actions: [
                  SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Skip',
                          style: TextStyle(color: ColorApp.hint, fontSize: 16),
                        )),
                  )
                ],
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultTextForm(
                            controller: emailControler,
                            labeltext: 'Email',
                            type: TextInputType.emailAddress),
                        const SizedBox(
                          height: 25,
                        ),
                        DefaultTextForm(
                            isPassword: cubit.isPassword,
                            sufxBtn: cubit.isPassword ? 'view' : 'Hide',
                            showPassfunc: () {
                              cubit.showPass();
                            },
                            controller: passControler,
                            labeltext: 'Password',
                            type: TextInputType.visiblePassword),
                        const SizedBox(
                          height: 40,
                        ),
                        DefaultButton(
                            text: 'Log in',
                            isUperCase: false,
                            function: () {},
                            background: ColorApp.Btn,
                            radius: 30),
                        const SizedBox(
                          height: 14,
                        ),
                        Center(
                          child: InkWell(
                            splashColor: ColorApp.ScafflodColor,
                            onTap: () {
                              Navigator.of(context).push(PageTransition(
                                duration: Duration(seconds: 1),
                                child: RegisterScreen(),
                                childCurrent: this,
                                type: PageTransitionType.fade,
                                // alignment: Alignment.center,
                              ));
                            },
                            child: const Text('I Dont Have an Acount',
                                style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const SeparatedWidgetDeviderAndText(),
                        const SizedBox(
                          height: 14,
                        ),
                        const SocialAuthLogin(),
                      ]),
                ),
              ),
            );
          },
        ));
  }
}
