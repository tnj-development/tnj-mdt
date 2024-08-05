<script lang="ts">
	import { LOCALE } from "@store/locales";
    import { CAMERAS } from "@store/cameras"

    import Search from "@components/Search.svelte"
	import Card from "./components/Card.svelte"

	let search = "";
</script>

<div class="w-full h-[80vh] p-[1.5vh] flex flex-col gap-[1vh]">
    <Search
        label={$LOCALE.ui.shared.search}
        bind:search
        onInput={() => {}}
    />
    <div class="w-full h-[71vh] gap-[1vh] pr-[1vh] grid grid-cols-5 overflow-auto">
        {#each $CAMERAS.filter(item => item.label.toLowerCase().includes(search.toLowerCase())) as item}
            <Card
                id={item.id}
                label={item.label}
                location={item.location}
                img={item.img}
            />
        {/each}
    </div>
</div>
