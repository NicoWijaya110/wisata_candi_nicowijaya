import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wisata_candi_nicowijaya/models/candi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailScreen extends StatefulWidget {
  final Candi candi;

  const DetailScreen({super.key, required this.candi});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isFavorite = false;
  bool isSignedIn = false;

  Future<void>_toggleFavorite() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    //Memeriksa apakah pengguna sudah sign in
    if(!isSignedIn){
      //jika belum sign in, arahkan ke SignInScream
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //detail header
            Stack(
              children: [
                //padding image
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      widget.candi.imageAsset,
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                //padding back button
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 32,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[100]?.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                        )),
                  ),
                )
              ],
            ),
            //detail info
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  // info atas(nama candi dan tombol favorit)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.candi.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.favorite_border))
                    ],
                  ),
                  // info tengah (lokasi, dibangun, tipe)
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.place, color: Colors.red),
                      SizedBox(width: 8),
                      SizedBox(
                        width: 70,
                        child: Text('Lokasi', style: TextStyle(
                            fontWeight: FontWeight.bold),),),
                      Text(': ${widget.candi.location}'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.calendar_month, color: Colors.blue),
                      SizedBox(width: 8),
                      SizedBox(width: 70,
                          child: Text('Dibangun', style: TextStyle(
                              fontWeight: FontWeight.bold))),
                      Text(': ${widget.candi.built}'),
                    ],),
                  Row(children: [
                    Icon(Icons.house, color: Colors.green),
                    SizedBox(width:8),
                    SizedBox(width:70,
                        child: Text('Tipe', style: TextStyle(
                            fontWeight: FontWeight.bold))),
                    Text(': ${widget.candi.type}'),
                  ],
                  ),
                  SizedBox(height: 16),
                  Divider(color: Colors.deepPurple.shade100),
                  SizedBox(height: 16),
                  // info bawah (deskripsi)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 70,
                          child: Text(
                            'Deskripsi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          )
                      ),
                      SizedBox(height: 16),
                      Text('${widget.candi.description}',textAlign: TextAlign.justify),
                    ],
                  )
                ],
              ),
            ),
            // DetailGallery
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(color: Colors.deepPurple.shade100,),
                  Text('Galeri', style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.candi.imageUrls.length,
                      itemBuilder: (context, index){
                        return Padding(padding: EdgeInsets.only(right:8),
                          // bingkai
                          child: GestureDetector(
                            onTap: (){},
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.deepPurple.shade100,
                                    width: 2,
                                  )
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl: widget.candi.imageUrls[index],
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                  placeholder: (context,url) => Container(
                                    width: 120,
                                    height: 120,
                                    color: Colors.deepPurple[50],
                                  ),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 4,),
                  Text('Tap untuk memperbesar',style: TextStyle(
                    fontSize: 12, color: Colors.black54,
                  ),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}