import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FilmsNotifier extends StateNotifier<List<Film>> {
  FilmsNotifier() : super(allFilm);

  void update(Film film, bool isFavorite) {
    state = state
        .map(
          (thisFilm) => thisFilm.id == film.id
              ? thisFilm.copy(isFavorite: isFavorite)
              : thisFilm,
        )
        .toList();
  }
}

final allFilmsProvider = StateNotifierProvider<FilmsNotifier, List<Film>>(
  (_) => FilmsNotifier(),
);

final favoriteFilmsProvider = Provider<List<Film>>((ref) {
  final films = ref.watch(allFilmsProvider);
  return films.where((film) => film.isFavorite).toList();
});

final notFavoriteFilmsProvider = Provider<List<Film>>((ref) {
  final films = ref.watch(allFilmsProvider);
  return films.where((film) => !film.isFavorite).toList();
});

final favoriteStatusProvider = StateProvider<FavoriteStatus>(
  (_) => FavoriteStatus.all,
);

class Example6 extends StatelessWidget {
  const Example6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Films')),
      body: Column(
        children: [
          const FilterWidget(),
          Consumer(
            builder: (context, ref, child) {
              final status = ref.watch(favoriteStatusProvider);
              final provider = switch (status) {
                FavoriteStatus.all => allFilmsProvider,
                FavoriteStatus.favorite => favoriteFilmsProvider,
                FavoriteStatus.notFavorite => notFavoriteFilmsProvider,
              };
              return FilmWidget(provider: provider);
            },
          ),
        ],
      ),
    );
  }
}

class FilmWidget extends ConsumerWidget {

  final ProviderListenable<List<Film>> provider;

  const FilmWidget({required this.provider, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final films = ref.watch(provider);

    return Expanded(
      child: ListView.builder(
        itemCount: films.length,
        itemBuilder: (context, index) {
          final film = films[index];
          return ListTile(
            title: Text(film.title),
            subtitle: Text(film.description),
            trailing: IconButton(
              icon: Icon(
                film.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: film.isFavorite ? Colors.red : null,
              ),
              onPressed: () {
                ref
                    .read(allFilmsProvider.notifier)
                    .update(film, !film.isFavorite);
              },
            ),
          );
        },
      ),
    );
  }
}

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return DropdownButton(
          value: ref.watch(favoriteStatusProvider),
          items: FavoriteStatus.values
              .map(
                (fs) => DropdownMenuItem(
                  value: fs,
                  child: Text(fs.toString().split('.').last),
                ),
              )
              .toList(),
          onChanged: (fs) {
            if (fs != null) {
              ref.read(favoriteStatusProvider.notifier).state = fs;
            }
          },
        );
      },
    );
  }
}

enum FavoriteStatus {
  all,
  favorite,
  notFavorite,
}

const allFilm = [
  Film(
    id: '1',
    title: 'Inception',
    description: 'A mind-bending thriller about dreams within dreams.',
    isFavorite: false,
  ),
  Film(
    id: '2',
    title: 'The Matrix',
    description: 'A hacker discovers the true nature of reality.',
    isFavorite: false,
  ),
  Film(
    id: '3',
    title: 'Interstellar',
    description: 'A journey through space and time to save humanity.',
    isFavorite: false,
  ),
  Film(
    id: '4',
    title: 'The Godfather',
    description: 'A crime saga about a powerful Italian-American family.',
    isFavorite: false,
  ),
];

@immutable
class Film {
  final String id;
  final String title;
  final String description;
  final bool isFavorite;

  const Film({
    required this.id,
    required this.title,
    required this.description,
    required this.isFavorite,
  });

  Film copy({required bool isFavorite}) => Film(
        id: id,
        title: title,
        description: description,
        isFavorite: isFavorite,
      );

  @override
  String toString() =>
      'Film(id: $id, title: $title, description: $description, isFavorite: $isFavorite)';

  @override
  bool operator ==(covariant Film other) =>
      id == other.id && isFavorite == other.isFavorite;

  @override
  int get hashCode => Object.hashAll([id, isFavorite]);
}