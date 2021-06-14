<template lang="html">
  <div class="title_panel">
    <h2 class="title_panel__title">панель котировок</h2>
  </div>

  <div class="currency_bar">
    <div class="currency_bar__labels">
      <h3 class="currency_bar__label">Валютные пары</h3>
      <h3 class="currency_bar__label">Изменения</h3>
      <h3 class="currency_bar__label">Цена</h3>
    </div>

    <ul class="currency_bar__list">
      <li
        class="currency_bar__item"
        v-for="pair in currencyPairs"
        :key="pair"
        v-on:click="selectPairOnClickHandler(pair)"
      >
        <span class="currency_bar__pair">{{ pair.names.join(' | ') }}</span>
        <span class="currency_bar__growth">
          <img v-if="pair.growth > 0" src="../images/arrow_up.svg" alt="">
          <img v-else src="../images/arrow_down.svg" alt="">
          {{ pair.growth }}%
        </span>
        <span class="currency_bar__price">{{ pair.lastValue[1] }}</span>
      </li>
    </ul>
  </div>
</template>


<script>
export default {
  name: 'currency_bar',
  props: ['price', 'getprice', 'connectToWebSocket', 'currencyPairs', 'setSelectedPair'],
  methods: {
    selectPairOnClickHandler(cur) {
      this.getprice(cur.names[1], cur.names[0], 180)
      this.setSelectedPair(cur.names);
    },
    alive() {
      console.log('I`am alive')
    }
  },
  created() {
    this.getprice(
      this.currencyPairs[0].names[1],
      this.currencyPairs[0].names[0],
      180
    )
    this.connectToWebSocket()
  },
}
</script>


<style lang="scss" scoped>
  @import '../styles/mixins';
  @import '../styles/variables';
  .title_panel {
    grid-area: title_panel;
    display: flex;
    align-items: center;
    height: $title_panel_height;
    background-color: $main_dark_gray;
    margin-bottom: 3px;
    @include portable() {
      margin-bottom: 2px;

      height: $title_panel_height_portable;
    }
    &__title {
      @include h1;
      padding-left: 35px;
      color: #fff;
      white-space: nowrap;
      @include portable() {
        font-size: 14px;
      }
    }
  }
  .currency_bar {
    grid-area: currency_bar;
    height: $currency_bar_height;
    background-color: $main_dark_gray;
    @include portable() {
      height: $currency_bar_height_portable;
    }
    &__labels {
      margin: auto;
      display: grid;
      grid-template-columns: repeat(3, 33%);
      padding-top: 20px;
      padding-bottom: 5px;
      width: 90%;
    }
    &__label {
      @include h2;
      font-size: 12px;
      color: $main_light_grey;
      white-space: nowrap;
    }
    &__label:nth-child(2) {
      padding-left: 30px;
    }
    &__label:nth-child(3) {
      justify-self: end;
    }
    &__list {
      margin: auto;
      margin-top: 5px;
      padding: 0;
      width: 90%;
    }
    &__item {
      @include h3;
      display: grid;
      grid-template-columns: repeat(3, 33%);
      font-size: 20px;
      color: #fff;
      white-space: nowrap;
    }
    &__pair {

    }
    &__growth {
      padding-left: 30px;
    }
    &__price {
      justify-self: end;
    }
  }
</style>
