import 'package:agnonter/components/bold-text.component.dart';
import 'package:agnonter/components/responsive-button.component.dart';
import 'package:agnonter/components/simple-text.component.dart';
import 'package:agnonter/cubit/cubit.dart';
import 'package:agnonter/utils/colors.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List images = [
    "mac1.jpg",
    "onb1.jpg",
    "onb2.jpg",
    "robe2.png",
    "veste4.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("asset/image/" + images[index]),
                      fit: BoxFit.cover)),
              child: Container(
                margin: const EdgeInsets.only(
                  top: 220,
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BoldText(text: "Beauty"),
                        SimpleText(
                          text: "Amazing",
                          size: 30.0,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 150,
                          child: SimpleText(
                            text:
                                "la vie de louga françois et son amour pour la sape, la mode,le blingbling ...",
                            color: ColorsUtils.textColor2,
                            size: 14.0,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context).getData();
                          },
                          child: Container(
                            width: 180,
                            child: Row(
                              children: [
                                ResponsiveButton(
                                  width: 80,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: List.generate(5, (indexSlide) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index == indexSlide ? 25 : 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == indexSlide
                                ? ColorsUtils.mainColor
                                : ColorsUtils.mainColor.withOpacity(0.3),
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
