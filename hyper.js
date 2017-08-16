// Theme pimping situation
const CURRENT_THEME = 'oceanic-next'
let themeName

switch (CURRENT_THEME) {
  case 'spacegray':
    themeName = 'hyperterm-spacegray'
    break
  case 'oceanic-next':
    themeName = 'hyperterm-oceanic-next'
    break
  default: themeName = ''
}

module.exports = {
  config: {
    fontSize: 14,
    fontFamily: 'OperatorMonoSSm Nerd Font',
    cursorColor: 'rgba(255,255,255,0.5)',
    cursorShape: 'BLOCK',
    cursorBlink: false,
    foregroundColor: '#fff',
    backgroundColor: '#1d313b',
    vibrancy: '',
    borderColor: '#333',
    css: ``,
    termCSS: ``,
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
    }
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
    'hyperterm-safepaste'
  ],
  localPlugins: []
}
