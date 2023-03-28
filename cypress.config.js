const { defineConfig } = require("cypress");
const createBundler = require("@bahmutov/cypress-esbuild-preprocessor");
const addCucumberPreprocessorPlugin = require('@badeball/cypress-cucumber-preprocessor').addCucumberPreprocessorPlugin
const  createEsbuildPlugin = require('@badeball/cypress-cucumber-preprocessor/esbuild').createEsbuildPlugin

module.exports = defineConfig({
  e2e: {
    async setupNodeEvents(on, config) {
      // Bundle Cypress specs using esbuild
      const bundler = createBundler({
        plugins: [createEsbuildPlugin(config)],
      });

      on('file:preprocessor', bundler)
      
      await addCucumberPreprocessorPlugin(on, config);

      return config
    },
    baseUrl: 'https://stage2.stagefelbayt.com/',
    specPattern: "cypress/e2e/**/*.feature",
    env: {
      backend_url: 'https://bandar2.stagefelbayt.com',
      country: 'qatar'
    }
  },
  chromeWebSecurity: false,
  watchForFileChanges: false,
  defaultCommandTimeout: 20000,
  viewportWidth: 1280,
  viewportHeight: 720,
  scrollBehavior: "nearest"
})
