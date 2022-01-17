module.exports = {
purge: {
  enabled: true,
  content:  [
    '../Output/**/*.html', 
    '../../public/**/*.html', 
    '../../.tmp/**/*.html'
  ]
},
  darkMode: false, // or 'media' or 'class'
  theme: {
    fontFamily: {
      'sans': [
        'Oxygen',
        'ui-sans-serif',
        'system-ui',
        '-apple-system',
        'BlinkMacSystemFont',
        '"Segoe UI"',
        'Roboto',
        '"Helvetica Neue"',
        'Arial',
        '"Noto Sans"',
        'sans-serif',
        '"Apple Color Emoji"',
        '"Segoe UI Emoji"',
        '"Segoe UI Symbol"',
        '"Noto Color Emoji"',
      ],
      'serif': ['Cardo', 'ui-serif', 'Georgia', 'Cambria', '"Times New Roman"', 'Times', 'serif'],
    },
    extend: {
      colors: {
        bellow: {
          600: '#958e1e',
          500: '#f9ed32',
          400: '#fbf484',
          300: '#fdf8ad',
          200: '#fdfbd6'
        },
      },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
