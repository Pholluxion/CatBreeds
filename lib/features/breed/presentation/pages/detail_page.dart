import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:cat_breed/core/core.dart';
import 'package:cat_breed/features/features.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.breed});

  final Breed breed;

  @override
  Widget build(BuildContext context) {
    return UIScaffold(
      header: Text(breed.name),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<PictureBloc, PictureState>(
                builder: (context, state) {
                  if (state.imageUrls.containsKey(breed.imageRef)) {
                    return UINetworkImage(
                      fit: BoxFit.cover,
                      ref: state.imageUrls[breed.imageRef]!.url,
                      width: double.infinity,
                    );
                  } else {
                    return const SizedBox.expand();
                  }
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    UIDataTile(
                      value: Text(
                        breed.name,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(breed.description),
                    const SizedBox(height: 16.0),
                    UIDataTile(title: 'Origin: ', value: Text(breed.origin)),
                    const SizedBox(height: 8.0),
                    UIDataTile(
                      title: 'Weight: ',
                      value: Text('${breed.weight.metric} kg'),
                    ),
                    const SizedBox(height: 8.0),
                    UIDataTile(
                      title: 'Life Span: ',
                      value: Text('${breed.lifeSpan} years'),
                    ),
                    const SizedBox(height: 8.0),
                    UIDataTile(
                      title: 'Child Friendly: ',
                      value: Text('${breed.childFriendly} / 5'),
                    ),
                    const SizedBox(height: 8.0),
                    UIDataTile(
                      title: 'Affection Level: ',
                      value: Text('${breed.affectionLevel} / 5'),
                    ),
                    const SizedBox(height: 8.0),
                    UIDataTile(
                      title: 'Intelligence: ',
                      value: Text('${breed.intelligence} / 5'),
                    ),
                    const SizedBox(height: 8.0),
                    UIDataTile(
                      title: 'Lap Cat: ',
                      value: Text(breed.isLapCat == 0 ? 'Yes' : 'No'),
                    ),
                    const SizedBox(height: 8.0),
                    UIDataTile(
                      title: 'Wikipedia URL: ',
                      value: GestureDetector(
                        onTap: () {
                          if (breed.wikipediaUrl.isNotEmpty) {
                            launchUrl(Uri.parse(breed.wikipediaUrl));
                          }
                        },
                        child: Text(
                          'Wikipedia',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Text('Temperament', style: const TextStyle(fontSize: 16.0)),
                    const SizedBox(height: 8.0),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: breed.temperament
                          .split(',')
                          .map((tag) => UITag(text: tag.trim()))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
