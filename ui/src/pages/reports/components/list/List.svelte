<script lang="ts">
    import { onMount } from "svelte"
	import { SendNUI } from "@utils/SendNUI"
    import { BROWSER_MODE } from "@store/stores"
    import { LOCALE } from "@store/locales"
    import { REPORTS, SEARCH } from "@store/reports"
    import { PLAYER } from "@store/player"

	import Card from "./Card.svelte"
	import Search from "@components/Search.svelte"
	import Loader from "@components/Loader.svelte"

    let loading = false;
    
	onMount(async () => {
        GetReports()
	});

    async function GetReports() {
        loading = true;
        let reports = await SendNUI("getReports");
        $REPORTS = reports;
		loading = false;
    }

    async function SearchReports() {
        if ($SEARCH.length < 3) return;
        // loading = true;
        let incidents = await SendNUI("searchReports", {
            searchQuery: $SEARCH,
            jobType: $PLAYER.job.type
        });
        $REPORTS = incidents;
		// loading = false;
    }
    
</script>

<div class="h-full min-w-[35vh] p-[1vh] bg-dark_secondary rounded-[0.5vh] border-[0.1vh] border-gray_primary">
    <Search 
        label={$LOCALE.ui.shared.search}
        bind:search={$SEARCH}
        onInput={SearchReports}
    />
    <div class="w-full h-[69vh] flex flex-col gap-[1vh] mt-[1vh] pr-[0.3vh] overflow-auto">
		{#if loading}
			<Loader />
		{:else}
            {#each $REPORTS as item}
                <Card
                    report={item}
                    title={item.title}
                    type={item.type}
                    time={item.time}
                    jobtype={item.jobtype}
                />
            {/each}
        {/if}
    </div>
</div>