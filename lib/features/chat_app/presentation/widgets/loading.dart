import 'package:chat/core/constants/constants.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.8),
      child: const Center(
        child: CircularProgressIndicator(
          color: AppColors.backgroundColor,
        ),
      ),
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
  final ImageChunkEvent? loadingProgress;
  const LoadingViewImage({super.key, required this.loadingProgress});

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

class Loading extends StatefulWidget {
  final bool isLoading;
  const Loading({super.key, required this.isLoading});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Widget build(BuildContext context) {
    return Positioned(
      child: widget.isLoading ? LoadingView() : const SizedBox.shrink(),
    );
  }
}
