import 'package:flutter/material.dart';

class CustomeGrid extends StatefulWidget {
  const CustomeGrid({super.key});

  @override
  State<CustomeGrid> createState() => _CustomeGridState();
}

class _CustomeGridState extends State<CustomeGrid> {
  List<Map<String, dynamic>> listMovie = [
    {
      "judul": "Ciao Alberto",
      "gambar": "movie1.jpg",
      "harga": 45000
    },
    {
      "judul": "The Simpson",
      "gambar": "movie2.jpg",
      "harga": 35000
    },
    {
      "judul": "Jungle Cruise",
      "gambar": "movie3.jpg",
      "harga": 50000
    },
    {
      "judul": "Home Alone",
      "gambar": "movie4.jpeg",
      "harga": 45000
    },
    {
      "judul": "Korean Action",
      "gambar": "movie5.jpeg",
      "harga": 35000
    },
    {
      "judul": "A Monster Calls",
      "gambar": "movie6.jpeg",
      "harga": 45000
    },
    {
      "judul": "Encanto",
      "gambar": "movie7.jpeg",
      "harga": 45000
    },
    {
      "judul": "Coco",
      "gambar": "movie8.jpg",
      "harga": 35000
    },
    {
      "judul": "Turning red",
      "gambar": "movie9.jpeg",
      "harga": 50000
    },
    {
      "judul": "Avatar The Way of Water",
      "gambar": "movie10.jpg",
      "harga": 45000
    },
    {
      "judul": "Mencuri Raden Saleh",
      "gambar": "movie11.jpg",
      "harga": 35000
    },
    {
      "judul": "Avengers Infinity War",
      "gambar": "movie12.jpg",
      "harga": 45000
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custome Grid"),
        backgroundColor: Colors.green,
      ),

      body: GridView.builder(
        itemCount: listMovie.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_)=> DetailGrid(listMovie[index])));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridTile(
                  footer: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: Colors.black)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${listMovie[index] ["judul"]}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text("Rp. ${listMovie[index]["harga"]}")
                      ],
                    ),
                  ),
                  child: Image.asset("gambar/${listMovie[index]["gambar"]}"),
                ),
              ),
            );
          }),
    );
  }
}

class DetailGrid extends StatelessWidget {
  final Map<String, dynamic> detailMovie;

  const DetailGrid(this.detailMovie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(detailMovie["judul"]),
        ),
        body: Padding(
            padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "gambar/${detailMovie["gambar"]}",
                  width: 200,
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Judul: ${detailMovie["judul"]}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  "Harga: Rp. ${detailMovie["harga"]}",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
       );
  }
}

