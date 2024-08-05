<script lang="ts">
	import { LOCALE } from "@store/locales";
    import { LOGS } from "@store/logs";

    import Search from "@components/Search.svelte"
	import Card from "./components/Card.svelte"
	import { onMount } from "svelte"
	import { SendNUI } from "@utils/SendNUI"
	import Loader from "@components/Loader.svelte"

	let search = "";
    let loading = false;

	onMount(async () => {
		loading = true;
        let logs = await SendNUI("getLogs");
        $LOGS = logs;
		loading = false;
	});
</script>

<div class="w-full h-[80vh] p-[1.5vh] flex flex-col gap-[1vh]">
    <Search
        label={$LOCALE.ui.shared.search}
        bind:search
        onInput={() => {}}
    />
    <div class="w-full h-[2vh] pb-[0.8vh] flex items-center border-b-[0.1vh] border-gray_primary font-medium text-gray-400">
            <h1 class="w-[20vh]">
                Time
            </h1>
            <h1 class="w-[15vh]">
                Category
            </h1>
        <h1 class="w-[45vh]">
            Text
        </h1>
    </div>

    <div class="w-full h-[71vh] flex flex-col pr-[0.5vh] overflow-auto">
        {#if loading}
            <Loader />
        {:else}
            {#each $LOGS as log}
                <Card
                    id={log.id}
                    text={log.text}
                    category={log.category}
                    time={log.time}
                    jobtype={log.jobtype}
                />
            {/each}
        {/if}
    </div>
</div>
