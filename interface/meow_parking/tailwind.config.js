/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './src/**/*.{html,js,jsx,ts,tsx}',
    './src/Pages/**/*.{js,jsx,ts,tsx}',
    './src/Components/**/*.{js,jsx,ts,tsx}',
    "./*/*html"  , './public/index.html'
  ],
  theme: {
    extend: {
      fontFamily: {
        'montesserat':'Montserrat'
      }
    },
  },
  plugins: [],
}
