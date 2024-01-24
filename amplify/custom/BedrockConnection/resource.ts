import { Construct } from "constructs/lib/construct.js";
import { Runtime } from "aws-cdk-lib/aws-lambda";
import { LambdaIntegration, RestApi } from "aws-cdk-lib/aws-apigateway";
import { CfnOutput, Duration } from "aws-cdk-lib";
import { NodejsFunction } from "aws-cdk-lib/aws-lambda-nodejs";
import * as url from "node:url";
import {
  CompositePrincipal,
  Effect,
  PolicyStatement,
  Role,
  ServicePrincipal,
} from "aws-cdk-lib/aws-iam";

export class BedrockConnection extends Construct {
  constructor(scope: Construct, id: string) {
    super(scope, id);

    // Create Lambda function
    const quizFunction = new NodejsFunction(this, "generateQuiz", {
      entry: url.fileURLToPath(new URL("index.ts", import.meta.url)),
      runtime: Runtime.NODEJS_LATEST,
      handler: "index.handler",
      timeout: Duration.minutes(15),
    });

    // Create API Gateway
    const api = new RestApi(this, "QuizApi");

    // Add resource and method to the API Gateway
    const generateQuizResource = api.root.addResource("generateQuiz");
    const integration = new LambdaIntegration(quizFunction);
    generateQuizResource.addMethod("GET", integration);

    // Output the API Gateway endpoint URL
    new CfnOutput(this, "ApiEndpoint", {
      value: api.url,
      description: "Endpoint for the Quiz API",
    });
  }
}
