//t2 Core Packages Imports
//t2 Dependancies Imports
//t3 Services
//t3 Models
//t1 Exports

//
import '../../../core/Services/Error Handling/error_handling.service.dart';
import '../../../core/Services/Id Generating/id_generating.service.dart';
import '../../Services/Error Handling/errors/exceptions.dart';
import '../src/condition_model.dart';
import 'fbfirestore.provider.dart';

class FirestoreRepo<T> {
  final String collectionId;

  FirestoreRepo(this.collectionId);

  //------------------------------------------------------
  // Provider.
  //------------------------------------------------------
  //
  final FirestoreProvider _firestore = FirestoreProvider();

  //
  //------------------------------------------------------
  //
  ////////////////////////////////////////////////////////////
  //SECTION Create
  ////////////////////////////////////////////////////////////
  //t2 Single
  /// Creates an item in the data storage and returns the id attached to it.
  Future<String> createSingle(
    T item, {
    String? itemId,
    bool checkId = true,
    bool generateId = false,
    List<String>? keyChecks,
  }) async {
    //
    String id = (generateId || itemId == null) ? await _generateId() : itemId;

    if (checkId && !generateId) {
      if (await idExists(id)) {
        if (generateId) {
          id = await _generateId();
        } else {
          throw ServerException(
            message: "ID '$id' already exists and generation is off.",
          );
        }
      }
    }
    try {
      final rawList = await _firestore.createSingle(collectionId, id, {
        'id': id,
        'dateCreated': DateTime.now(),
        ...fromModel(item),
      }, uniques: keyChecks);
      return rawList;
    } catch (e, s) {
      ErrorHandlingService.handle(
        e,
        s,
        location: "Repo/createSingle/firestore",
      );
      rethrow;
    }
  }

  //t2 Multiple
  /// Creates multiple items in the data storage and returns the id list attached to them.
  Future<List<String>> createMultiple(
    List<T> items, {
    List<String>? ids,
    bool checkId = true,
    bool generateId = false,
    bool batched = false,
    List<String>? keyChecks,
  }) async {
    //
    assert(ids == null || ids.length == items.length);
    //

    try {
      List<Map<String, dynamic>> itemsMap = [];
      for (var i = 0; i < items.length; i++) {
        // generate id
        String id = (generateId || ids == null) ? await _generateId() : ids[i];
        // check
        if (checkId && !generateId) {
          if (await idExists(id)) {
            if (generateId) {
              id = await _generateId();
            } else {
              throw ServerException(
                message: "ID '$id' already exists and generation is off.",
              );
            }
          }
        }
        itemsMap.add({
          'id': id,
          'dateCreated': DateTime.now(),
          ...fromModel(items[i]),
        });
      }
      List<String> rawList = await _firestore.createMultiple(
        collectionId,
        itemsMap.map((e) => e['id'].toString()).toList(),
        itemsMap,
        batched: batched,
        uniques: keyChecks,
      );
      return rawList;
    } catch (e, s) {
      ErrorHandlingService.handle(
        e,
        s,
        location: "Repo/createMultiple/firestore",
      );
      rethrow;
    }
  }

  //!SECTION Create
  //
  //
  ////////////////////////////////////////////////////////////
  //SECTION Read
  ////////////////////////////////////////////////////////////
  //t2 Single
  /// Read a single item from the data storage
  Future<T> readSingle(String id) async {
    //
    try {
      Map<String, dynamic> rawList = await _firestore.readSingle(
        collectionId,
        id,
      );
      return toModel(rawList);
    } catch (e, s) {
      ErrorHandlingService.handle(e, s, location: "Repo/readSingle/firestore");
      rethrow;
    }
  }

  //t2 All
  /// Read all items from the data storage.
  Future<List<T>> readAll({String? orderedBy, int? limit}) async {
    try {
      final rawList = await _firestore.readAll(
        collectionId,
        orderedBy: orderedBy,
        limit: limit,
      );

      return rawList.whereType<Map<String, dynamic>>().map(toModel).toList();
    } catch (e, s) {
      ErrorHandlingService.handle(e, s, location: "Repo/readAll/firestore");
      rethrow;
    }
  }

  //t2 Where
  /// Read all items where satisfies a condition from the data storage.
  Future<List<T>> readAllWhere(
    List<QueryCondition> conditions, {
    String? orderedBy,
    int? limit,
  }) async {
    //

    try {
      final rawList = await _firestore.readWhere(
        collectionId,
        conditions,
        orderedBy: orderedBy,
        limit: limit,
      );
      return rawList.map((e) => toModel(e)).toList();
    } catch (e, s) {
      ErrorHandlingService.handle(
        e,
        s,
        location: "Repo/readAllWhere/firestore",
      );
      rethrow;
    }
  }

