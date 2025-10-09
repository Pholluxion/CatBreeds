import 'package:flutter/widgets.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:cat_breed/core/core.dart';
import 'package:cat_breed/features/cat_breeds/domain/domain.dart';
import 'package:cat_breed/features/cat_breeds/presentation/presentation.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({required this.breed, super.key});

  final CatBreedEntity breed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return UIScaffold(
      header: Text(breed.name),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: UINetworkImage(
                fit: BoxFit.cover,
                ref: breed.picture.url,
                width: double.infinity,
                height: size.height * 0.5,
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
                      title: 'Adaptability: ',
                      value: Text('${breed.adaptability} / 5'),
                    ),
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
                      title: 'Energy Level: ',
                      value: Text('${breed.energyLevel} / 5'),
                    ),
                    const SizedBox(height: 8.0),
                    UIDataTile(
                      title: 'Dog Friendly: ',
                      value: Text(breed.dogFriendly == 0 ? 'Yes' : 'No'),
                    ),
                    const SizedBox(height: 8.0),
                    UIDataTile(
                      title: 'Hypoallergenic: ',
                      value: Text(breed.hypoallergenic == 0 ? 'Yes' : 'No'),
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
                        child: const Text(
                          'Wikipedia',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Temperament',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
