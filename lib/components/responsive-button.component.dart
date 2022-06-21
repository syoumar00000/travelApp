import 'package:agnonter/components/simple-text.component.dart';
import 'package:agnonter/utils/colors.utils.dart';
import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({Key? key, this.isResponsive = false, this.width = 60})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ? double.maxFinite : width,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorsUtils.mainColor,
        ),
        child: Row(
          mainAxisAlignment: isResponsive == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isResponsive == true
                ? Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: SimpleText(
                      text: "Book Trip Now",
                      color: Colors.white,
                    ))
                : Container(),
            Image.asset("asset/image/next-page.png"),
          ],
        ),
      ),
    );
  }
}
