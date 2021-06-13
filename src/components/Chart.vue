<template>
  <apexchart
    height="90%"
    width="99%"
    type="line"
    :options="chartOptions"
    :series="series"
  ></apexchart>
</template>


<script>
import VueApexCharts from "vue3-apexcharts";

export default {
  name: 'Chart',
  components: {
    apexchart: VueApexCharts,
  },
  props: ['price', 'tradeTime'],
  data() {
    return {
      chartOptions: {
        chart: {
            id: "vuechart-example",
            animations: {
              enabled: true,
            },
        },
        xaxis: {
          categories: this.tradeTime,
          tickAmount: 8,
          labels: {
            rotate: 0,
          },
        },
        stroke: {
          width: 1,
        },
      },
      series: [
        {
          name: "",
          data: this.price,
        },
      ],
    }
  },
}
</script>


<style lang="scss" scoped>
</style>
