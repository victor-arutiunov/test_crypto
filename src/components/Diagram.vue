<template>
  <div>
    <apexchart
      width="90%"
      type="line"
      :options="chartOptions"
      :series="series"
    ></apexchart>
  </div>
</template>


<script>
import VueApexCharts from "vue3-apexcharts";

export default {
  name: 'Diagram',
  components: {
    apexchart: VueApexCharts,
  },
  data: () => ({
    chartOptions: {
      chart: {
          id: "vuechart-example",
      },
      xaxis: {
        categories: [1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998],
      },
    },
    series: [
        {
          name: "series-1",
          data: [30, 40, 35, 50, 49, 60, 70, 91],
        },
      ],
  })
}
</script>


<style lang="scss" scoped>
</style>
