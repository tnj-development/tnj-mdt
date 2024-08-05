<script lang="ts">
	export let label: string;
	export let search: string = "";
	export let onInput: (e: Event) => void;
</script>

<div class="w-full h-[5vh] bg-dark_secondary text-[1.8vh] text-gray-500 flex items-center px-[1vh] gap-[1vh] rounded-[0.5vh] border-[0.1vh] border-gray_primary hover:bg-dark_tertiary">
	<i class="fas fa-magnifying-glass" />
	<input
		type="text"
		placeholder={label}
		bind:value={search}
		on:input={onInput}
		class="bg-transparent w-full font-medium"
	/>
</div>

<style>
	::placeholder {
		color: rgb(107, 114, 128);
		font-weight: 500;
	}
</style>