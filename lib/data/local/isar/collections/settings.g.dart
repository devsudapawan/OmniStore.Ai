// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarSettingsCollection on Isar {
  IsarCollection<IsarSettings> get isarSettings => this.collection();
}

const IsarSettingsSchema = CollectionSchema(
  name: r'IsarSettings',
  id: -2003972169886166418,
  properties: {
    r'businessId': PropertySchema(
      id: 0,
      name: r'businessId',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'creditEnabled': PropertySchema(
      id: 2,
      name: r'creditEnabled',
      type: IsarType.bool,
    ),
    r'currency': PropertySchema(
      id: 3,
      name: r'currency',
      type: IsarType.string,
    ),
    r'defaultUnit': PropertySchema(
      id: 4,
      name: r'defaultUnit',
      type: IsarType.string,
    ),
    r'settingsId': PropertySchema(
      id: 5,
      name: r'settingsId',
      type: IsarType.string,
    ),
    r'syncStatus': PropertySchema(
      id: 6,
      name: r'syncStatus',
      type: IsarType.string,
    ),
  },

  estimateSize: _isarSettingsEstimateSize,
  serialize: _isarSettingsSerialize,
  deserialize: _isarSettingsDeserialize,
  deserializeProp: _isarSettingsDeserializeProp,
  idName: r'id',
  indexes: {
    r'settingsId': IndexSchema(
      id: -4428449816366672166,
      name: r'settingsId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'settingsId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
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
    r'syncStatus': IndexSchema(
      id: 8239539375045684509,
      name: r'syncStatus',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'syncStatus',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _isarSettingsGetId,
  getLinks: _isarSettingsGetLinks,
  attach: _isarSettingsAttach,
  version: '3.3.0',
);

int _isarSettingsEstimateSize(
  IsarSettings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.businessId.length * 3;
  bytesCount += 3 + object.currency.length * 3;
  bytesCount += 3 + object.defaultUnit.length * 3;
  bytesCount += 3 + object.settingsId.length * 3;
  bytesCount += 3 + object.syncStatus.length * 3;
  return bytesCount;
}

void _isarSettingsSerialize(
  IsarSettings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.businessId);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeBool(offsets[2], object.creditEnabled);
  writer.writeString(offsets[3], object.currency);
  writer.writeString(offsets[4], object.defaultUnit);
  writer.writeString(offsets[5], object.settingsId);
  writer.writeString(offsets[6], object.syncStatus);
}

IsarSettings _isarSettingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarSettings();
  object.businessId = reader.readString(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.creditEnabled = reader.readBool(offsets[2]);
  object.currency = reader.readString(offsets[3]);
  object.defaultUnit = reader.readString(offsets[4]);
  object.id = id;
  object.settingsId = reader.readString(offsets[5]);
  object.syncStatus = reader.readString(offsets[6]);
  return object;
}

P _isarSettingsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _isarSettingsGetId(IsarSettings object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarSettingsGetLinks(IsarSettings object) {
  return [];
}

void _isarSettingsAttach(
  IsarCollection<dynamic> col,
  Id id,
  IsarSettings object,
) {
  object.id = id;
}

extension IsarSettingsByIndex on IsarCollection<IsarSettings> {
  Future<IsarSettings?> getBySettingsId(String settingsId) {
    return getByIndex(r'settingsId', [settingsId]);
  }

  IsarSettings? getBySettingsIdSync(String settingsId) {
    return getByIndexSync(r'settingsId', [settingsId]);
  }

  Future<bool> deleteBySettingsId(String settingsId) {
    return deleteByIndex(r'settingsId', [settingsId]);
  }

  bool deleteBySettingsIdSync(String settingsId) {
    return deleteByIndexSync(r'settingsId', [settingsId]);
  }

  Future<List<IsarSettings?>> getAllBySettingsId(
    List<String> settingsIdValues,
  ) {
    final values = settingsIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'settingsId', values);
  }

  List<IsarSettings?> getAllBySettingsIdSync(List<String> settingsIdValues) {
    final values = settingsIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'settingsId', values);
  }

  Future<int> deleteAllBySettingsId(List<String> settingsIdValues) {
    final values = settingsIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'settingsId', values);
  }

  int deleteAllBySettingsIdSync(List<String> settingsIdValues) {
    final values = settingsIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'settingsId', values);
  }

  Future<Id> putBySettingsId(IsarSettings object) {
    return putByIndex(r'settingsId', object);
  }

  Id putBySettingsIdSync(IsarSettings object, {bool saveLinks = true}) {
    return putByIndexSync(r'settingsId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllBySettingsId(List<IsarSettings> objects) {
    return putAllByIndex(r'settingsId', objects);
  }

  List<Id> putAllBySettingsIdSync(
    List<IsarSettings> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'settingsId', objects, saveLinks: saveLinks);
  }

  Future<IsarSettings?> getByBusinessId(String businessId) {
    return getByIndex(r'businessId', [businessId]);
  }

  IsarSettings? getByBusinessIdSync(String businessId) {
    return getByIndexSync(r'businessId', [businessId]);
  }

  Future<bool> deleteByBusinessId(String businessId) {
    return deleteByIndex(r'businessId', [businessId]);
  }

  bool deleteByBusinessIdSync(String businessId) {
    return deleteByIndexSync(r'businessId', [businessId]);
  }

  Future<List<IsarSettings?>> getAllByBusinessId(
    List<String> businessIdValues,
  ) {
    final values = businessIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'businessId', values);
  }

  List<IsarSettings?> getAllByBusinessIdSync(List<String> businessIdValues) {
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

  Future<Id> putByBusinessId(IsarSettings object) {
    return putByIndex(r'businessId', object);
  }

  Id putByBusinessIdSync(IsarSettings object, {bool saveLinks = true}) {
    return putByIndexSync(r'businessId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByBusinessId(List<IsarSettings> objects) {
    return putAllByIndex(r'businessId', objects);
  }

  List<Id> putAllByBusinessIdSync(
    List<IsarSettings> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'businessId', objects, saveLinks: saveLinks);
  }
}

