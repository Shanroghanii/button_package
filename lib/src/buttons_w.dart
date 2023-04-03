import 'package:flutter/material.dart';

const Color pr = Color(0xff059FA5);
const Color br = Color(0xffe6edf1);

class ElevatedButtonW extends StatelessWidget {
  final Color? buttonColor;
  final Color? buttonTextColor;
  final String buttonText;
  final String? buttonIconPath;
  final Color? borderColor;
  final Function()? ontap;
  final double? buttonRadius;
  final bool? isFloatButton;
  final double? height;
  final bool? isLoading;
  const ElevatedButtonW({
    Key? key,
    required this.buttonText,
    this.ontap,
    this.buttonColor,
    this.buttonIconPath,
    this.buttonTextColor,
    this.borderColor,
    this.buttonRadius,
    this.isFloatButton,
    this.height,
    this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        height: height ?? 40,
        child: isFloatButton ?? false
            ? Align(
                alignment: Alignment.centerRight,
                child: FloatingActionButton(
                  onPressed: isLoading ?? false ? null : ontap,
                  child: const Icon(Icons.add),
                ),
              )
            : ElevatedButton(
                style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all(Size.zero), // Set this
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    backgroundColor:
                        MaterialStateProperty.all(buttonColor ?? pr),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(buttonRadius ?? 10.0),
                            side: BorderSide(
                                color: borderColor ?? buttonColor ?? pr)))),
                onPressed: isLoading ?? false ? null : ontap,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buttonIconPath != null
                        ? Container(
                            decoration: BoxDecoration(
                              color: buttonColor ?? pr,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                buttonIconPath!,
                                width: h * 0.033,
                                height: h * 0.033,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                        : SizedBox(
                            width: w * 0.001,
                          ),
                    isLoading ?? false
                        ? const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            buttonText,
                            style: TextStyle(color: buttonTextColor ?? br),
                          ),
                    SizedBox(
                      width: w * 0.001,
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
