import 'package:flutter/widgets.dart';

import 'package:go_router/go_router.dart';

import 'package:cat_breed/core/core.dart';
import 'package:cat_breed/features/cat_breeds/domain/domain.dart';
import 'package:cat_breed/features/cat_breeds/routes.dart';

class UICard extends StatefulWidget {
  const UICard({required this.breed, super.key});
  final CatBreedEntity breed;

  String get cardKey => 'breed_card_${breed.id}';
  String get nameKey => 'breed_name_${breed.id}';
  String get detailsKey => 'breed_details_${breed.id}';
  String get originKey => 'breed_origin_${breed.id}';
  String get intelligenceKey => 'breed_intelligence_${breed.id}';

  @override
  State<UICard> createState() => _UICardState();
}

class _UICardState extends State<UICard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.paddingSM,
      child: GestureDetector(
        key: Key(widget.cardKey),
        onTap: () =>
            context.pushNamed(CatBreedsRoutes.detail.name, extra: widget.breed),
        child: Container(
          decoration: AppDecorations.cardDecoration,
          child: Stack(
            children: [
              UINetworkImage(
                fit: BoxFit.cover,
                ref: widget.breed.picture.url,
                width: double.infinity,
                height: 400,
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Semantics(
                  label: 'breed_card_header',
                  child: Container(
                    padding: AppSpacing.paddingMD,
                    decoration: AppDecorations.overlayTopDecoration,
                    child: UIListTile(
                      title: Text(
                        widget.breed.name,
                        key: Key(widget.nameKey),
                        style: AppTextStyles.headlineMediumOnDark,
                      ),
                      trailingIcon: Text(
                        'Details',
                        key: Key(widget.detailsKey),
                        style: AppTextStyles.bodyLargeOnDark,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Semantics(
                  label: 'breed_card_footer',
                  child: Container(
                    padding: AppSpacing.paddingMD,
                    decoration: AppDecorations.overlayBottomDecoration,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Origin',
                                style: AppTextStyles.bodySmallOnDark,
                              ),
                              Text(
                                widget.breed.origin,
                                key: Key(widget.originKey),
                                style: AppTextStyles.headlineMediumOnDark,
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Intelligence',
                                style: AppTextStyles.bodySmallOnDark,
                              ),
                              Text(
                                '${widget.breed.intelligence}/5',
                                key: Key(widget.intelligenceKey),
                                style: AppTextStyles.headlineMediumOnDark,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
