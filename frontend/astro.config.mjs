// @ts-check
import { defineConfig, envField } from 'astro/config';
import icon from 'astro-icon';

// https://astro.build/config
export default defineConfig({
  site: "https://sheet-generator.alejoide.com",
  integrations: [icon()],
  env: {
    schema: {
      PUBLIC_EMAIL: envField.string({ context: "client", access: "public" }),
    }
  },
});