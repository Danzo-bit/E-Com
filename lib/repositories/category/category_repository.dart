import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app/repositories/category/base_category_repository.dart';

import '../../models/category_model.dart';

class CategoryRepository extends BaseCategoryRepository {
  final FirebaseFirestore _firebaseFirestore;

  CategoryRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Category>> getAllCategories() {
    return _firebaseFirestore.collection('category').snapshots().map((snapshot){
      return snapshot.docs.map((doc) => Category.fromSnapshot(doc)).toList();
    });
  }
}
