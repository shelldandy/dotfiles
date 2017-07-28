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
    colors: {},
    shell: '',
    shellArgs: ['--login'],
    env: {
      THEME: 'oceanic-next'
    },
    bell: 'SOUND',
    copyOnSelect: false,
    workingDirectory: '~/git',
    visor: {
      hotkey: 'CommandOrControl+Shift+Z'
    },
    hyperBorder: {
      borderColors: ['#fc1da7', '#fba506'],
      borderWidth: '5px'
    }
  },

  plugins: [
    'hyperterm-oceanic-next',
    'hyper-font-smoothing',
    'hyperterm-working-directory',
    'hyperterm-visor',
    'hyperterm-cursor',
    'hyper-nobold',
    'hyperterm-alternatescroll',
    'hyperborder'
  ],
  localPlugins: []
}
