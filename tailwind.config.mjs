/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
  theme: {
    extend: {
      colors: {
        brand: {
          // Orange accents (Tailwind orange-500 / orange-600), match the 365 app.
          primary: '#F97316',
          primaryDark: '#EA580C',
          primaryLight: '#FB923C',
          // Dark theme — mirrors the SPA Landing's black → zinc-900 gradient.
          ink: '#FAFAFA', // text on dark surfaces
          paper: '#09090B', // page background (zinc-950)
          surface: '#18181B', // card / panel (zinc-900)
          surfaceAlt: '#27272A', // raised surface (zinc-800)
          muted: '#A1A1AA', // zinc-400 — body muted
          subtle: '#71717A', // zinc-500 — captions
          line: '#27272A', // hairline / borders (zinc-800)
        },
      },
      fontFamily: {
        display: ['"Helvetica Neue"', 'Helvetica', 'Arial', 'sans-serif'],
        accent: ['"Great Vibes"', '"Instrument Serif"', 'Georgia', 'serif'],
        body: ['"Inter"', '"Helvetica Neue"', 'Helvetica', 'Arial', 'sans-serif'],
      },
      letterSpacing: {
        tightest: '-0.055em',
      },
      maxWidth: {
        prose: '64ch',
      },
      animation: {
        'fade-up': 'fadeUp 0.7s ease-out both',
        'fade-in': 'fadeIn 0.9s ease-out both',
      },
      keyframes: {
        fadeUp: {
          '0%': { opacity: '0', transform: 'translateY(16px)' },
          '100%': { opacity: '1', transform: 'translateY(0)' },
        },
        fadeIn: {
          '0%': { opacity: '0' },
          '100%': { opacity: '1' },
        },
      },
    },
  },
  plugins: [],
};
