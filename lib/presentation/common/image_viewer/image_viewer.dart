import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:fsof/navigation/app_router.dart';

class ImageViewerPage extends StatefulWidget {
  const ImageViewerPage(
    this.images, {
    this.selectedIndex = 0,
    Key? key,
  }) : super(key: key);

  final List<Image> images;
  final int selectedIndex;

  @override
  ImageViewerPageState createState() => ImageViewerPageState();
}

class ImageViewerPageState extends State<ImageViewerPage> {
  final backgroundColor = Colors.black.withAlpha(220);

  late int currentIndex;

  @override
  void initState() {
    super.initState();

    currentIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _buildViewer(),
        _buildButtons(context),
      ],
    );
  }

  Widget _buildViewer() {
    if (widget.images.isEmpty) {
      return Container();
    }

    if (widget.images.length == 1) {
      return _buildSingleViewer(widget.images[currentIndex]);
    }

    return _buildMultipleViewer();
  }

  Widget _buildSingleViewer(Image image) {
    return SizedBox(
      child: ExtendedImageSlidePage(
        slidePageBackgroundHandler: (offset, pageSize) => backgroundColor,
        child: ExtendedImage(
          image: image.image,
          mode: ExtendedImageMode.gesture,
          loadStateChanged: _buildImageStates,
          enableSlideOutPage: false,
          initGestureConfigHandler: (state) {
            return GestureConfig(
              minScale: 0.9,
              animationMinScale: 0.7,
              maxScale: 3.0,
              animationMaxScale: 3.5,
              speed: 1.0,
              inertialSpeed: 100.0,
              initialScale: 1.0,
              inPageView: false,
              cacheGesture: false,
            );
          },
        ),
      ),
    );
  }

  Widget _buildMultipleViewer() {
    return Container(
      color: backgroundColor,
      child: ExtendedImageGesturePageView.builder(
        itemBuilder: (context, index) {
          return ExtendedImage(
            image: widget.images[index].image,
            mode: ExtendedImageMode.gesture,
            loadStateChanged: _buildImageStates,
            enableSlideOutPage: false,
            initGestureConfigHandler: (state) {
              return GestureConfig(
                minScale: 0.9,
                animationMinScale: 0.7,
                maxScale: 3.0,
                animationMaxScale: 3.5,
                speed: 1.0,
                inertialSpeed: 100.0,
                initialScale: 1.0,
                inPageView: true,
                cacheGesture: false,
              );
            },
          );
        },
        controller: PageController(
          initialPage: currentIndex,
        ),
        onPageChanged: (index) => currentIndex = index,
        itemCount: widget.images.length,
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    if (widget.images.isEmpty) {
      return Container();
    }

    return Positioned(
      right: 0,
      top: kToolbarHeight,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            _buildButton(Icons.clear, () => appRouter.goBack(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(IconData icon, VoidCallback onTap) {
    return SizedBox(
      height: 60,
      width: 60,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: onTap,
          child: Icon(
            icon,
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
    );
  }

  Widget? _buildImageStates(ExtendedImageState state) {
    switch (state.extendedImageLoadState) {
      case LoadState.loading:
        return const Center(
          child: SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
        );
      case LoadState.completed:
        return null;
      case LoadState.failed:
        return const Center(
          child: Icon(
            Icons.error,
          ),
        );
      default:
        return null;
    }
  }
}
