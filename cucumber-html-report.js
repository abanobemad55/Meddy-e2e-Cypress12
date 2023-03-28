const report = require("multiple-cucumber-html-reporter");
report.generate({
  jsonDir: "jsonlogs", // ** Path of .json file **//
  reportPath: "./reports/html-report",
  metadata: {
    browser: {
      name: "chrome",
      version: "111",
    },
    device: "Local test machine",
    platform: {
      name: "Windows",
      version: "10",
    },
  },
});