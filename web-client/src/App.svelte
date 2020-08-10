<script lang="ts">
	let promise = getUsers();

	async function getUsers() {
		const res = await fetch(`https://firestore.googleapis.com/v1/projects/chat-app-17136/databases/(default)/documents/users`);
		const json = await res.json();

		if (res.ok) {
			return json.documents;
		} else {
			throw new Error(json);
		}
	}
</script>

<main>
	{#await promise}
		<p>...waiting</p>
	{:then users}
		<p>Profile is {users[0].fields.email.stringValue}</p>
		<img src="{users[0].fields.imageUrl.stringValue}" alt="">
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