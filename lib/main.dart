import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MovieApp());
}

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MovieListScreen(),
    );
  }
}

class MovieListScreen extends StatefulWidget {
  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final List<Movie> upcomingMovies = [
    Movie("The Greatest Of All Time", "lib/assets/goat.png", 8.8),
    Movie("Thug Life", "lib/assets/thug.png", 8.6),
    Movie("Vettaiyan", "lib/assets/vet.png", 9.0),
    Movie("INDIAN 2", "lib/assets/indian2.png", 8.9),
    Movie("KANGUVA", "lib/assets/kanguva.png", 9.3),
  ];

  List<Movie> topRatedMovies = [
    Movie(
      "LEO",
      "lib/assets/leo.png",
      8.5,
    ),
    Movie(
      "Pathaan",
      "lib/assets/pathaan.png",
      7.8,
    ),
    Movie(
      "Jawan",
      "lib/assets/jawan.png",
      8.0,
    ),
    Movie(
      "12th FAIL",
      "lib/assets/fail.png",
      7.2,
    ),
    Movie(
      "JAILER",
      "lib/assets/jailer.png",
      7.9,
    ),
    Movie(
      "SALAAR",
      "lib/assets/salaar.png",
      8.3,
    ),
    Movie(
      "KGF",
      "lib/assets/kgf.png",
      8.7,
    ),
    Movie(
      "KGF2",
      "lib/assets/kgf2.png",
      9.0,
    ),
    Movie(
      "KANTARA",
      "lib/assets/kantara.png",
      7.6,
    ),
    Movie(
      "joe",
      "lib/assets/joe.png",
      8.1,
    ),
    Movie(
      "DADA",
      "lib/assets/dada.png",
      7.5,
    ),
  ];

  List<Movie> favorites = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text(
          '🎬 SWIFIX',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Color.fromARGB(255, 224, 147, 119)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Upcoming Movies',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                viewportFraction: 0.4, // Adjust this value for portrait view
                enableInfiniteScroll: true,
                autoPlay: true,
              ),
              items: upcomingMovies.map((movie) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.network(
                        movie.posterPath,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Top Rated Movies',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: topRatedMovies.length,
                itemBuilder: (context, index) {
                  final movie = topRatedMovies[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (!favorites.contains(movie)) {
                            favorites.add(movie);
                          } else {
                            favorites.remove(movie);
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: favorites.contains(movie)
                              ? Colors.amber
                              : Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(2),
                            child: Image.network(
                              movie.posterPath,
                              width: 50,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            movie.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text(
                            'Rating: ${movie.rating.toString()}',
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24.0),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Favorites',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  final movie = favorites[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          favorites.removeAt(index);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(2),
                            child: Image.network(
                              movie.posterPath,
                              width: 50,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            movie.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text(
                            'Rating: ${movie.rating.toString()}',
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                favorites.removeAt(index);
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieListItem extends StatelessWidget {
  final Movie movie;

  MovieListItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        movie.posterPath,
        width: 50,
        height: 100,
        fit: BoxFit.cover,
      ),
      title: Text(movie.title),
      subtitle: Text('Rating: ${movie.rating.toString()}'),
      onTap: () {
        // Handle onTap action
      },
    );
  }
}

class Movie {
  final String title;
  final String posterPath;
  final double rating;

  Movie(this.title, this.posterPath, this.rating);
}
