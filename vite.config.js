import { viteConfig } from './svelte.config.js'

// Extend the imported viteConfig and merge/override the preview.allowedHosts as needed
export default {
  ...viteConfig,
  preview: {
    ...(viteConfig.preview ?? {}), // preserve existing preview settings, if any
    allowedHosts: [
      'obsweb.vlab.ethz.ch',
      // Add more hosts as needed
    ]
  }
};
