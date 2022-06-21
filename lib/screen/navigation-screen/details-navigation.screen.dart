import 'package:agnonter/components/bold-text.component.dart';
import 'package:agnonter/components/button.component.dart';
import 'package:agnonter/components/responsive-button.component.dart';
import 'package:agnonter/components/simple-text.component.dart';
import 'package:agnonter/cubit/cubit-state.cubit.dart';
import 'package:agnonter/cubit/cubit.dart';
import 'package:agnonter/utils/colors.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailNavigationScreen extends StatefulWidget {
  const DetailNavigationScreen({Key? key}) : super(key: key);

  @override
  State<DetailNavigationScreen> createState() => _DetailNavigationScreenState();
}

class _DetailNavigationScreenState extends State<DetailNavigationScreen> {
  int gottenStars = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: ((context, state) {
      DetailState detail = state as DetailState;
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("asset/image/" + detail.place.img),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Positioned(
                  left: 20,
                  top: 50,
                  child: Row(children: [
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<AppCubits>(context).goHome();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                      ),
                      color: Colors.white,
                    ),
                  ])),
              Positioned(
                top: 280,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 550,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BoldText(
                            text: detail.place.name,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          BoldText(
                            text: "\$ " + detail.place.price,
                            color: ColorsUtils.mainColor,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: ColorsUtils.mainColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SimpleText(
                            text: detail.place.location,
                            color: ColorsUtils.mainColor,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(Icons.star,
                                color: int.parse(detail.place.stars) > index
                                    ? ColorsUtils.startColor
                                    : ColorsUtils.textColor2);
                          }),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SimpleText(
                          text: "(5.0)",
                          color: ColorsUtils.textColor2,
                        ),
                      ]),
                      const SizedBox(
                        height: 10,
                      ),
                      BoldText(
                        text: "People",
                        size: 20,
                        color: Colors.black.withOpacity(0.8),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SimpleText(
                        text: "Number of person in your group",
                        color: ColorsUtils.mainTextColor,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: ButtonComponent(
                                size: 50,
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                backgroundColor: selectedIndex == index
                                    ? Colors.black
                                    : ColorsUtils.buttonBackground,
                                borderColor: selectedIndex == index
                                    ? Colors.black
                                    : ColorsUtils.buttonBackground,
                                text: (index + 1).toString(),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 20),
                      BoldText(
                        text: "Description",
                        size: 20,
                        color: Colors.black.withOpacity(0.8),
                      ),
                      const SizedBox(height: 10),
                      SimpleText(text: detail.place.description)
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    ButtonComponent(
                        size: 50,
                        color: ColorsUtils.textColor1,
                        backgroundColor: Colors.white,
                        borderColor: ColorsUtils.textColor1,
                        isIcon: true,
                        icon: Icons.favorite_border),
                    const SizedBox(
                      width: 20,
                    ),
                    ResponsiveButton(
                      isResponsive: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }));
  }
}
