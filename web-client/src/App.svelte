<script lang="ts">
	let promise = getUser();

	async function getUser() {
		const userId = window.location.pathname.slice(1).split('/')[0];
		const res = await fetch(`https://firestore.googleapis.com/v1/projects/chat-app-17136/databases/(default)/documents/users/${userId}`);
		const json = await res.json();

		if (res.ok) {
			return json;
		} else {
			throw new Error(json);
		}
	}
</script>

<main>
	{#await promise}
		<p>...waiting</p>
	{:then user}
		<p>Profile is {user.fields.email.stringValue}</p>
		<img src="{user.fields.imageUrl.stringValue}" alt="">
	{:catch error}
		<p style="color: red">{error.message}</p>
	{/await}
</main>

<style>
	main {
		text-align: center;
		padding: 1em;
		max-width: 240px;
		margin: 0 auto;
	}

	h1 {
		color: #ff3e00;
		text-transform: uppercase;
		font-size: 4em;
		font-weight: 100;
	}

	@media (min-width: 640px) {
		main {
			max-width: none;
		}
	}
</style>