// Theme pimping situation
const CURRENT_THEME = 'gruvbox'
let themeName

switch (CURRENT_THEME) {
  case 'spacegray':
    themeName = 'hyperterm-spacegray'
    break
  case 'oceanic-next':
    themeName = 'hyperterm-oceanic-next'
    break
  case 'gruvbox':
    themeName = 'hyperterm-gruvbox-dark'
    break
  default:
    themeName = ''
    break
}

module.exports = {
  config: {
    fontSize: 14,
    fontFamily: 'OperatorMonoSSm Nerd Font',
    cursorColor: 'rgba(255,255,255,0.5)',
    cursorShape: 'BLOCK',
    cursorBlink: false,
    vibrancy: '',
    css: ``,
    termCSS: `
      x-screen x-row {
        line-height: initial;
      }
    `,
    padding: '12px 14px',
    colors: {},
    shell: '',
    shellArgs: ['--login'],
    env: {
      THEME: CURRENT_THEME
    },
    bell: 'SOUND',
    copyOnSelect: false,
    workingDirectory: '~/git',
    visor: {
      hotkey: 'CommandOrControl+Space'
    },
  },

  plugins: [
    themeName,
    'hyperterm-working-directory',
    'hyperterm-visor',
    'hyper-nobold',
    'hyperterm-alternatescroll',
    'hyper-hide-title',
    'hyperterm-cursor',
    'hyper-statusline',
    'hyperterm-safepaste',
    // 'hyperborder',
  ],
  localPlugins: []
}