extension IsarSettingsQueryWhereSort
    on QueryBuilder<IsarSettings, IsarSettings, QWhere> {
  QueryBuilder<IsarSettings, IsarSettings, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarSettingsQueryWhere
    on QueryBuilder<IsarSettings, IsarSettings, QWhereClause> {
  QueryBuilder<IsarSettings, IsarSettings, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterWhereClause> idBetween(
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterWhereClause> settingsIdEqualTo(
    String settingsId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'settingsId', value: [settingsId]),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterWhereClause>
  settingsIdNotEqualTo(String settingsId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'settingsId',
                lower: [],
                upper: [settingsId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'settingsId',
                lower: [settingsId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'settingsId',
                lower: [settingsId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'settingsId',
                lower: [],
                upper: [settingsId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterWhereClause> businessIdEqualTo(
    String businessId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'businessId', value: [businessId]),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterWhereClause>
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterWhereClause> syncStatusEqualTo(
    String syncStatus,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'syncStatus', value: [syncStatus]),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterWhereClause>
  syncStatusNotEqualTo(String syncStatus) {
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
}

extension IsarSettingsQueryFilter
    on QueryBuilder<IsarSettings, IsarSettings, QFilterCondition> {
  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
  businessIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'businessId', value: ''),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
  businessIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'businessId', value: ''),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
  creditEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'creditEnabled', value: value),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
  currencyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'currency', value: ''),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
  currencyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'currency', value: ''),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
  defaultUnitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'defaultUnit', value: ''),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
  defaultUnitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'defaultUnit', value: ''),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition> idBetween(
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

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
  settingsIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'settingsId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
  settingsIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'settingsId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
  settingsIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'settingsId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
  settingsIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'settingsId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
  settingsIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'settingsId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
  settingsIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'settingsId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
  settingsIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'settingsId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
  settingsIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'settingsId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
  settingsIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'settingsId', value: ''),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
  settingsIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'settingsId', value: ''),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
  syncStatusEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'syncStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
  syncStatusGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'syncStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
  syncStatusLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'syncStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
  syncStatusBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'syncStatus',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
  syncStatusStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'syncStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
  syncStatusEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'syncStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
  syncStatusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'syncStatus',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
  syncStatusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'syncStatus',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
  syncStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'syncStatus', value: ''),
      );
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterFilterCondition>
  syncStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'syncStatus', value: ''),
      );
    });
  }
}

