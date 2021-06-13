
<template lang="html">
  <div class="chart_panel">
    <span class="chart_panel__title">
      {{ selectedPair.join(' | ').toUpperCase() }}
    </span>
    <Chart
      :price="price"
      :tradeTime="tradeTime"
    />
  </div>
</template>



<script>
import Chart from './Chart.vue'

export default {
  name: 'Chart_panel',
  components: {
    Chart,
  },
  props: ['price', 'tradeTime', 'selectedPair'],
}
</script>


<style lang="scss" scoped>
  @import '../styles/mixins';
  @import '../styles/variables';
  .chart_panel {
    grid-area: chart_panel;
    margin-left: 10px;
    padding: 31px 0 33px 0;

    height: $chart_panel_height;

    background-color: #eee;
    @include portable() {
      margin-left: 0;
      margin-bottom: 2px;
      padding: 5px 0 7px 0;

      height: $chart_panel_height_portable;
    }
    &__title {
      @include h1;
      display: flex;
      justify-content: center;
    }
  }
</style>
