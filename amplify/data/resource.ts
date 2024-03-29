import {type ClientSchema, a, defineData} from '@aws-amplify/backend';

const schema = a.schema({
    Question: a
        .model({
            title: a.string().required(),
            answer: a.string().required(),
            category: a.string().required(),
            difficulty: a.string().required(),
            options: a.string().array().required(),
            createdAt: a.datetime(),
            updatedAt: a.datetime(),
            result: a.belongsTo("Result"),
        })
        .authorization([a.allow.owner()]),

    Result: a.model({
        score: a.float().required(),
        correctAnswerCount: a.integer().required(),
        answers: a.string().array().required(),
        questions: a.hasMany("Question"),
        createdAt: a.datetime(),
        updatedAt: a.datetime(),
    }).authorization([a.allow.owner()]),
});

export type Schema = ClientSchema<typeof schema>;

export const data = defineData({
    schema,
    authorizationModes: {
        defaultAuthorizationMode: 'userPool'
    }
});