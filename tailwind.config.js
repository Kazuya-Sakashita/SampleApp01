module.exports = {
  mode: 'jit',
  purge: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    alignContent: ['responsive', 'hover', 'focus'],
    extend: {},
  },
  plugins: [require('tailwind-hamburgers')],
}
