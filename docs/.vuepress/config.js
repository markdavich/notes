import { defaultTheme } from '@vuepress/theme-default'
import { defineUserConfig } from 'vuepress/cli'
import { viteBundler } from '@vuepress/bundler-vite'
import { searchPlugin } from '@vuepress/plugin-search'

export default defineUserConfig({
  lang: 'en-US',

  title: 'VuePress',
  description: 'My first VuePress Site',

  theme: defaultTheme({
    logo: 'https://vuejs.press/images/hero.png',

    navbar: ['/', '/get-started'],
  }),

  bundler: viteBundler(),

  plugins: [
    // https://ecosystem.vuejs.press/plugins/search/search.html
    searchPlugin({
      // allow searching the `tags` frontmatter
      getExtraFields: (page) => page.frontmatter.tags ?? [],

      // exclude the homepage
      isSearchable: (page) => page.path !== '/',

      maxSuggestions: 10
    }),
  ]
})
