// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarBusinessCollection on Isar {
  IsarCollection<IsarBusiness> get isarBusiness => this.collection();
}

const IsarBusinessSchema = CollectionSchema(
  name: r'IsarBusiness',
  id: 3355963372350511231,
  properties: {
    r'businessId': PropertySchema(
      id: 0,
      name: r'businessId',
      type: IsarType.string,
    ),
    r'businessName': PropertySchema(
      id: 1,
      name: r'businessName',
      type: IsarType.string,
    ),
    r'businessType': PropertySchema(
      id: 2,
      name: r'businessType',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'creditEnabled': PropertySchema(
      id: 4,
      name: r'creditEnabled',
      type: IsarType.bool,
    ),
    r'currency': PropertySchema(
      id: 5,
      name: r'currency',
      type: IsarType.string,
    ),
    r'defaultUnit': PropertySchema(
      id: 6,
      name: r'defaultUnit',
      type: IsarType.string,
    ),
    r'deviceId': PropertySchema(
      id: 7,
      name: r'deviceId',
      type: IsarType.string,
    ),
    r'ownerId': PropertySchema(id: 8, name: r'ownerId', type: IsarType.string),
    r'syncStatus': PropertySchema(
      id: 9,
      name: r'syncStatus',
      type: IsarType.byte,
      enumMap: _IsarBusinesssyncStatusEnumValueMap,
    ),
    r'updatedAt': PropertySchema(
      id: 10,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _isarBusinessEstimateSize,
  serialize: _isarBusinessSerialize,
  deserialize: _isarBusinessDeserialize,
  deserializeProp: _isarBusinessDeserializeProp,
  idName: r'id',
  indexes: {
    r'businessId': IndexSchema(
      id: 2228048290814354584,
      name: r'businessId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'businessId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'ownerId': IndexSchema(
      id: -7594796109721319539,
      name: r'ownerId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'ownerId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _isarBusinessGetId,
  getLinks: _isarBusinessGetLinks,
  attach: _isarBusinessAttach,
  version: '3.3.0',
);

int _isarBusinessEstimateSize(
  IsarBusiness object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.businessId.length * 3;
  bytesCount += 3 + object.businessName.length * 3;
  bytesCount += 3 + object.businessType.length * 3;
  bytesCount += 3 + object.currency.length * 3;
  bytesCount += 3 + object.defaultUnit.length * 3;
  bytesCount += 3 + object.deviceId.length * 3;
  bytesCount += 3 + object.ownerId.length * 3;
  return bytesCount;
}

void _isarBusinessSerialize(
  IsarBusiness object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.businessId);
  writer.writeString(offsets[1], object.businessName);
  writer.writeString(offsets[2], object.businessType);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeBool(offsets[4], object.creditEnabled);
  writer.writeString(offsets[5], object.currency);
  writer.writeString(offsets[6], object.defaultUnit);
  writer.writeString(offsets[7], object.deviceId);
  writer.writeString(offsets[8], object.ownerId);
  writer.writeByte(offsets[9], object.syncStatus.index);
  writer.writeDateTime(offsets[10], object.updatedAt);
}

IsarBusiness _isarBusinessDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarBusiness();
  object.businessId = reader.readString(offsets[0]);
  object.businessName = reader.readString(offsets[1]);
  object.businessType = reader.readString(offsets[2]);
  object.createdAt = reader.readDateTime(offsets[3]);
  object.creditEnabled = reader.readBool(offsets[4]);
  object.currency = reader.readString(offsets[5]);
  object.defaultUnit = reader.readString(offsets[6]);
  object.deviceId = reader.readString(offsets[7]);
  object.id = id;
  object.ownerId = reader.readString(offsets[8]);
  object.syncStatus =
      _IsarBusinesssyncStatusValueEnumMap[reader.readByteOrNull(offsets[9])] ??
      SyncStatus.pending;
  object.updatedAt = reader.readDateTime(offsets[10]);
  return object;
}

P _isarBusinessDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (_IsarBusinesssyncStatusValueEnumMap[reader.readByteOrNull(
                offset,
              )] ??
              SyncStatus.pending)
          as P;
    case 10:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _IsarBusinesssyncStatusEnumValueMap = {
  'pending': 0,
  'synced': 1,
  'failed': 2,
};
const _IsarBusinesssyncStatusValueEnumMap = {
  0: SyncStatus.pending,
  1: SyncStatus.synced,
  2: SyncStatus.failed,
};

Id _isarBusinessGetId(IsarBusiness object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarBusinessGetLinks(IsarBusiness object) {
  return [];
}

void _isarBusinessAttach(
  IsarCollection<dynamic> col,
  Id id,
  IsarBusiness object,
) {
  object.id = id;
}

extension IsarBusinessByIndex on IsarCollection<IsarBusiness> {
  Future<IsarBusiness?> getByBusinessId(String businessId) {
    return getByIndex(r'businessId', [businessId]);
  }

  IsarBusiness? getByBusinessIdSync(String businessId) {
    return getByIndexSync(r'businessId', [businessId]);
  }

  Future<bool> deleteByBusinessId(String businessId) {
    return deleteByIndex(r'businessId', [businessId]);
  }

  bool deleteByBusinessIdSync(String businessId) {
    return deleteByIndexSync(r'businessId', [businessId]);
  }

  Future<List<IsarBusiness?>> getAllByBusinessId(
    List<String> businessIdValues,
  ) {
    final values = businessIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'businessId', values);
  }

  List<IsarBusiness?> getAllByBusinessIdSync(List<String> businessIdValues) {
    final values = businessIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'businessId', values);
  }

  Future<int> deleteAllByBusinessId(List<String> businessIdValues) {
    final values = businessIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'businessId', values);
  }

  int deleteAllByBusinessIdSync(List<String> businessIdValues) {
    final values = businessIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'businessId', values);
  }

  Future<Id> putByBusinessId(IsarBusiness object) {
    return putByIndex(r'businessId', object);
  }

  Id putByBusinessIdSync(IsarBusiness object, {bool saveLinks = true}) {
    return putByIndexSync(r'businessId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByBusinessId(List<IsarBusiness> objects) {
    return putAllByIndex(r'businessId', objects);
  }

  List<Id> putAllByBusinessIdSync(
    List<IsarBusiness> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'businessId', objects, saveLinks: saveLinks);
  }
}

extension IsarBusinessQueryWhereSort
    on QueryBuilder<IsarBusiness, IsarBusiness, QWhere> {
  QueryBuilder<IsarBusiness, IsarBusiness, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarBusinessQueryWhere
    on QueryBuilder<IsarBusiness, IsarBusiness, QWhereClause> {
  QueryBuilder<IsarBusiness, IsarBusiness, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
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

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterWhereClause> idBetween(
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

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterWhereClause> businessIdEqualTo(
    String businessId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'businessId', value: [businessId]),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterWhereClause>
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

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterWhereClause> ownerIdEqualTo(
    String ownerId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'ownerId', value: [ownerId]),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterWhereClause> ownerIdNotEqualTo(
    String ownerId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'ownerId',
                lower: [],
                upper: [ownerId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'ownerId',
                lower: [ownerId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'ownerId',
                lower: [ownerId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'ownerId',
                lower: [],
                upper: [ownerId],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension IsarBusinessQueryFilter
    on QueryBuilder<IsarBusiness, IsarBusiness, QFilterCondition> {
  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
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

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
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

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
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

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
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

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
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

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
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

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
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

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
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

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  businessIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'businessId', value: ''),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  businessIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'businessId', value: ''),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  businessNameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'businessName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  businessNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'businessName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  businessNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'businessName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  businessNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'businessName',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  businessNameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'businessName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  businessNameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'businessName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  businessNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'businessName',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  businessNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'businessName',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  businessNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'businessName', value: ''),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  businessNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'businessName', value: ''),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  businessTypeEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'businessType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  businessTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'businessType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  businessTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'businessType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  businessTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'businessType',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  businessTypeStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'businessType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  businessTypeEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'businessType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  businessTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'businessType',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  businessTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'businessType',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  businessTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'businessType', value: ''),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  businessTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'businessType', value: ''),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
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

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
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

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
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

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  creditEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'creditEnabled', value: value),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  currencyEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'currency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  currencyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'currency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  currencyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'currency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  currencyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'currency',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  currencyStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'currency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  currencyEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'currency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  currencyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'currency',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  currencyMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'currency',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  currencyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'currency', value: ''),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  currencyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'currency', value: ''),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  defaultUnitEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'defaultUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  defaultUnitGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'defaultUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  defaultUnitLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'defaultUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  defaultUnitBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'defaultUnit',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  defaultUnitStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'defaultUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  defaultUnitEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'defaultUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  defaultUnitContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'defaultUnit',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  defaultUnitMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'defaultUnit',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  defaultUnitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'defaultUnit', value: ''),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  defaultUnitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'defaultUnit', value: ''),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
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

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
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

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
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

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
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

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
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

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
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

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
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

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
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

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  deviceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'deviceId', value: ''),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  deviceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'deviceId', value: ''),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
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

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
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

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition> idBetween(
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

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  ownerIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'ownerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  ownerIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'ownerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  ownerIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'ownerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  ownerIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'ownerId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  ownerIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'ownerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  ownerIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'ownerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  ownerIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'ownerId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  ownerIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'ownerId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  ownerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'ownerId', value: ''),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  ownerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'ownerId', value: ''),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  syncStatusEqualTo(SyncStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncStatus', value: value),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
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

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
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

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
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

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  updatedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  updatedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterFilterCondition>
  updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'updatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension IsarBusinessQueryObject
    on QueryBuilder<IsarBusiness, IsarBusiness, QFilterCondition> {}

extension IsarBusinessQueryLinks
    on QueryBuilder<IsarBusiness, IsarBusiness, QFilterCondition> {}

extension IsarBusinessQuerySortBy
    on QueryBuilder<IsarBusiness, IsarBusiness, QSortBy> {
  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> sortByBusinessId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessId', Sort.asc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy>
  sortByBusinessIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessId', Sort.desc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> sortByBusinessName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessName', Sort.asc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy>
  sortByBusinessNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessName', Sort.desc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> sortByBusinessType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessType', Sort.asc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy>
  sortByBusinessTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessType', Sort.desc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> sortByCreditEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creditEnabled', Sort.asc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy>
  sortByCreditEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creditEnabled', Sort.desc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> sortByCurrency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.asc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> sortByCurrencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.desc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> sortByDefaultUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultUnit', Sort.asc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy>
  sortByDefaultUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultUnit', Sort.desc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> sortByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> sortByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> sortByOwnerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerId', Sort.asc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> sortByOwnerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerId', Sort.desc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy>
  sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension IsarBusinessQuerySortThenBy
    on QueryBuilder<IsarBusiness, IsarBusiness, QSortThenBy> {
  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> thenByBusinessId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessId', Sort.asc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy>
  thenByBusinessIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessId', Sort.desc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> thenByBusinessName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessName', Sort.asc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy>
  thenByBusinessNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessName', Sort.desc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> thenByBusinessType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessType', Sort.asc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy>
  thenByBusinessTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessType', Sort.desc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> thenByCreditEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creditEnabled', Sort.asc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy>
  thenByCreditEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creditEnabled', Sort.desc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> thenByCurrency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.asc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> thenByCurrencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.desc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> thenByDefaultUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultUnit', Sort.asc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy>
  thenByDefaultUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultUnit', Sort.desc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> thenByDeviceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.asc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> thenByDeviceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceId', Sort.desc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> thenByOwnerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerId', Sort.asc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> thenByOwnerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerId', Sort.desc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy>
  thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension IsarBusinessQueryWhereDistinct
    on QueryBuilder<IsarBusiness, IsarBusiness, QDistinct> {
  QueryBuilder<IsarBusiness, IsarBusiness, QDistinct> distinctByBusinessId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'businessId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QDistinct> distinctByBusinessName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'businessName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QDistinct> distinctByBusinessType({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'businessType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QDistinct>
  distinctByCreditEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'creditEnabled');
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QDistinct> distinctByCurrency({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currency', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QDistinct> distinctByDefaultUnit({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'defaultUnit', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QDistinct> distinctByDeviceId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QDistinct> distinctByOwnerId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ownerId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QDistinct> distinctBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus');
    });
  }

  QueryBuilder<IsarBusiness, IsarBusiness, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension IsarBusinessQueryProperty
    on QueryBuilder<IsarBusiness, IsarBusiness, QQueryProperty> {
  QueryBuilder<IsarBusiness, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarBusiness, String, QQueryOperations> businessIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'businessId');
    });
  }

  QueryBuilder<IsarBusiness, String, QQueryOperations> businessNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'businessName');
    });
  }

  QueryBuilder<IsarBusiness, String, QQueryOperations> businessTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'businessType');
    });
  }

  QueryBuilder<IsarBusiness, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<IsarBusiness, bool, QQueryOperations> creditEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'creditEnabled');
    });
  }

  QueryBuilder<IsarBusiness, String, QQueryOperations> currencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currency');
    });
  }

  QueryBuilder<IsarBusiness, String, QQueryOperations> defaultUnitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'defaultUnit');
    });
  }

  QueryBuilder<IsarBusiness, String, QQueryOperations> deviceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceId');
    });
  }

  QueryBuilder<IsarBusiness, String, QQueryOperations> ownerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ownerId');
    });
  }

  QueryBuilder<IsarBusiness, SyncStatus, QQueryOperations>
  syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }

  QueryBuilder<IsarBusiness, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
