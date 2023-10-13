import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'marketplace_listing_model.dart';
import '../utils/custom_box_shadow.dart';
import 'marketplace_rarity_tag.dart';

class MarketplaceItem extends StatefulWidget {
  final MarketplaceListing marketplaceListing;
  const MarketplaceItem(this.marketplaceListing, {super.key});

  @override
  State<MarketplaceItem> createState() => _MarketplaceItemState();
}

class _MarketplaceItemState extends State<MarketplaceItem> {
  late VideoPlayerController _hoverVideoController;

  @override
  void initState() {
    _hoverVideoController = VideoPlayerController.asset(
        'videos/${widget.marketplaceListing.name}_animation.mp4'
    )
      ..initialize().then((_) {
        setState(() {});
      });
    _hoverVideoController.setLooping(true);
    _hoverVideoController.setVolume(0);
    super.initState();
  }

  @override dispose() {
    _hoverVideoController.dispose();
    super.dispose();
  }

  RxBool isHovered = false.obs;

  void playVideo() {
    isHovered.value = true;
    _hoverVideoController.play();
  }

  @override
  Widget build(BuildContext context) {

    return Obx(() =>
      MouseRegion(
        onHover: (event) => playVideo(),
        onExit: (event) => isHovered.value = false,
        child: InkWell(
          onTap: () {},
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: const [
                CustomBoxShadow(
                  color: Colors.black26,
                  blurRadius: 0,
                  blurStyle: BlurStyle.outer
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Column(
                  children: [
                    Expanded(
                      flex: 85,
                      child: isHovered.value?
                      SizedBox.expand(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: SizedBox(
                            width: _hoverVideoController.value.size.width ?? 0,
                            height: _hoverVideoController.value.size.height ?? 0,
                            child: VideoPlayer(_hoverVideoController),
                          ),
                        ),
                      )
                      : Image.network(
                        widget.marketplaceListing.imageUrl,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      flex: 15,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 65,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  widget.marketplaceListing.name,
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 35,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: MarketplaceRarityTag(widget.marketplaceListing.rarity)
                            )
                          )
                        ]
                      ),
                    )
                  ]
                )
              )
            )
          ),
        ),
      ),
    );
  }
}
