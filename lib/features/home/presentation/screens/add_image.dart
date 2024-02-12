import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/features/home/presentation/cubit/home_cubit.dart';

class AddImgScreen extends StatelessWidget {
  const AddImgScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, sate) {},
        builder: (context, state) {
          return Center(
            child: Text('Add imgs'),
          );
        });
  }
}
