import { defineConfig } from "vite";
import { resolve } from "path";

// https://vitejs.dev/config/
export default defineConfig({
  base: "/flutter_hybrid_template/",
  build: {
    outDir: "docs",
    rollupOptions: {
      // external: /^lit-element/,
      output: {
        entryFileNames: `assets/[name].js`,
        chunkFileNames: `assets/[name].js`,
        assetFileNames: `assets/[name].[ext]`,
      },
      input: {
        main: resolve(__dirname, "index.html"),
        // editor: resolve(__dirname, "editor/index.html"),
      },
    },
  },
});
