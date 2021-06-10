<template lang="html">
  <div class="diagram">
    <h1 class="diagram__title">usd | btc</h1>
  </div>
</template>


<script>
export default {
  name: 'Diagram'
}
</script>


<style lang="scss" scoped>
  @import '../styles/mixins';
  @import '../styles/variables';
  .diagram {
    grid-area: diagram;
    height: $main_heigth;
    background-color: #eee;
    &__title {
      @include h1;
      display: flex;
      justify-content: center;
    }
  }
</style>
