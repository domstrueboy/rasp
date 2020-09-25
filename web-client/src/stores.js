const BASE_URL = 'https://firestore.googleapis.com/v1/projects/chat-app-17136/databases/(default)/documents/users/';

import { writable } from 'svelte/store';

export const level = writable(
  parseInt(localStorage.getItem('level'), 10) || 1,
);

level.subscribe(value => {
	localStorage.setItem('level', value);
});

import { readable } from 'svelte/store';

export const time = readable(null, function start(set) {
	// implementation goes here

	return function stop() {};
});