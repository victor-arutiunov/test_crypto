
<template lang="html">
  <div class="diagram_panel">
    <span class="diagram_panel__title">usd | btc</span>
    <Diagram />
  </div>
</template>



<script>
import Diagram from './Diagram.vue'

export default {
  name: 'Diagram_panel',
  components: {
    Diagram,
  },
}
</script>


<style lang="scss" scoped>
  @import '../styles/mixins';
  @import '../styles/variables';
  .diagram_panel {
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
