#!/usr/bin/env node
require('coffee-script');
var liquHd = require('./liquHd');
console.log('Starting up : liquHd Server...');
liquHd.start(8011);
