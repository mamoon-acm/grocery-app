import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/Material.dart';
import 'package:grocery_app/core/constant/app_color.dart';

class NetworkImageWithLoader extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final bool isCircular; // NEW FLAG

  const NetworkImageWithLoader({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.isCircular = false,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double h = height ?? size.height * 0.2;
    final double w = width ?? size.width * 0.2;

    final Widget image = CachedNetworkImage(
      imageUrl: url,
      height: h,
      width: w,
      fit: BoxFit.cover,
      placeholder: (context, url) =>
          Center(child: CircularProgressIndicator(color: AppColors.primary)),
      errorWidget: (context, url, error) {
        debugPrint("ImageUrl:$url");
        return Container(
          width: w,
          height: h,
          color: Colors.grey[300],
          child: const Icon(Icons.error),
        );
      },
    );

    if (isCircular) {
      return ClipOval(child: image);
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: image,
      );
    }
  }
}
