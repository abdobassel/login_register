import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/core/colors_app.dart';
import 'package:project/core/components.dart';
import 'package:project/features/register/presentation/cubit/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  TextEditingController emailControler = TextEditingController();
  TextEditingController passControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = RegisterCubit.get(context);
            return Scaffold(
              appBar: DefaultAppBar(
                context: context,
                title: 'Create an Acount',
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
                          style: TextStyle(color: ColorApp.hint, fontSize: 18),
                        )),
                  )
                ],
                leading: IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.arrowLeft,
                    color: ColorApp.hint,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
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
                            onTap: () {},
                            child: Text('I Dont Have an Acount',
                                style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                height: 1,
                                color: ColorApp.hint,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5, left: 5),
                              child: Text(
                                'or',
                                style: TextStyle(
                                    fontSize: 15, color: ColorApp.hint),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 1,
                                color: ColorApp.hint,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        socialLogin(
                            iconData: FontAwesomeIcons.apple,
                            text: 'login With Apple',
                            onTap: () {}),
                        socialLogin(
                            iconData: FontAwesomeIcons.google,
                            text: 'login With Google',
                            onTap: () {}),
                        socialLogin(
                            iconData: FontAwesomeIcons.twitter,
                            text: 'login With Twiter',
                            onTap: () {}),
                        socialLogin(
                            iconData: FontAwesomeIcons.facebook,
                            text: 'login With FaceBook',
                            onTap: () {}),
                      ]),
                ),
              ),
            );
          },
        ));
  }
}
