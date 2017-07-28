module.exports = {
  config: {
    fontSize: 14,
    fontFamily: 'OperatorMonoSSm Nerd Font',
    cursorColor: 'rgba(248,28,229,0.8)',
    cursorShape: 'BLOCK',
    cursorBlink: false,
    foregroundColor: '#fff',
    backgroundColor: 'rgba(0,0,0,0.2)',
    vibrancy: '',
    borderColor: '#333',
    css: '',
    termCSS: 'x-row {font-weight: 200}',
    padding: '12px 14px',
    colors: {
      black: '#000000',
      red: '#ff0000',
      green: '#33ff00',
      yellow: '#ffff00',
      blue: '#0066ff',
      magenta: '#cc00ff',
      cyan: '#00ffff',
      white: '#d0d0d0',
      lightBlack: '#808080',
      lightRed: '#ff0000',
      lightGreen: '#33ff00',
      lightYellow: '#ffff00',
      lightBlue: '#0066ff',
      lightMagenta: '#cc00ff',
      lightCyan: '#00ffff',
      lightWhite: '#ffffff'
    },
    shell: '',
    shellArgs: ['--login'],
    env: {
      HYPERTERM: 'vibrancy'
    },
    bell: 'SOUND',
    copyOnSelect: false,
    workingDirectory: '~/git',
    visor: {
      hotkey: 'CommandOrControl+Shift+Z'
    }
  },

  plugins: [
    // Theme try 1
    // 'hyperterm-oceanic-next',
    // 'hyper-transparent-dynamic',
    // Theme try 2
    'hyper-sierra-vibrancy',
    'hyper-font-smoothing',
    'hyperterm-working-directory',
    'hyperterm-visor',
    'hyperterm-cursor'
  ],
  localPlugins: []
}
