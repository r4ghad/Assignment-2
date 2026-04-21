import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment-2',
      home: ProductListScreen(),
      locale: Locale('ar', 'SA'),
      supportedLocales: [Locale('ar', 'SA')],
      debugShowCheckedModeBanner: false, 
    );
  }
}

class ProductListScreen extends StatelessWidget {
  final List<String> books = [
    'فوضى الحواس - أحلام مستغانمي',
    'رحلة العشرين عاماً - أحمد جابر',
    'احتاج قلباً',
    'دائماً أنت بقلبي',
    'ليطمئن قلبي',
    'الليالي البيضاء',
    'الحياة بنكهة لا',
    'كبرت ونسيت أن أنسى',
    'رسائل غسان كنفاني إلى غادة السمان',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Color(0xFFF5F0E8),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40, bottom: 20),
              child: Text(
                'الروايات',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4A4A4A),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        books[index],
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF4A4A4A),
                        ),
                        textAlign: TextAlign.right,
                      ),
                      trailing: Icon(Icons.arrow_back_ios, size: 14, color: Color(0xFFB0A28A)),
                      onTap: () async {
                        final result = await Navigator.push<String>(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailScreen(
                              productName: books[index],
                            ),
                          ),
                        );

                        if (result != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Container(
                                width: double.infinity,
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Text(
                                    result,
                                    style: TextStyle(fontSize: 13),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              duration: Duration(seconds: 2),
                              backgroundColor: Color(0xFF8B7D6B),
                              behavior: SnackBarBehavior.floating,
                              width: 280,
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          );
                        }
                      },
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

class ProductDetailScreen extends StatelessWidget {
  final String productName;

  const ProductDetailScreen({
    super.key,
    required this.productName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Color(0xFFF9F6F0),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    productName,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF4A4A4A),
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'تمت الإضافة إلى المفضلة');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFB0A28A),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text('أضف إلى المفضلة'),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'رجوع',
                    style: TextStyle(color: Color(0xFFB0A28A)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}