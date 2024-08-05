<script lang="ts">
    import { onMount } from "svelte"
	import { SendNUI } from "@utils/SendNUI"
    import { BROWSER_MODE } from "@store/stores"
    import { LOCALE } from "@store/locales"
    import { SEARCH, INCIDENTS } from "@store/incidents"

	import Card from "./Card.svelte"
	import Search from "@components/Search.svelte"
	import Loader from "@components/Loader.svelte"
	import { PLAYER } from "@store/player"

    let loading = false;
    
	onMount(async () => {
        GetIncidents()
	});

    async function GetIncidents() {
        loading = true;
        if (!$BROWSER_MODE) {
            let incidents = await SendNUI("getIncidents");
            $INCIDENTS = incidents;
        }
		loading = false;
    }

    async function SearchIncidents() {
        if ($SEARCH.length < 3) return;
        // loading = true;
        let incidents = await SendNUI("searchIncidents", {
            searchQuery: $SEARCH,
            jobType: $PLAYER.job.type
        });
        $INCIDENTS = incidents;
		// loading = false;
    }
    
</script>

<div class="h-full min-w-[35vh] p-[1vh] bg-dark_secondary rounded-[0.5vh] border-[0.1vh] border-gray_primary">
    <Search 
        label={$LOCALE.ui.shared.search}
        bind:search={$SEARCH}
        onInput={SearchIncidents}
    />
    <div class="w-full h-[69vh] flex flex-col gap-[1vh] mt-[1vh] pr-[0.3vh] overflow-auto">
		{#if loading}
			<Loader />
		{:else}
            {#each $INCIDENTS as item}
                <Card
                    incident={item}
                    title={item.title}
                    tags={item.tags}
                    time={item.time}
                    jobtype={item.jobtype}
                />
            {/each}
        {/if}
    </div>
</div>