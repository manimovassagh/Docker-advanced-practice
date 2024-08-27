import react from '@vitejs/plugin-react'
import { defineConfig } from 'vite'

export default defineConfig({
  plugins: [react()],
  server: {
    host: '0.0.0.0', // Listen on all IP addresses
    port: 5174, // The port that Vite will use
    strictPort: true, // Exit if the port is already in use
  },
})
