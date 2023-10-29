// ignore_for_file: body_might_complete_normally_nullable
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Features/home/data/models/major_model.dart' as basel;
import 'package:untitled/Features/home/presentation/views/widgets/doctor_component.dart';
import '../../../../core/app_colors.dart';
import '../../../search/data/all_doctors_response.dart';
import '../../../search/presentation/manger/cubit/search_cubit.dart';
import '../../../search/presentation/manger/cubit/search_cubit_state.dart';


class AllDoctorsScreen extends StatefulWidget {
  const AllDoctorsScreen({super.key});
  static const id = 'AllDoctorsScreen';

  @override
  State<AllDoctorsScreen> createState() => _AllDoctorsScreenState();
}

class _AllDoctorsScreenState extends State<AllDoctorsScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController search = TextEditingController();
  List<Data> doctorsList=[];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<GetDoctorsCubit, GetDoctorsCubitState>(
      listener: (context, state) {
        if(state is GetDoctorsCubitInitial){
          BlocProvider.of<GetDoctorsCubit>(context).getAllDoctors();
        }
        if(state is GetDoctorsCubitFailure){
          AnimatedSnackBar.material(
            state.err.toString().replaceAll("Exception:", " "),
            type: AnimatedSnackBarType.error,
            duration: const Duration(seconds: 4),
          ).show(context);
        }
      },

      builder: (context, state) {
        var cubit = BlocProvider.of<GetDoctorsCubit>(context);
        return
            state is GetDoctorsCubitLoading?
            const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),)
                : state is GetDoctorsCubitSuccess?
                  (cubit.doctors.data?.isEmpty??true)?
                  const Center(child: Text("No Doctors Available"),):
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: GridView.count(
                          padding: EdgeInsets.all(16),
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 12,
                          childAspectRatio: 1.0/1.55,
                          crossAxisCount: 2,
                          physics: const ClampingScrollPhysics(),
                          children: buildDoctorsItems(cubit.doctors),
                        ),
                      ),
                    ],
                  )
                :state is GetDoctorsCubitFailure?Center(child: Text(state.err))
                :Container()
        ;
      },
    );
  }

  List<Widget> buildDoctorsItems(AllDoctorsResponse doctors){
    List<Widget> list=[];
    List<Data> data=doctors.data??[];
    for(var item in data){
      list.add(
        SizedBox(
          child: DoctorComponent(doctorModel:
          basel.Doctors(name: item.name,id: item.id,address: item.address,appointPrice: item.appointPrice,
          degree: item.degree,description: item.description,email: item.email,
              endTime: item.endTime,gender: item.gender,phone: item.phone,photo: item.photo,
              specialization: basel.Specialization(id: item.specialization?.id,name: item.specialization?.name)
              ,startTime: item.startTime),
          ),
        )
      );
    }
    return list;
  }
}


