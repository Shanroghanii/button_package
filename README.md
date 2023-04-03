<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Customizable button with options.

## Features


## Getting started


## Usage


```dart
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
                        MaterialStateProperty.all(buttonColor ?? primaryColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(buttonRadius ?? 10.0),
                            side: BorderSide(
                                color: borderColor ??
                                    buttonColor ??
                                    primaryColor)))),
                onPressed: isLoading ?? false ? null : ontap,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buttonIconPath != null
                        ? Container(
                            decoration: BoxDecoration(
                              color: buttonColor ?? primaryColor,
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
                            style: TextStyle(
                                color: buttonTextColor ?? backgroundColor),
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

```

## Additional information

Initial release of the package with the following features:

Customizable button with options for color, text, icon, border, onTap, radius, height, and loading state.
Option to make the button a floating action button.
Support for null safety.
