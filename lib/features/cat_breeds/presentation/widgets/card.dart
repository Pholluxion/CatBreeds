import 'package:flutter/widgets.dart';

import 'package:go_router/go_router.dart';

import 'package:cat_breed/core/core.dart';
import 'package:cat_breed/features/cat_breeds/domain/domain.dart';
import 'package:cat_breed/features/cat_breeds/routes.dart';

const whiteColor = Color(0xFFFFFFFF);

class UICard extends StatefulWidget {
  const UICard({required this.breed, super.key});
  final CatBreedEntity breed;

  @override
  State<UICard> createState() => _UICardState();
}

class _UICardState extends State<UICard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () =>
            context.pushNamed(CatBreedsRoutes.detail.name, extra: widget.breed),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color.fromRGBO(0, 0, 0, 0.1)),
          ),
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
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(200, 0, 0, 0),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                  ),
                  child: UIListTile(
                    title: Text(
                      widget.breed.name,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: whiteColor,
                      ),
                    ),
                    trailingIcon: const Text(
                      'Details',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(200, 0, 0, 0),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Origin',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: whiteColor,
                              ),
                            ),
                            Text(
                              widget.breed.origin,
                              style: const TextStyle(
                                fontSize: 24.0,
                                color: whiteColor,
                                fontWeight: FontWeight.bold,
                              ),
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
                              style: TextStyle(
                                fontSize: 14.0,
                                color: whiteColor,
                              ),
                            ),
                            Text(
                              '${widget.breed.intelligence}/5',
                              style: const TextStyle(
                                fontSize: 24.0,
                                color: whiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
