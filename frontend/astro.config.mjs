// @ts-check
import { defineConfig, envField } from 'astro/config';
import icon from 'astro-icon';
import node from '@astrojs/node';
import react from "@astrojs/react";

// https://astro.build/config
export default defineConfig({
  output: 'server',
  adapter: node({
    mode: 'standalone',
  }),
  site: "https://sheet-generator.alejoide.com",
  integrations: [icon(), react()],
  env: {
    schema: {
      GENERATOR_API_URL: envField.string({ context: "server", access: "secret", default: "http://localhost:8000" }),
      APP_VERSION: envField.string({ context: "client", access: "public", default: "0.0.1" }),
    }
  },
});