  //!SECTION Read
  //
  //
  ////////////////////////////////////////////////////////////
  //SECTION Update
  ////////////////////////////////////////////////////////////
  //t2 Single
  /// Update an item and returns it's id from the data storage.
  Future<String> updateSingle(String id, T item) async {
    //
    try {
      String r = await _firestore.updateSingle(
        collectionId,
        id,
        fromModel(item),
      );
      return r;
    } catch (e, s) {
      ErrorHandlingService.handle(
        e,
        s,
        location: "Repo/updateSingle/firestore",
      );
      rethrow;
    }
  }

  //t2 Multiple
  /// Update all items supplied from the data storage.
  Future<List<String>> updateMultiple(
    List<String> ids,
    List<T> items, {
    bool batched = false,
  }) async {
    //
    try {
      List<String> rawList = await _firestore.updateMultiple(
        collectionId,
        ids,
        items.map((e) => fromModel(e)).toList(),
        batched: batched,
      );
      return rawList;
    } catch (e, s) {
      ErrorHandlingService.handle(
        e,
        s,
        location: "Repo/updateMultiple/firestore",
      );
      rethrow;
    }
  }

  //!SECTION Update
  //
  //
  ////////////////////////////////////////////////////////////
  //SECTION Delete
  ////////////////////////////////////////////////////////////
  //t2 Single
  /// Delete an item from the data storage.
  Future<void> deleteSingle(String id) async {
    //
    try {
      await _firestore.deleteSingle(collectionId, id);
    } catch (e, s) {
      ErrorHandlingService.handle(
        e,
        s,
        location: "Repo/deleteSingle/firestore",
      );
    }
  }

  //t2 Multible
  /// Delete multible items from the data storage.
  Future<void> deleteMultiple(List<String> ids, {bool batched = false}) async {
    //
    try {
      await _firestore.deleteMultible(collectionId, ids, batched: batched);
    } catch (e, s) {
      ErrorHandlingService.handle(
        e,
        s,
        location: "Repo/deleteMultiple/firestore",
      );
    }
  }

  //t2 Clear
  /// Delete all items from the data storage.
  Future<void> clear({bool batched = false}) async {
    //
    try {
      await _firestore.clear(collectionId, batched: batched);
    } catch (e, s) {
      ErrorHandlingService.handle(e, s, location: "Repo/clear/firestore");
    }
  }

  //!SECTION Delete
  //
  //
  ////////////////////////////////////////////////////////////
  //SECTION Stream
  ////////////////////////////////////////////////////////////
  //t2 Single
  /// Stream single item from the data storage.
  Stream<T> streamSingle(String id) {
    try {
      return _firestore
          .streamSingle(collectionId, id)
          .where((m) => m != null)
          .map((m) => toModel(m!));
    } catch (e, s) {
      ErrorHandlingService.handle(
        e,
        s,
        location: "Repo/streamSingle/firestore",
      );
      return const Stream.empty();
    }
  }

  //t2 All
  /// Stream all items from the data storage.
  Stream<List<T?>?> streamAll({String? orderedBy, int? limit}) {
    //
    try {
      return _firestore
          .streamAll(collectionId, orderedBy: orderedBy, limit: limit)
          .asyncMap((m) => m?.map((e) => toModel(e)).toList());
    } catch (e, s) {
      ErrorHandlingService.handle(e, s, location: "Repo/streamAll/firestore");
      return const Stream.empty();
    }
  }

  //t2 Where
  /// Stream all items where satisfies conditions from the data storage.
  Stream<List<T?>?> streamAllWhere(
    List<QueryCondition> conditions, {
    String? orderedBy,
    int? limit,
  }) {
    //
    try {
      return _firestore
          .streamWhere(
            collectionId,
            conditions,
            orderedBy: orderedBy,
            limit: limit,
          )
          .asyncMap((m) => m?.map((e) => toModel(e)).toList());
    } catch (e, s) {
      ErrorHandlingService.handle(e, s, location: "Repo/streamAll/firestore");
      return const Stream.empty();
    }
  }

  //!SECTION Stream
  //
  //
  ////////////////////////////////////////////////////////////
  //SECTION Helper methods
  ////////////////////////////////////////////////////////////
  //t2 Id Exists
  /// Check if an item with the same id exists.
  Future<bool> idExists(String id) async {
    //
    try {
      return await _firestore.exists(collectionId, id);
    } catch (e, s) {
      ErrorHandlingService.handle(
        e,
        s,
        location: "UserRepo/idExists/Firestore",
      );
      return true;
    }
  }

  //t2 Generate Id
  /// Generate Id for the item.
  Future<String> _generateId({String format = '{16{w}}'}) async {
    late String id;
    try {
      id = IdGeneratingService.generate(pattern: format);
      if (await idExists(id)) {
        id = IdGeneratingService.generate(pattern: format);
      }
    } catch (e, s) {
      ErrorHandlingService.handle(e, s, location: "UserRepo/_generateId");
    }
    return id;
  }

  //t2 To model
  /// Convert map to model.
  T toModel(Map<String, dynamic> item) {
    return item as T;
  }

  //t2 From model
  /// Convert model to map.
  Map<String, dynamic> fromModel(T item) {
    return {};
  }

  //!SECTION Helper methods
  //
  //
}
