const { popper } = require('@popperjs/core')
const { environment } = require('@rails/webpacker')
// jquerryの読み込み
const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: 'popper.js'
  })
)

module.exports = environment
