import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/cubit/home_cubit.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/cubit/home_state.dart';
import 'package:untitled/core/utils/size_config.dart';
import 'package:untitled/Features/home/presentation/views/widgets/major_component.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (_, __) => BlocProvider.of<HomeCubit>(context).majorList.isEmpty
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 10 * SizeConfig.horizontalBlock),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          BlocProvider.of<HomeCubit>(context).majorList.length,
                      itemBuilder: (context, index) => MajorComponent(
                        majorModel: BlocProvider.of<HomeCubit>(context)
                            .majorList[index],
                      ),
                    ),
                    SizedBox(height: 10 * SizeConfig.verticalBlock),
                  ],
                ),
              ),
            ),
    );
  }
}
