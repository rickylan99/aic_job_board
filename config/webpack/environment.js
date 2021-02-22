const { environment } = require('@rails/webpacker')

const webpack = require('webpack');

environment.plugins.append('Provide', new webpack.ProvidePlugin({
 $: 'jquery',
 jQuery: 'jquery',
 Popper: ['popper.js', 'default']
}));

const config = environment.toWebpackConfig();

config.resolve.alias = {
 jquery: 'jquery/src/jquery'
};

environment.loaders.insert('sass', {
    test: /\.scss$/,
    use: [
        "to-string-loader", // creates style nodes from JS strings
        "css-loader", // translates CSS into CommonJS
        "sass-loader" // compiles Sass to CSS
    ]
});

module.exports = environment
