<template>
  <van-form class="add-event" @submit="onSubmit">
    <van-field
      v-model="event.title"
      name="Title"
      label="Title"
      placeholder="Title"
      :rules="[{ required: true, message: 'Username is required' }]"
    />
    <van-field
      v-model="event.desc"
      name="Description"
      label="Description"
      placeholder="Description"
      :rules="[{ required: true, message: 'Password is required' }]"
    />
    <div style="margin: 16px;">
      <van-button round block type="info" native-type="submit">
        Submit
      </van-button>
    </div>
  </van-form>
</template>

<script lang="ts">
import EventItem from '@/types/EventItem';
import ky from 'ky';

const event: EventItem = {
  id: '',
  title: '',
  desc: '',
  from: new Date(),
  to: new Date(),
  periodic: null,
};

export default {
  data: () => ({
    event,
  }),
  methods: {
    async onSubmit(values: Event) {
      const parsed = await ky.post('add-event', {
        prefixUrl: 'http://localhost:3000',
        json: values,
      }).json();
      console.log('parsed', parsed);
      console.log('submit', values);
    },
  },
};
</script>
