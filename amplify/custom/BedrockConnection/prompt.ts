import {
  BedrockRuntimeClient,
  InvokeModelCommand,
} from "@aws-sdk/client-bedrock-runtime";

const client = new BedrockRuntimeClient({
  region: "eu-central-1",
});

export const generateQuiz = async (
  questionCount: String,
  categoryList: String,
  difficulty: String
) => {
  const promptText =
    "You are a question bank.\n\n" +
    "Create " +
    questionCount +
    " questions for the following categories " +
    categoryList +
    ". " +
    ". The questions should be " +
    difficulty +
    ". Each question should have 4 options. Each option should be in string format." +
    " Each question should have 1 correct answer. The correct answer should be in string format" +
    " Each question should be unique. Options of the questions should not repeat themselves." +
    " Do not use double or single quotes within the question strings." +
    " Split the questions equally among the categories." +
    " Return the answer in JSON format." +
    " The JSON format should be valid and easy to be parsed by mobile applications.";

  const input = {
    modelId: "amazon.titan-text-express-v1",
    contentType: "application/json",
    accept: "*/*",
    body: JSON.stringify({
      inputText: promptText,
      textGenerationConfig: {
        maxTokenCount: 8192,
        stopSequences: [],
        temperature: 0,
        topP: 1,
      },
    }),
  };
  const command = new InvokeModelCommand(input);
  const response = await client.send(command);

  return JSON.parse(Buffer.from(response.body).toString("utf-8"));
};
