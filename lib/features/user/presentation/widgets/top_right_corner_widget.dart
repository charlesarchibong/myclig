import 'package:flutter/material.dart';
import 'package:myclig/core/constants/colors_constant.dart';
import 'package:myclig/core/constants/image_assets_constnts.dart';

class TopRightCornerWidget extends StatelessWidget {
  const TopRightCornerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          padding: EdgeInsets.fromLTRB(70, 30, 30, 50),
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              color: ColorConstant.PRIMARY_COLOR,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(150),
                  topLeft: Radius.elliptical(2, 22),
                  bottomRight: Radius.elliptical(0, 70)
                  // bottomRight: Radius.elliptical(50, 40)
                  )),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                ImageAssetConstants.MYCLIGLOGO_SMALL,
              ),
            )),
          ),
        ),
      ),
    );
  }
}
