import {
    BedrockRuntimeClient,
    InvokeModelCommand
} from '@aws-sdk/client-bedrock-runtime';

const client = new BedrockRuntimeClient({
    region: 'eu-central-1',
});

async function generateQuiz(questionCount, categoryList, difficulty) {

    const request = {
        "prompt": "\n\nYou are a question bank. " +
            "Create " + questionCount + " questions for the following categories: " + categoryList + ". " +
            "The questions should be " + difficulty + ".\n\n" + ",\n\n" +
            "Each question should have 4 options and 1 correct answer. " +
            "Return the answer in JSON format.",
        "max_tokens_to_sample": 2000,
    }

    const input = {
        body: JSON.stringify(request),
        contentType: "application/json",
        accept: "application/json",
        modelId: "amazon.titan-text-express-v1"
    }

    const command = new InvokeModelCommand(input);
    const response = await client.send(command);

    return JSON.parse(Buffer.from(response.body).toString('utf-8'));
}