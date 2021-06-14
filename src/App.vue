<template>
  <Header />
  <Quotes
    :price="price"
    :getprice="getprice"
    :connectToWebSocket="connectToWebSocket"
    :currencyPairs="currencyPairs"
    :setSelectedPair="setSelectedPair"
    :setStartValues="setStartValues"
    />
  <Chart_panel
    :price="price"
    :tradeTime="tradeTime"
    :selectedPair="selectedPair"
    />
</template>

<script>
import Header from './components/Header.vue'
import Quotes from './components/Quotes.vue'
import Chart_panel from './components/Chart_panel.vue'

export default {
  name: 'App',
  components: {
    Header,
    Quotes,
    Chart_panel,
  },
  data: () => ({
    price: [],
    tradeTime: [''],
    connection: false,
    currencyPairs: [
      {
        names: ['usd', 'btc'],
        lastValue: [],
        lastPanelUpdate: new Date(),
        lastChartUpdate: new Date(),
        growth: 0,
      },
      {
        names: ['usd', 'bch'],
        lastValue: [],
        lastPanelUpdate: new Date(),
        lastChartUpdate: new Date(),
        growth: 0,
      },
      {
        names: ['usd', 'eth'],
        lastValue: [],
        lastPanelUpdate: new Date(),
        lastChartUpdate: new Date(),
        growth: 0,
      },
      {
        names: ['usd', 'ltc'],
        lastValue: [],
        lastPanelUpdate: new Date(),
        lastChartUpdate: new Date(),
        growth: 0,
      },
    ],
    selectedPair: '',
    apiKey: 'b3003fdb202608263f007675fe0a0a923091385e73cbf600d23ebfb29c30328e',
  }),
  methods: {
    getprice(fCurr, sCurr, lim) {
      fetch(`https://min-api.cryptocompare.com/data/v2/histominute?fsym=${fCurr}&tsym=${sCurr}&limit=${lim}`)
        .then(response => response.json())
        .then(response => {
          response.Data.Data.forEach((res, ind) => {
            this.price[ind] = res.close.toFixed(3);

            const date = new Date(res.time * 1000);
            const hours = date.getHours().toString();
            let minutes = date.getMinutes().toString();
            if (minutes.length === 1) {
              minutes = '0' + minutes;
            }
            this.tradeTime.[ind] = hours + ':' + minutes;
            if (this.tradeTime[0] === '') {
              this.tradeTime.shift();
            }
          })
        })
    },

    setStartValues(fCurr, sCurr, lim, pair) {
      fetch(`https://min-api.cryptocompare.com/data/v2/histominute?fsym=${fCurr}&tsym=${sCurr}&limit=${lim}`)
        .then(response => response.json())
        .then(response => {
          response.Data.Data.forEach((res, ind) => {
            pair.lastValue[ind] = res.close.toFixed(3);
          })
        })
    },

    connectToWebSocket() {
      const subsList = this.currencyPairs.map(pair => {
        return `0~Coinbase~${pair.names[1].toUpperCase()}~${pair.names[0].toUpperCase()}`
      })

      console.log(`Open websocket`);
      this.connection = new WebSocket('wss://streamer.cryptocompare.com/v2?api_key=' + this.apiKey)

      this.connection.onopen = () => {
        console.log('Successfully connected')
        this.connection.send(JSON.stringify({
            "action": "SubAdd",
            "subs": subsList,
        }))
      }

      this.connection.onmessage = (event) => {
        const objData = JSON.parse(event.data)
        const price = objData.P
        const time = objData.TS;

        if (typeof price === 'number') {

          const pair = this.currencyPairs.find(pair =>
            pair.names.join('') === (objData.TSYM + objData.FSYM).toLowerCase()
          )

          // update panel and chart data after some seconds
          const secDiff = (new Date().getTime()/100).toFixed() - (pair.lastPanelUpdate.getTime()/100).toFixed()
          if (secDiff > 10) {

            //update panel data
            pair.lastValue.push(price)
            if (pair.lastValue.length > 2) {
              pair.lastValue.shift();
            }
            pair.growth = Math.abs((pair.lastValue[1] * 100 / pair.lastValue[0] - 100).toFixed(2))

            // modify last chart value
            if (pair.names.join('') === this.selectedPair.join('')) {
              this.price.pop()
              this.price.push(price)
            }

            pair.lastPanelUpdate = new Date();
          }

          // add data to chart after minute
          const timeDiff = new Date().getMinutes() - pair.lastChartUpdate.getMinutes()
          if (pair.names.join('') === this.selectedPair.join('') && timeDiff !== 0) {
            this.price.shift()
            this.price.push(price)

            const date = new Date(time * 1000);
            const hours = date.getHours().toString();
            let minutes = date.getMinutes().toString();
            if (minutes.length === 1) {
              minutes = '0' + minutes;
            }
            const formatedTime = hours + ':' + minutes;
            this.tradeTime.shift();
            this.tradeTime.push(formatedTime);
            pair.lastChartUpdate = new Date();
          }
        }
      }
      this.connection.onclose = function(event) {
        console.log(`Closing Web Socket, reason: ${event.reason}`);
      }
    },

    closeSockets() {
      this.currencyPairs.forEach(pair => pair.connection.close())
    },

    setSelectedPair(pair) {
      this.selectedPair = pair;
    },
  },
  created() {
    this.setSelectedPair(this.currencyPairs[0].names)
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
  "title_panel chart_panel"
  "currency_bar chart_panel";
  grid-template-columns: $quotes_width 1fr;
  font-family: Avenir, Helvetica, Arial, sans-serif;
  background-color: #000;
  height: 100vh;
  @include portable() {
    grid-template-areas:
    "header"
    "title_panel"
    "chart_panel"
    "currency_bar";
    grid-template-columns: 1fr;
  }
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
  .b1 {
    position: absolute;
    top: 10px;
    left: 50px;
  }
}
</style>
