import { Handler } from "aws-cdk-lib/aws-lambda";
import { generateQuiz } from "./prompt.js";

export const handler: Handler = async (event: {
  queryStringParameters: {
    questionCount: String;
    categoryList: String;
    difficulty: String;
  };
}) => {
  const { questionCount, categoryList, difficulty } =
    event.queryStringParameters;

  const result = await generateQuiz(questionCount, categoryList, difficulty);
  return {
    headers: {'Content-Type': 'application/json'},
    statusCode: 200,
    body: JSON.stringify({ message: result }),
  };
}