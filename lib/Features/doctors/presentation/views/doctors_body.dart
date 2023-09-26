// import 'package:flutter/material.dart';
// import 'package:untitled/core/utils/size_config.dart';

// class DoctorsBody extends StatefulWidget {
//   const DoctorsBody({super.key});

//   @override
//   State<DoctorsBody> createState() => _DoctorsBodyState();
// }

// class _DoctorsBodyState extends State<DoctorsBody> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(top: 16 * SizeConfig.verticalBlock,right: 20*SizeConfig.horizontalBlock,left: 20*SizeConfig.horizontalBlock),
//       child: GridView.builder(
//               itemCount: doctors.length,
//               gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                   maxCrossAxisExtent: 150 * SizeConfig.horizontalBlock,
//                   mainAxisSpacing: 10 * SizeConfig.horizontalBlock,
//                   crossAxisSpacing: 10 * SizeConfig.verticalBlock,
//                   mainAxisExtent: 210 * SizeConfig.verticalBlock),
//               itemBuilder: (_, index) {
//                 return DoctorComponent(doctorModel: doctors[index]);
//               }),
//     );
//   }
// }
