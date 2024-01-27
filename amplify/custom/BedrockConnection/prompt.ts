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
  const promptText = `
  \n\nHuman:
  You are a quiz question generator.

  Create exactly ${questionCount} questions, evenly distributed across the following categories: ${categoryList}. Ensure the questions align with ${difficulty} difficulty level.

  Requirements for each question:
  - Return the result as a list of JSON objects. 
  - Return the question with json key 'question'.
  - Include 4 different answer options, with json key 'options', each a string.
  - Specify 1 correct answer, with json key 'correctAnswer', in string format.
  - Return the category with json key 'category'.
  - Questions should not be repeated.
  \n\nAssistant:
`;


  const input = {
    modelId: "anthropic.claude-v2",
    contentType: "application/json",
    accept: "application/json",
    body: JSON.stringify({
      prompt: promptText,
      max_tokens_to_sample: 8192,
    }),
  };
  const command = new InvokeModelCommand(input);
  const response = await client.send(command);

  return JSON.parse(Buffer.from(response.body).toString("utf-8"));
};
