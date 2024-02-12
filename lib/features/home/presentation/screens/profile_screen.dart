import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/core/colors_app.dart';
import 'package:project/core/components.dart';
import 'package:project/features/home/presentation/cubit/home_cubit.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController nameContr = TextEditingController();
  TextEditingController emailContr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = HomeCubit.get(context).model;
        var cubit = HomeCubit.get(context);
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    height: 230,
                    child: Stack(alignment: Alignment.bottomCenter, children: [
                      Align(
                          alignment: Alignment.topCenter,
                          child: Stack(children: [
                            Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://img.freepik.com/premium-photo/user-icon-person-symbol-human-avatar-3d-render_473931-217.jpg?w=740'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: CircleAvatar(
                                radius: 20,
                                backgroundColor: ColorApp.ScafflodColor,
                                child: const Icon(
                                  FontAwesomeIcons.camera,
                                  color: ColorApp.hint,
                                ),
                              ),
                            ),
                          ])),
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 61,
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            child: CircleAvatar(
                              radius: 59,
                              backgroundImage: cubit.profileImage == null
                                  ? NetworkImage('${userModel.img}')
                                  : FileImage(cubit.profileImage!)
                                      as ImageProvider,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                cubit.getImgProfile();
                              },
                              icon: CircleAvatar(
                                radius: 18,
                                backgroundColor: ColorApp.ScafflodColor,
                                child: const Icon(
                                  FontAwesomeIcons.camera,
                                  color: ColorApp.hint,
                                ),
                              ))
                        ],
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${userModel.name}',
                    style: TextStyle(color: ColorApp.hint, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: DefaultButton(
                            background: ColorApp.Btn,
                            text: "Update Profile",
                            function: () {
                              if (formKey.currentState!.validate()) {
                                cubit.uploadProfileImage(name: nameContr.text);
                                print(nameContr.text);
                              }
                            }),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      OutlinedButton(
                          onPressed: () {},
                          child: const FaIcon(
                            FontAwesomeIcons.penToSquare,
                            size: 20,
                            color: ColorApp.Btn,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DefaultTextForm(
                      validate: (name) {
                        if (name != null) {
                          if (name.isEmpty) {
                            return 'No changed';
                          }
                          return null;
                        }
                      },
                      controller: nameContr,
                      labeltext: userModel.name,
                      type: TextInputType.text),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: TextStyle(color: ColorApp.hint),
                    readOnly: true,
                    controller: TextEditingController(text: userModel.email),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
