<template>
  <div id="app">
    <van-nav-bar
      :title="$route.name"
      left-text="Back"
      :right-text="$route.name === 'Add Event' ? '' : 'Add Event'"
      @click-right="onClickRight"
      left-arrow
    />
    <router-view />
    <van-tabbar v-model="active">
      <van-tabbar-item name="home" icon="home-o">Home</van-tabbar-item>
      <van-tabbar-item name="about" icon="search">About</van-tabbar-item>
    </van-tabbar>
  </div>
</template>

<script>
export default {
  data() {
    return {
      active: this.$route.path,
    };
  },
  watch: {
    active() {
      this.$router.push(this.active);
    },
  },
  methods: {
    onClickRight() {
      this.active = 'add-event';
    },
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>
