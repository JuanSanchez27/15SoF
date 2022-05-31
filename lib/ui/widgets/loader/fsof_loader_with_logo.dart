import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fsof/generated/l10n.dart';
import 'package:fsof/ui/styles/styles.dart';
import 'package:fsof/ui/utils/constants/constants.dart';

class FSOFCustomLoader extends StatefulWidget {
  const FSOFCustomLoader({Key? key}) : super(key: key);

  @override
  State<FSOFCustomLoader> createState() => _FSOFCustomLoaderState();
}

class _FSOFCustomLoaderState extends State<FSOFCustomLoader> with SingleTickerProviderStateMixin{
 
  AnimationController? _controller;
  Animation<double>? _animation;
  bool upDown = true;

  @override
  void initState() {
    _controller =  AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation =  CurvedAnimation(
      parent: _controller!,
      curve:  const Interval(-1.0, 0.0, curve: Curves.linear),
    );
    _controller!.forward();
    super.initState();
  }


  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor.withOpacity(0.8),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${I18n.of(context).gLoading}...',
                style: Styles.h5,
              ),
              const SizedBox( height: kDimens30,),
              AnimatedBuilder(
                animation: _animation!,
                builder: (context, child) {
                  return SizedBox(
                    height: kDimens110,
                    child: SvgPicture.asset(
                      kImageLogo,
                      height: kDimens110
                    ),
                  );  
                } 
              )
            ],
          ),
      ),
    );
  }
}