<template>
  <header class="header">
    <h1 class="header__title">CRYPTO</h1>
  </header>
</template>

<script>
export default {
  name: 'Header',
}
</script>

<style lang="scss" scoped>
  @import '../styles/mixins';
  @import '../styles/variables';
  .header {
    grid-area: header;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 8px;

    height: $header_height;

    background-color: $main_dark_gray;
    @include portable() {
      margin-bottom: 1px;

      height: $header_heigth_portable;
    }
    &__title {
      @include h1;
      position: relative;

      height: 1em;

      line-height: 1em;
      background: $gradient_1;
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      &::before {
        content: " ";
        position: absolute;
        bottom: 2.5px;

        width: 100%;
        height: 1px;

        background: $gradient_1;
      }
      &::after {
        content: " ";
        position: absolute;
        bottom: 2.5px;
        left: 23px;

        width: 7.5px;
        height: 1px;

        background-color: $main_dark_gray;
      }
    }
  }
</style>