extension IsarSettingsQueryObject
    on QueryBuilder<IsarSettings, IsarSettings, QFilterCondition> {}

extension IsarSettingsQueryLinks
    on QueryBuilder<IsarSettings, IsarSettings, QFilterCondition> {}

extension IsarSettingsQuerySortBy
    on QueryBuilder<IsarSettings, IsarSettings, QSortBy> {
  QueryBuilder<IsarSettings, IsarSettings, QAfterSortBy> sortByBusinessId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessId', Sort.asc);
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterSortBy>
  sortByBusinessIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessId', Sort.desc);
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterSortBy> sortByCreditEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creditEnabled', Sort.asc);
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterSortBy>
  sortByCreditEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creditEnabled', Sort.desc);
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterSortBy> sortByCurrency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.asc);
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterSortBy> sortByCurrencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.desc);
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterSortBy> sortByDefaultUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultUnit', Sort.asc);
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterSortBy>
  sortByDefaultUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultUnit', Sort.desc);
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterSortBy> sortBySettingsId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'settingsId', Sort.asc);
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterSortBy>
  sortBySettingsIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'settingsId', Sort.desc);
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterSortBy> sortBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterSortBy>
  sortBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }
}

extension IsarSettingsQuerySortThenBy
    on QueryBuilder<IsarSettings, IsarSettings, QSortThenBy> {
  QueryBuilder<IsarSettings, IsarSettings, QAfterSortBy> thenByBusinessId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessId', Sort.asc);
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterSortBy>
  thenByBusinessIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessId', Sort.desc);
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterSortBy> thenByCreditEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creditEnabled', Sort.asc);
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterSortBy>
  thenByCreditEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creditEnabled', Sort.desc);
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterSortBy> thenByCurrency() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.asc);
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterSortBy> thenByCurrencyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currency', Sort.desc);
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterSortBy> thenByDefaultUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultUnit', Sort.asc);
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterSortBy>
  thenByDefaultUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultUnit', Sort.desc);
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterSortBy> thenBySettingsId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'settingsId', Sort.asc);
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterSortBy>
  thenBySettingsIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'settingsId', Sort.desc);
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterSortBy> thenBySyncStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.asc);
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QAfterSortBy>
  thenBySyncStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncStatus', Sort.desc);
    });
  }
}

extension IsarSettingsQueryWhereDistinct
    on QueryBuilder<IsarSettings, IsarSettings, QDistinct> {
  QueryBuilder<IsarSettings, IsarSettings, QDistinct> distinctByBusinessId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'businessId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QDistinct>
  distinctByCreditEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'creditEnabled');
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QDistinct> distinctByCurrency({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currency', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QDistinct> distinctByDefaultUnit({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'defaultUnit', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QDistinct> distinctBySettingsId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'settingsId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarSettings, IsarSettings, QDistinct> distinctBySyncStatus({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncStatus', caseSensitive: caseSensitive);
    });
  }
}

extension IsarSettingsQueryProperty
    on QueryBuilder<IsarSettings, IsarSettings, QQueryProperty> {
  QueryBuilder<IsarSettings, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarSettings, String, QQueryOperations> businessIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'businessId');
    });
  }

  QueryBuilder<IsarSettings, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<IsarSettings, bool, QQueryOperations> creditEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'creditEnabled');
    });
  }

  QueryBuilder<IsarSettings, String, QQueryOperations> currencyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currency');
    });
  }

  QueryBuilder<IsarSettings, String, QQueryOperations> defaultUnitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'defaultUnit');
    });
  }

  QueryBuilder<IsarSettings, String, QQueryOperations> settingsIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'settingsId');
    });
  }

  QueryBuilder<IsarSettings, String, QQueryOperations> syncStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncStatus');
    });
  }
}
