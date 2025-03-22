// @ts-check
import { defineConfig, envField } from 'astro/config';
import icon from 'astro-icon';

import react from "@astrojs/react";

// https://astro.build/config
export default defineConfig({
  site: "https://sheet-generator.alejoide.com",
  integrations: [icon(), react()],
  env: {
    schema: {
      PUBLIC_EMAIL: envField.string({ context: "client", access: "public" }),
      GENERATOR_API_URL: envField.string({ context: "client", access: "public" }),
      APP_VERSION: envField.string({ context: "client", access: "public" }),
    }
  },
});