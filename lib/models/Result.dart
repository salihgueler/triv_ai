/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;
import 'package:collection/collection.dart';


/** This is an auto generated class representing the Result type in your schema. */
class Result extends amplify_core.Model {
  static const classType = const _ResultModelType();
  final String id;
  final double? _score;
  final int? _correctAnswerCount;
  final List<String>? _answers;
  final List<Question>? _questions;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;
  final String? _owner;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ResultModelIdentifier get modelIdentifier {
      return ResultModelIdentifier(
        id: id
      );
  }
  
  double get score {
    try {
      return _score!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  int get correctAnswerCount {
    try {
      return _correctAnswerCount!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String> get answers {
    try {
      return _answers!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<Question>? get questions {
    return _questions;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  String? get owner {
    return _owner;
  }
  
  const Result._internal({required this.id, required score, required correctAnswerCount, required answers, questions, createdAt, updatedAt, owner}): _score = score, _correctAnswerCount = correctAnswerCount, _answers = answers, _questions = questions, _createdAt = createdAt, _updatedAt = updatedAt, _owner = owner;
  
  factory Result({String? id, required double score, required int correctAnswerCount, required List<String> answers, List<Question>? questions, amplify_core.TemporalDateTime? createdAt, amplify_core.TemporalDateTime? updatedAt, String? owner}) {
    return Result._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      score: score,
      correctAnswerCount: correctAnswerCount,
      answers: answers != null ? List<String>.unmodifiable(answers) : answers,
      questions: questions != null ? List<Question>.unmodifiable(questions) : questions,
      createdAt: createdAt,
      updatedAt: updatedAt,
      owner: owner);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Result &&
      id == other.id &&
      _score == other._score &&
      _correctAnswerCount == other._correctAnswerCount &&
      DeepCollectionEquality().equals(_answers, other._answers) &&
      DeepCollectionEquality().equals(_questions, other._questions) &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt &&
      _owner == other._owner;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Result {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("score=" + (_score != null ? _score!.toString() : "null") + ", ");
    buffer.write("correctAnswerCount=" + (_correctAnswerCount != null ? _correctAnswerCount!.toString() : "null") + ", ");
    buffer.write("answers=" + (_answers != null ? _answers!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("owner=" + "$_owner");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Result copyWith({double? score, int? correctAnswerCount, List<String>? answers, List<Question>? questions, amplify_core.TemporalDateTime? createdAt, amplify_core.TemporalDateTime? updatedAt, String? owner}) {
    return Result._internal(
      id: id,
      score: score ?? this.score,
      correctAnswerCount: correctAnswerCount ?? this.correctAnswerCount,
      answers: answers ?? this.answers,
      questions: questions ?? this.questions,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      owner: owner ?? this.owner);
  }
  
  Result copyWithModelFieldValues({
    ModelFieldValue<double>? score,
    ModelFieldValue<int>? correctAnswerCount,
    ModelFieldValue<List<String>?>? answers,
    ModelFieldValue<List<Question>?>? questions,
    ModelFieldValue<amplify_core.TemporalDateTime?>? createdAt,
    ModelFieldValue<amplify_core.TemporalDateTime?>? updatedAt,
    ModelFieldValue<String?>? owner
  }) {
    return Result._internal(
      id: id,
      score: score == null ? this.score : score.value,
      correctAnswerCount: correctAnswerCount == null ? this.correctAnswerCount : correctAnswerCount.value,
      answers: answers == null ? this.answers : answers.value,
      questions: questions == null ? this.questions : questions.value,
      createdAt: createdAt == null ? this.createdAt : createdAt.value,
      updatedAt: updatedAt == null ? this.updatedAt : updatedAt.value,
      owner: owner == null ? this.owner : owner.value
    );
  }
  
  Result.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _score = (json['score'] as num?)?.toDouble(),
      _correctAnswerCount = (json['correctAnswerCount'] as num?)?.toInt(),
      _answers = json['answers']?.cast<String>(),
      _questions = json['questions'] is List
        ? (json['questions'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Question.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null,
      _owner = json['owner'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'score': _score, 'correctAnswerCount': _correctAnswerCount, 'answers': _answers, 'questions': _questions?.map((Question? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'owner': _owner
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'score': _score,
    'correctAnswerCount': _correctAnswerCount,
    'answers': _answers,
    'questions': _questions,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt,
    'owner': _owner
  };

  static final amplify_core.QueryModelIdentifier<ResultModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<ResultModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final SCORE = amplify_core.QueryField(fieldName: "score");
  static final CORRECTANSWERCOUNT = amplify_core.QueryField(fieldName: "correctAnswerCount");
  static final ANSWERS = amplify_core.QueryField(fieldName: "answers");
  static final QUESTIONS = amplify_core.QueryField(
    fieldName: "questions",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Question'));
  static final CREATEDAT = amplify_core.QueryField(fieldName: "createdAt");
  static final UPDATEDAT = amplify_core.QueryField(fieldName: "updatedAt");
  static final OWNER = amplify_core.QueryField(fieldName: "owner");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Result";
    modelSchemaDefinition.pluralName = "Results";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.OWNER,
        ownerField: "owner",
        identityClaim: "cognito:username",
        provider: amplify_core.AuthRuleProvider.USERPOOLS,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["id"], name: null)
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Result.SCORE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Result.CORRECTANSWERCOUNT,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Result.ANSWERS,
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasMany(
      key: Result.QUESTIONS,
      isRequired: false,
      ofModelName: 'Question',
      associatedKey: Question.RESULTQUESTIONSID
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Result.CREATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Result.UPDATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Result.OWNER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}

class _ResultModelType extends amplify_core.ModelType<Result> {
  const _ResultModelType();
  
  @override
  Result fromJson(Map<String, dynamic> jsonData) {
    return Result.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Result';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Result] in your schema.
 */
class ResultModelIdentifier implements amplify_core.ModelIdentifier<Result> {
  final String id;

  /** Create an instance of ResultModelIdentifier using [id] the primary key. */
  const ResultModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'ResultModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ResultModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}