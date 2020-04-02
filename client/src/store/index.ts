import Vue from 'vue';
import Vuex from 'vuex';
import { createLogux } from '@logux/vuex';
import { badge, badgeEn, log } from '@logux/client';
import { badgeStyles } from '@logux/client/badge/styles';

Vue.use(Vuex);

const Logux = createLogux({
  subprotocol: '1.0.0',
  server: process.env.NODE_ENV === 'development'
    ? 'ws://localhost:31337'
    : 'wss://logux.example.com',
  userId: false, // TODO: We will fill it in next chapter
  credentials: '', // TODO: We will fill it in next chapter
});

const store = new Logux.Store({
  state: {
  },
  mutations: {
  },
  actions: {
  },
  modules: {
  },
});

badge(store.client, { messages: badgeEn, styles: badgeStyles });
log(store.client);

store.client.start();

export default store;
