import 'package:fashsion/data/manage/all_service_provider_cubit/all_service_provider_cubit.dart';
import 'package:fashsion/data/models/size_prediction_required_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SizeView extends StatelessWidget {
  SizeView({super.key});

  final TextEditingController heightEditingController = TextEditingController();
  final TextEditingController weightEditingController = TextEditingController();
  final TextEditingController ageEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0.5,
      // ),
      // drawer: const Drawer(
      //   backgroundColor: Color(0xff666D61),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "SIZE PREDICTION",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff666D61),
                  ),
                ),
              ),
              const SizedBox(
                height: 33,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Container(
                        child: Image.asset(
                          "assets/images/arrow.png",
                          width: 16,
                          height: 15,
                        )),
                    const Padding(
                      padding: EdgeInsets.only(left: 6),
                      child: Text(
                        "Enter your measurements",
                        style: TextStyle(
                            color: Color(0xff000000),
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              AspectRatio(
                aspectRatio: 361 / 219,
                child: Container(
                  padding: EdgeInsets.all(20),

                  // color: const Color(0xff666D61),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xff666D61),
                  ),
                  child: Column(
                    children: [
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                "Height",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffFFFFFF)),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextField(
                                controller: heightEditingController,
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  hintText: "00",
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(20)),
                                  border: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(20)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 3,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                "weight",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffFFFFFF)),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextField(
                                controller: weightEditingController,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  hintText: "00",
                                  hintStyle: TextStyle(color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(20)),
                                  border: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(20)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        thickness: 3,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                "Age",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffFFFFFF)),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextField(
                                controller: ageEditingController,
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  hintText: "00",
                                  hintStyle: TextStyle(color: Colors.white),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(20)),
                                  border: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(20)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AllServiceProviderCubit>(context)
                      .getSizePredictionCubit(
                    context,
                    SizePredicationRequiredModule(
                      height: heightEditingController.text,
                      weight: weightEditingController.text,
                      age: ageEditingController.text,
                    ),
                  );
                },
                child: Text(
                  "SUBMIT",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(103, 34),
                    backgroundColor: Color(0xff666D61)),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Container(
                        child: Image.asset(
                          "assets/images/arrow.png",
                          width: 16,
                          height: 15,
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 6),
                      child: Row(
                        children: [
                          Text(
                            "size : ",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff666D61),
                            ),
                          ),
                          BlocConsumer<AllServiceProviderCubit, AllServiceProviderState>(
                            listener: (context, state) {
                              // TODO: implement listener
                            },
                            builder: (context, state) {
                              if(state is SizePredictionSuccess){
                                return Text(
                                  state.sizePrediction.prediction!,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff666D61),
                                  ),
                                );
                              }
                              return Text(
                                "result",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff666D61),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
