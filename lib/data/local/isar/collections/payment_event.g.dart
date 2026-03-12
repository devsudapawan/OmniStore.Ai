// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_event.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarPaymentEventCollection on Isar {
  IsarCollection<IsarPaymentEvent> get isarPaymentEvents => this.collection();
}

const IsarPaymentEventSchema = CollectionSchema(
  name: r'IsarPaymentEvent',
  id: -5762663720527669411,
  properties: {
    r'amount': PropertySchema(id: 0, name: r'amount', type: IsarType.double),
    r'businessId': PropertySchema(
      id: 1,
      name: r'businessId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'deviceId': PropertySchema(
      id: 3,
      name: r'deviceId',
      type: IsarType.string,
    ),
    r'methodId': PropertySchema(
      id: 4,
      name: r'methodId',
      type: IsarType.string,
    ),
    r'note': PropertySchema(id: 5, name: r'note', type: IsarType.string),
    r'paymentEventId': PropertySchema(
      id: 6,
      name: r'paymentEventId',
      type: IsarType.string,
    ),
    r'syncStatus': PropertySchema(
      id: 7,
      name: r'syncStatus',
      type: IsarType.byte,
      enumMap: _IsarPaymentEventsyncStatusEnumValueMap,
    ),
    r'transactionId': PropertySchema(
      id: 8,
      name: r'transactionId',
      type: IsarType.string,
    ),
  },

  estimateSize: _isarPaymentEventEstimateSize,
  serialize: _isarPaymentEventSerialize,
  deserialize: _isarPaymentEventDeserialize,
  deserializeProp: _isarPaymentEventDeserializeProp,
  idName: r'id',
  indexes: {
    r'paymentEventId': IndexSchema(
      id: 8237537461337084973,
      name: r'paymentEventId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'paymentEventId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'businessId': IndexSchema(
      id: 2228048290814354584,
      name: r'businessId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'businessId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'transactionId': IndexSchema(
      id: 8561542235958051982,
      name: r'transactionId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'transactionId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'methodId': IndexSchema(
      id: 6819300769009312973,
      name: r'methodId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'methodId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'syncStatus': IndexSchema(
      id: 8239539375045684509,
      name: r'syncStatus',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'syncStatus',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _isarPaymentEventGetId,
  getLinks: _isarPaymentEventGetLinks,
  attach: _isarPaymentEventAttach,
  version: '3.3.0',
);

int _isarPaymentEventEstimateSize(
  IsarPaymentEvent object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.businessId.length * 3;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.methodId.length * 3;
  {
    final value = object.note;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.paymentEventId.length * 3;
  bytesCount += 3 + object.transactionId.length * 3;
  return bytesCount;
}

void _isarPaymentEventSerialize(
  IsarPaymentEvent object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amount);
  writer.writeString(offsets[1], object.businessId);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.deviceId);
  writer.writeString(offsets[4], object.methodId);
  writer.writeString(offsets[5], object.note);
  writer.writeString(offsets[6], object.paymentEventId);
  writer.writeByte(offsets[7], object.syncStatus.index);
  writer.writeString(offsets[8], object.transactionId);
}

IsarPaymentEvent _isarPaymentEventDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarPaymentEvent();
  object.amount = reader.readDouble(offsets[0]);
  object.businessId = reader.readString(offsets[1]);
  object.createdAt = reader.readDateTime(offsets[2]);
  object.deviceId = reader.readString(offsets[3]);
  object.id = id;
  object.methodId = reader.readString(offsets[4]);
  object.note = reader.readStringOrNull(offsets[5]);
  object.paymentEventId = reader.readString(offsets[6]);
  object.syncStatus =
      _IsarPaymentEventsyncStatusValueEnumMap[reader.readByteOrNull(
        offsets[7],
      )] ??
      SyncStatus.pending;
  object.transactionId = reader.readString(offsets[8]);
  return object;
}

P _isarPaymentEventDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (_IsarPaymentEventsyncStatusValueEnumMap[reader.readByteOrNull(
                offset,
              )] ??
              SyncStatus.pending)
          as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _IsarPaymentEventsyncStatusEnumValueMap = {
  'pending': 0,
  'synced': 1,
  'failed': 2,
};
const _IsarPaymentEventsyncStatusValueEnumMap = {
  0: SyncStatus.pending,
  1: SyncStatus.synced,
  2: SyncStatus.failed,
};

Id _isarPaymentEventGetId(IsarPaymentEvent object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarPaymentEventGetLinks(IsarPaymentEvent object) {
  return [];
}

void _isarPaymentEventAttach(
  IsarCollection<dynamic> col,
  Id id,
  IsarPaymentEvent object,
) {
  object.id = id;
}

extension IsarPaymentEventByIndex on IsarCollection<IsarPaymentEvent> {
  Future<IsarPaymentEvent?> getByPaymentEventId(String paymentEventId) {
    return getByIndex(r'paymentEventId', [paymentEventId]);
  }

  IsarPaymentEvent? getByPaymentEventIdSync(String paymentEventId) {
    return getByIndexSync(r'paymentEventId', [paymentEventId]);
  }

  Future<bool> deleteByPaymentEventId(String paymentEventId) {
    return deleteByIndex(r'paymentEventId', [paymentEventId]);
  }

  bool deleteByPaymentEventIdSync(String paymentEventId) {
    return deleteByIndexSync(r'paymentEventId', [paymentEventId]);
  }

  Future<List<IsarPaymentEvent?>> getAllByPaymentEventId(
    List<String> paymentEventIdValues,
  ) {
    final values = paymentEventIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'paymentEventId', values);
  }

  List<IsarPaymentEvent?> getAllByPaymentEventIdSync(
    List<String> paymentEventIdValues,
  ) {
    final values = paymentEventIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'paymentEventId', values);
  }

  Future<int> deleteAllByPaymentEventId(List<String> paymentEventIdValues) {
    final values = paymentEventIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'paymentEventId', values);
  }

  int deleteAllByPaymentEventIdSync(List<String> paymentEventIdValues) {
    final values = paymentEventIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'paymentEventId', values);
  }

  Future<Id> putByPaymentEventId(IsarPaymentEvent object) {
    return putByIndex(r'paymentEventId', object);
  }

  Id putByPaymentEventIdSync(IsarPaymentEvent object, {bool saveLinks = true}) {
    return putByIndexSync(r'paymentEventId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPaymentEventId(List<IsarPaymentEvent> objects) {
    return putAllByIndex(r'paymentEventId', objects);
  }

  List<Id> putAllByPaymentEventIdSync(
    List<IsarPaymentEvent> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'paymentEventId', objects, saveLinks: saveLinks);
  }
}

extension IsarPaymentEventQueryWhereSort
    on QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QWhere> {
  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterWhere>
  anySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'syncStatus'),
      );
    });
  }
}

