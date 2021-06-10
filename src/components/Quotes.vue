<template lang="html">
  <div class="quotes">
    <div class="quotes__title_panel">
      <h2 class="quotes__title">панель котировок</h2>
    </div>

    <div class="quotes__currency">
      <div class="quotes__labels">
        <h3 class="quotes__labels__label">Валютные пары</h3>
        <h3 class="quotes__labels__label">Изменения</h3>
        <h3 class="quotes__labels__label">Цена</h3>
      </div>

      <ul class="quotes__list">
        <li class="quotes__list__item">
          <h2>USD</h2> <h2>%</h2> <h2>price</h2>
        </li>
        <li class="quotes__list__item">
          <h2>BCH</h2> <h2>%</h2> <h2>price</h2>
        </li>
        <li class="quotes__list__item">
          <h2>XRP</h2> <h2>%</h2> <h2>price</h2>
        </li>
      </ul>
    </div>
  </div>
</template>


<script>
export default {
  name: 'Quotes'
}
</script>


<style lang="scss" scoped>
  @import '../styles/mixins';
  @import '../styles/variables';
  .quotes {
    grid-area: quotes;
    width: $quotes_width;
    height: $main_heigth;
    &__title_panel {
      display: flex;
      align-items: center;
      height: 7.5vh;
      background-color: $main_dark_gray;
      margin-bottom: 3px;
    }
    &__title {
      @include h1;
      padding-left: 35px;
      color: #fff;
    }
    &__currency {
      padding: 0 40px 0 35px;
      height: calc(#{$main_heigth} - 3px - 7.5vh);
      background-color: $main_dark_gray;
    }
    &__labels {
      padding-top: 20px;
      padding-bottom: 5px;
      display: flex;
      justify-content: space-between;
      &__label {
        @include h2;
        font-size: 12px;
        color: $main_light_grey;
      }
    }
    &__list {
      &__item {
        @include h3;
        display: flex;
        justify-content: space-between;
        margin-left: -40px;
        font-size: 20px;
        color: #fff;
      }
    }
  }
</style>
