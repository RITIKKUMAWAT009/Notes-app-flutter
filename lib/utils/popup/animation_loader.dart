
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationLoaderWidget extends StatelessWidget {
  const AnimationLoaderWidget({super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed});

  final String text, animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,
              width: MediaQuery
                  .of(context)
                  .size
                  .width *
                  0.8), //display lottie anim
          const SizedBox(
            height:16,
          ),
          Text(
            text,
            style: Theme
                .of(context)
                .textTheme
                .bodyMedium, textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16,),
          showAction ? SizedBox(
            width: 250,
            child: OutlinedButton(onPressed: onActionPressed,
              style: OutlinedButton.styleFrom(backgroundColor:Colors.black),
              child: Text(actionText!, style: Theme
                  .of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: Colors.white),),),
          ):const SizedBox(),
        ],
      ),
    );
  }
}
