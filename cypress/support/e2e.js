
import './commands'
// require ('@percy/cypress')
require('cypress-xpath');

const cucumber = require("@badeball/cypress-cucumber-preprocessor").default
module.exports = (on, config) => {
  on('file:preprocessor', cucumber())
}