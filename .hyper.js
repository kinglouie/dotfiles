module.exports = {
  config: {

    updateChannel: 'canary',

    fontSize: 15,
    fontFamily: '"FuraCode Nerd Font", monospace',
    css: `
      x-screen x-row { font-variant-ligatures: contextual; }
    `,
    termCSS: `
      x-screen x-row { font-variant-ligatures: contextual; }
    `,
    base16: {
      scheme: 'solarized'
    },

  },

  plugins: [
    'hypersixteen'
  ],

};
