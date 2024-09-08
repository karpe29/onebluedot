module.exports = {
  content: [
    './_includes/**/*.html',
    './_layouts/**/*.html',
    './_posts/*.md',
    './*.html',
  ],
  theme: {
    extend: {
      colors: {
        'theme-blue': '#0400ff',
      },
      fontFamily: {
        'graphik': ['Graphik', 'sans-serif'],
      },
    },
  },
  plugins: [],
}
