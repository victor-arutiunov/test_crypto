<template>
  <Header />
  <Quotes />
  <Diagram />
</template>

<script>
import Header from './components/Header.vue'
import Quotes from './components/Quotes.vue'
import Diagram from './components/Diagram.vue'

export default {
  name: 'App',
  components: {
    Header,
    Quotes,
    Diagram,
  },
  data: () => ({

  }),
  methods: {

  },
}
</script>

<style lang="scss">
#app {
  @import 'styles/mixins';
  @import 'styles/variables';
  display: grid;
  grid-template-areas:
  "header header"
  "quotes diagram";
  grid-template-columns: $quotes_width 1fr;
  gap: 10px;
  font-family: Avenir, Helvetica, Arial, sans-serif;
  background-color: #000;
  height: 100vh;
  // reset
  * {
    box-sizing: border-box;
  }
  h1,
  h2,
  h3,
  h4 {
    margin: 0;
  }
}
</style>
