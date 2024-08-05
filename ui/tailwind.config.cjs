module.exports = {
  darkmode: true,
  content: [
    "./index.html",
    "./src/**/*.{svelte,js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        dark_primary: '#101113',
        dark_secondary: '#141517',
        dark_tertiary: '#1A1B1E',
        dark_quaternary: '#25262B',
        dark_quinary: '#2C2E33',
        dark_senary: '#373A40',

        gray_primary: '#212529',
        gray_secondary: '#343A40',
        gray_tertiary: '#495057',

        accent: '#2284d9',
        accent_green: '#00A379',
        accent_cyan: '#0098A3',
      }
    },
  },
  plugins: [],
}
