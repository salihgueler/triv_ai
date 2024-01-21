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


/** This is an auto generated class representing the Question type in your schema. */
class Question extends amplify_core.Model {
  static const classType = const _QuestionModelType();
  final String id;
  final String? _title;
  final String? _answer;
  final String? _category;
  final String? _difficulty;
  final List<String>? _options;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;
  final String? _owner;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  QuestionModelIdentifier get modelIdentifier {
      return QuestionModelIdentifier(
        id: id
      );
  }
  
  String get title {
    try {
      return _title!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get answer {
    try {
      return _answer!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get category {
    try {
      return _category!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get difficulty {
    try {
      return _difficulty!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  List<String> get options {
    try {
      return _options!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
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
  
  const Question._internal({required this.id, required title, required answer, required category, required difficulty, required options, createdAt, updatedAt, owner}): _title = title, _answer = answer, _category = category, _difficulty = difficulty, _options = options, _createdAt = createdAt, _updatedAt = updatedAt, _owner = owner;
  
  factory Question({String? id, required String title, required String answer, required String category, required String difficulty, required List<String> options, amplify_core.TemporalDateTime? createdAt, amplify_core.TemporalDateTime? updatedAt, String? owner}) {
    return Question._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      title: title,
      answer: answer,
      category: category,
      difficulty: difficulty,
      options: options != null ? List<String>.unmodifiable(options) : options,
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
    return other is Question &&
      id == other.id &&
      _title == other._title &&
      _answer == other._answer &&
      _category == other._category &&
      _difficulty == other._difficulty &&
      DeepCollectionEquality().equals(_options, other._options) &&
      _createdAt == other._createdAt &&
      _updatedAt == other._updatedAt &&
      _owner == other._owner;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Question {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("answer=" + "$_answer" + ", ");
    buffer.write("category=" + "$_category" + ", ");
    buffer.write("difficulty=" + "$_difficulty" + ", ");
    buffer.write("options=" + (_options != null ? _options!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null") + ", ");
    buffer.write("owner=" + "$_owner");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Question copyWith({String? title, String? answer, String? category, String? difficulty, List<String>? options, amplify_core.TemporalDateTime? createdAt, amplify_core.TemporalDateTime? updatedAt, String? owner}) {
    return Question._internal(
      id: id,
      title: title ?? this.title,
      answer: answer ?? this.answer,
      category: category ?? this.category,
      difficulty: difficulty ?? this.difficulty,
      options: options ?? this.options,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      owner: owner ?? this.owner);
  }
  
  Question copyWithModelFieldValues({
    ModelFieldValue<String>? title,
    ModelFieldValue<String>? answer,
    ModelFieldValue<String>? category,
    ModelFieldValue<String>? difficulty,
    ModelFieldValue<List<String>?>? options,
    ModelFieldValue<amplify_core.TemporalDateTime?>? createdAt,
    ModelFieldValue<amplify_core.TemporalDateTime?>? updatedAt,
    ModelFieldValue<String?>? owner
  }) {
    return Question._internal(
      id: id,
      title: title == null ? this.title : title.value,
      answer: answer == null ? this.answer : answer.value,
      category: category == null ? this.category : category.value,
      difficulty: difficulty == null ? this.difficulty : difficulty.value,
      options: options == null ? this.options : options.value,
      createdAt: createdAt == null ? this.createdAt : createdAt.value,
      updatedAt: updatedAt == null ? this.updatedAt : updatedAt.value,
      owner: owner == null ? this.owner : owner.value
    );
  }
  
  Question.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _title = json['title'],
      _answer = json['answer'],
      _category = json['category'],
      _difficulty = json['difficulty'],
      _options = json['options']?.cast<String>(),
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null,
      _owner = json['owner'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'title': _title, 'answer': _answer, 'category': _category, 'difficulty': _difficulty, 'options': _options, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format(), 'owner': _owner
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'title': _title,
    'answer': _answer,
    'category': _category,
    'difficulty': _difficulty,
    'options': _options,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt,
    'owner': _owner
  };

  static final amplify_core.QueryModelIdentifier<QuestionModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<QuestionModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final TITLE = amplify_core.QueryField(fieldName: "title");
  static final ANSWER = amplify_core.QueryField(fieldName: "answer");
  static final CATEGORY = amplify_core.QueryField(fieldName: "category");
  static final DIFFICULTY = amplify_core.QueryField(fieldName: "difficulty");
  static final OPTIONS = amplify_core.QueryField(fieldName: "options");
  static final CREATEDAT = amplify_core.QueryField(fieldName: "createdAt");
  static final UPDATEDAT = amplify_core.QueryField(fieldName: "updatedAt");
  static final OWNER = amplify_core.QueryField(fieldName: "owner");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Question";
    modelSchemaDefinition.pluralName = "Questions";
    
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
      key: Question.TITLE,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Question.ANSWER,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Question.CATEGORY,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Question.DIFFICULTY,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Question.OPTIONS,
      isRequired: true,
      isArray: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.collection, ofModelName: amplify_core.ModelFieldTypeEnum.string.name)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Question.CREATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Question.UPDATEDAT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Question.OWNER,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
  });
}

class _QuestionModelType extends amplify_core.ModelType<Question> {
  const _QuestionModelType();
  
  @override
  Question fromJson(Map<String, dynamic> jsonData) {
    return Question.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Question';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Question] in your schema.
 */
class QuestionModelIdentifier implements amplify_core.ModelIdentifier<Question> {
  final String id;

  /** Create an instance of QuestionModelIdentifier using [id] the primary key. */
  const QuestionModelIdentifier({
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
  String toString() => 'QuestionModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is QuestionModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}