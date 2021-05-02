import { defineConfig } from "vite";
import { resolve } from "path";

// https://vitejs.dev/config/
export default defineConfig({
  // base: "/bible/",
  build: {
    outDir: "docs",
    // lib: {
    //   entry: "src/bible-app.ts",
    //   formats: ["es"],
    // },
    // manifest: true,
    rollupOptions: {
      // external: /^lit-element/,
      input: {
        main: resolve(__dirname, "index.html"),
        // editor: resolve(__dirname, "www/editor/index.html"),
      },
    },
  },
});
