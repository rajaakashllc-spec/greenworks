/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        brand: {
          dark: '#082218',
          emerald: '#0C2D20',
          medium: '#154734',
          accent: '#237053',
          gold: '#C5A059',
          goldLight: '#E8D49E',
          cream: '#F7FAF7',
          sand: '#F2EFEB'
        }
      },
      fontFamily: {
        heading: ['Playfair Display', 'serif'],
        sans: ['Plus Jakarta Sans', 'sans-serif']
      }
    },
  },
  plugins: [],
}
