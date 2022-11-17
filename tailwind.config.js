/** @type {import('tailwindcss').Config} */

module.exports = {
  content: ["./js/*.js", "./templates/**/*.tpl"],
  theme: {
    fontFamily: {
      serif: ["Roboto", "Arial"],
    },

    extend: {
      colors: {
        cblue: "#0D5DA1",
        cdarkblue: "#0b2040",
        cwhite: "#F0F5F9",
        cpink: "#FFB9D2",
        clightgreen: "#79bda5",
        cgray: "#ABABAB",
        cdarkgray: "#5c5c5c",
        clightblue: "#DAECFB",
      },
    },
  },
  plugins: [],
};
