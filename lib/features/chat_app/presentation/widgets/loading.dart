import 'package:chat/core/constants/constants.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(
          color: AppColors.backgroundColor,
        ),
      ),
      color: Colors.white.withOpacity(0.8),
    );
  }
}

class LoadingViewCenter extends StatelessWidget {
  const LoadingViewCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.backgroundColor,
      ),
    );
  }
}

class LoadingViewImage extends StatefulWidget {
  ImageChunkEvent? loadingProgress;
  LoadingViewImage({super.key, required this.loadingProgress});

  @override
  State<LoadingViewImage> createState() => _LoadingViewImageState();
}

class _LoadingViewImageState extends State<LoadingViewImage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircularProgressIndicator(
          color: AppColors.backgroundColor,
          value: widget.loadingProgress!.expectedTotalBytes != null
              ? widget.loadingProgress!.cumulativeBytesLoaded /
                  widget.loadingProgress!.expectedTotalBytes!
              : null,
        ),
      ],
    );
  }
}
