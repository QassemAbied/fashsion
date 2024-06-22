import 'package:fashsion/auth/manager/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/utiles/app_colors.dart';
import 'data/manage/all_service_provider_cubit/all_service_provider_cubit.dart';
import 'data/models/all_clotges_models.dart';
import 'data/repo/all_service_provider_repo_impl.dart';

class TypeOfClothesView extends StatefulWidget {
  const TypeOfClothesView({super.key,  this.selectId='all'});
  final String selectId;

  @override
  State<TypeOfClothesView> createState() => _TypeOfClothesViewState();
}
class categoryClass{
  final String name;
  final String id;
  categoryClass({required this.name, required this.id});
}
List<categoryClass> category=[
  categoryClass(name: 'All', id: 'all'),
  categoryClass(name: 'SHIRT', id: 'shirt'),
  categoryClass(name: 'T_SHIRT', id: 't-shirt'),
  categoryClass(name: 'TROUSERS', id: 'jeans'),
  categoryClass(name: 'COAT', id: 'coats'),
  categoryClass(name: 'JACKET', id: 'jjj'),

];
class _TypeOfClothesViewState extends State<TypeOfClothesView> {
   late String selectId;
   @override
  void initState() {
    super.initState();
    selectId=widget.selectId;
    BlocProvider.of<AllServiceProviderCubit>(context).getSearchCubit(context);
    // BlocProvider.of<AllServiceProviderCubit>(context).
    // getAllServiceProviderCubit(parameter:selectId);

  }
  bool isTrue=false;


  @override
  Widget build(BuildContext context) {
    // isTrue==true?BlocProvider.of<AllServiceProviderCubit>(context).getSearchCubit(context):
    // SizedBox();
    return Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(),
        body: Column(
          children: [
            const Text('TYPE OF CLOTHES',),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 40,
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context , index){
                    return InkWell(
                      onTap: (){
                        setState(() {
                          isTrue=true;
                          selectId=category[index].id;
                          selectId=='all'?
                          BlocProvider.of<AllServiceProviderCubit>(context).getSearchCubit(context)
                              :
                          BlocProvider.of<AllServiceProviderCubit>(context).
                          getAllServiceProviderCubit(parameter:selectId);
                          // selectId==''?
                          //     :
                          // BlocProvider.of<AllServiceProviderCubit>(context).getSearchCubit(context);
                        });

                      },
                      child:Container(
                        width: 80,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: selectId==category[index].id? AppColors.primaryColor:Colors.white,
                          border: Border.all(
                            color: selectId==category[index].id? Colors.white: AppColors.primaryColor,
                          ),
                        ),
                        child: Center(
                          child: Text(category[index].name,
                            style: TextStyle(
                              color: selectId==category[index].id? Colors.white: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context , index){
                    return const SizedBox(
                      width: 15.0,
                    );
                  },
                  itemCount: category.length
              ),
            ),

      //       BlocBuilder<AllServiceProviderCubit, AllServiceProviderState>(
      //   builder: (context, state) {
      //     if(state is SearchSuccess){
      //       return SizedBox(
      // height: 100,
      // child: ListView.separated(
      //     physics: const BouncingScrollPhysics(),
      //     shrinkWrap: true,
      //     scrollDirection: Axis.horizontal,
      //     itemBuilder: (context , index){
      //       return InkWell(
      //         onTap: (){
      //           setState(() {
      //             isTrue=true;
      //             selectId=state.providerSearchData.categories![index];
      //             BlocProvider.of<AllServiceProviderCubit>(context).
      //             getAllServiceProviderCubit(parameter:selectId);
      //             // selectId==''?
      //             //     :
      //            // BlocProvider.of<AllServiceProviderCubit>(context).getSearchCubit(context);
      //           });
      //          // BlocProvider.of<AllServiceProviderCubit>(context).getSearchCubit(context);
      //
      //         },
      //         child:Text(category[index].name,
      //            // state.providerSearchData.categories![index]
      //         ),);
      //     },
      //     separatorBuilder: (context , index){
      //       return const SizedBox(
      //         width: 15.0,
      //       );
      //     },
      //     itemCount: state.providerSearchData.categories!.length
      // ),
      //       );
      //     }else if(state is SearchFailure){
      //       return Text(state.searchMessErr);
      //     }
      //     return Center(child: CircularProgressIndicator());
      //   },
      // ),
            const SizedBox(
              height: 10.0,
            ),
            selectId =='all'?
            BlocBuilder<AllServiceProviderCubit, AllServiceProviderState>(
    builder: (context, state) {
      if(state is SearchSuccess){
        return CustomGridItem(data:state.providerSearchData.data!,);
      }
      return Expanded(child: Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)));
    },
    )
                :
            BlocBuilder<AllServiceProviderCubit, AllServiceProviderState>(
              builder: (context, state) {
                if(state is AllServiceProviderSuccess){
                  return Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height:40,
                          child: PopupMenuButton(
                            icon: Icon(Icons.menu),
                              itemBuilder: (context)=>List.generate(
                            state.listServiceData.types!.length,(index){
                            return PopupMenuItem(child: Text(state.listServiceData.types![index]));
                          },
                          )
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        // SizedBox(
                        //   height:100,
                        //   child: IconButton(onPressed: () {  },
                        //     icon: Icon(Icons.menu),
                        //   ),
                        // ),
                        CustomGridItem(data:state.listServiceData.data!,),
                      ],
                    ),
                  );
                }
                return Expanded(child: const Center(child: CircularProgressIndicator(
                  color: AppColors.primaryColor,)));

              },
            )
            ,
          ],
        ),
      );
  }
}

class CustomGridItem extends StatelessWidget {
  const CustomGridItem({
    super.key, required this.data,
  });
  final List<dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        childAspectRatio: 1,
        crossAxisSpacing: 5,

        children: List.generate(data.length, (index) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                height: 165,
                width: double.infinity,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.black, width: 1.0),
                  image: DecorationImage(image: NetworkImage(data[index].image!),
                    fit: BoxFit.fill
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