extension IsarPaymentEventQueryWhere
    on QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QWhereClause> {
  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterWhereClause>
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterWhereClause>
  paymentEventIdEqualTo(String paymentEventId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'paymentEventId',
          value: [paymentEventId],
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterWhereClause>
  paymentEventIdNotEqualTo(String paymentEventId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'paymentEventId',
                lower: [],
                upper: [paymentEventId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'paymentEventId',
                lower: [paymentEventId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'paymentEventId',
                lower: [paymentEventId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'paymentEventId',
                lower: [],
                upper: [paymentEventId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterWhereClause>
  businessIdEqualTo(String businessId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'businessId', value: [businessId]),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterWhereClause>
  businessIdNotEqualTo(String businessId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'businessId',
                lower: [],
                upper: [businessId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'businessId',
                lower: [businessId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'businessId',
                lower: [businessId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'businessId',
                lower: [],
                upper: [businessId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterWhereClause>
  transactionIdEqualTo(String transactionId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'transactionId',
          value: [transactionId],
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterWhereClause>
  transactionIdNotEqualTo(String transactionId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'transactionId',
                lower: [],
                upper: [transactionId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'transactionId',
                lower: [transactionId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'transactionId',
                lower: [transactionId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'transactionId',
                lower: [],
                upper: [transactionId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterWhereClause>
  methodIdEqualTo(String methodId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'methodId', value: [methodId]),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterWhereClause>
  methodIdNotEqualTo(String methodId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'methodId',
                lower: [],
                upper: [methodId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'methodId',
                lower: [methodId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'methodId',
                lower: [methodId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'methodId',
                lower: [],
                upper: [methodId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterWhereClause>
  syncStatusEqualTo(SyncStatus syncStatus) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'syncStatus', value: [syncStatus]),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterWhereClause>
  syncStatusNotEqualTo(SyncStatus syncStatus) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'syncStatus',
                lower: [],
                upper: [syncStatus],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'syncStatus',
                lower: [syncStatus],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'syncStatus',
                lower: [syncStatus],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'syncStatus',
                lower: [],
                upper: [syncStatus],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterWhereClause>
  syncStatusGreaterThan(SyncStatus syncStatus, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'syncStatus',
          lower: [syncStatus],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterWhereClause>
  syncStatusLessThan(SyncStatus syncStatus, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'syncStatus',
          lower: [],
          upper: [syncStatus],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterWhereClause>
  syncStatusBetween(
    SyncStatus lowerSyncStatus,
    SyncStatus upperSyncStatus, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'syncStatus',
          lower: [lowerSyncStatus],
          includeLower: includeLower,
          upper: [upperSyncStatus],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension IsarPaymentEventQueryFilter
    on QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QFilterCondition> {
  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  amountEqualTo(double value, {double epsilon = Query.epsilon}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'amount',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  amountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'amount',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  amountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'amount',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  amountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'amount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  businessIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'businessId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  businessIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'businessId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  businessIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'businessId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  businessIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'businessId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  businessIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'businessId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  businessIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'businessId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  businessIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'businessId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  businessIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'businessId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  businessIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'businessId', value: ''),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  businessIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'businessId', value: ''),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  createdAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  createdAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  deviceIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'deviceId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  deviceIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'deviceId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  deviceIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'deviceId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  deviceIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'deviceId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  deviceIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'deviceId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  deviceIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'deviceId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  deviceIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'deviceId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  deviceIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'deviceId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'deviceId', value: ''),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'deviceId', value: ''),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  methodIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'methodId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  methodIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'methodId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  methodIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'methodId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  methodIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'methodId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  methodIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'methodId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  methodIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'methodId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  methodIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'methodId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  methodIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'methodId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  methodIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'methodId', value: ''),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  methodIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'methodId', value: ''),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  noteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'note'),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  noteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'note'),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  noteEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  noteGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  noteLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  noteBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'note',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  noteStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  noteEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  noteContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'note',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  noteMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'note',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  noteIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'note', value: ''),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  noteIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'note', value: ''),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  paymentEventIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'paymentEventId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  paymentEventIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'paymentEventId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  paymentEventIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'paymentEventId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  paymentEventIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'paymentEventId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  paymentEventIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'paymentEventId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  paymentEventIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'paymentEventId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  paymentEventIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'paymentEventId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  paymentEventIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'paymentEventId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  paymentEventIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'paymentEventId', value: ''),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  paymentEventIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'paymentEventId', value: ''),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  syncStatusEqualTo(SyncStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncStatus', value: value),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  syncStatusGreaterThan(SyncStatus value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'syncStatus',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  syncStatusLessThan(SyncStatus value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'syncStatus',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  syncStatusBetween(
    SyncStatus lower,
    SyncStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'syncStatus',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  transactionIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'transactionId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  transactionIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'transactionId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  transactionIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'transactionId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  transactionIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'transactionId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  transactionIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'transactionId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  transactionIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'transactionId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  transactionIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'transactionId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  transactionIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'transactionId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  transactionIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'transactionId', value: ''),
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterFilterCondition>
  transactionIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'transactionId', value: ''),
      );
    });
  }
}

extension IsarPaymentEventQueryObject
    on QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QFilterCondition> {}

extension IsarPaymentEventQueryLinks
    on QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QFilterCondition> {}

extension IsarPaymentEventQuerySortBy
    on QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QSortBy> {
  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  sortByBusinessId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessId', Sort.asc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  sortByBusinessIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessId', Sort.desc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  sortByMethodId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'methodId', Sort.asc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  sortByMethodIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'methodId', Sort.desc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy> sortByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  sortByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  sortByPaymentEventId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentEventId', Sort.asc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  sortByPaymentEventIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentEventId', Sort.desc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  sortByTransactionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.asc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  sortByTransactionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.desc);
    });
  }
}

extension IsarPaymentEventQuerySortThenBy
    on QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QSortThenBy> {
  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.asc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'amount', Sort.desc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  thenByBusinessId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessId', Sort.asc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  thenByBusinessIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessId', Sort.desc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  thenByMethodId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'methodId', Sort.asc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  thenByMethodIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'methodId', Sort.desc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy> thenByNote() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.asc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  thenByNoteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'note', Sort.desc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  thenByPaymentEventId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentEventId', Sort.asc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  thenByPaymentEventIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paymentEventId', Sort.desc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  thenByTransactionId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.asc);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QAfterSortBy>
  thenByTransactionIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionId', Sort.desc);
    });
  }
}

extension IsarPaymentEventQueryWhereDistinct
    on QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QDistinct> {
  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QDistinct>
  distinctByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'amount');
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QDistinct>
  distinctByBusinessId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'businessId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QDistinct>
  distinctByDeviceId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QDistinct>
  distinctByMethodId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'methodId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QDistinct> distinctByNote({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'note', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QDistinct>
  distinctByPaymentEventId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'paymentEventId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QDistinct>
  distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }

  QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QDistinct>
  distinctByTransactionId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'transactionId',
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension IsarPaymentEventQueryProperty
    on QueryBuilder<IsarPaymentEvent, IsarPaymentEvent, QQueryProperty> {
  QueryBuilder<IsarPaymentEvent, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarPaymentEvent, double, QQueryOperations> amountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'amount');
    });
  }

  QueryBuilder<IsarPaymentEvent, String, QQueryOperations>
  businessIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'businessId');
    });
  }

  QueryBuilder<IsarPaymentEvent, DateTime, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<IsarPaymentEvent, String, QQueryOperations> deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<IsarPaymentEvent, String, QQueryOperations> methodIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'methodId');
    });
  }

  QueryBuilder<IsarPaymentEvent, String?, QQueryOperations> noteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'note');
    });
  }

  QueryBuilder<IsarPaymentEvent, String, QQueryOperations>
  paymentEventIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paymentEventId');
    });
  }

  QueryBuilder<IsarPaymentEvent, SyncStatus, QQueryOperations>
  syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<IsarPaymentEvent, String, QQueryOperations>
  transactionIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionId');
    });
  }
}
