import { defineBackend } from "@aws-amplify/backend";
import { auth } from "./auth/resource.js";
import { data } from "./data/resource.js";
import { BedrockConnection } from "./custom/BedrockConnection/resource.js";

const backend = defineBackend({
  auth,
  data,
});

new BedrockConnection(
  backend.createStack('BedrockConnection'),
  'BedrockConnection',
);