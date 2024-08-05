<script lang="ts">
    import { onMount } from "svelte"
	import { SendNUI } from "@utils/SendNUI"

    import { LOCALE } from "@store/locales"
    import { PLAYER } from "@store/player"
    import { VEHICLES, SEARCH, SELECTED_VEHICLE } from "@store/dmv"

    import { BROWSER_MODE } from "@store/stores"

	import Search from "@components/Search.svelte"
	import VehicleCard from "./Card.svelte"
	import Loader from "@components/Loader.svelte"


    let loading = false;

	onMount(async () => {
		loading = true;
        let vehicles = await SendNUI("getVehicles");
        $VEHICLES = vehicles;
		loading = false;
	});

    async function searchVehicle() {
        if ($SEARCH.length < 2) return;
        // loading = true;
        let vehicle = await SendNUI("searchVehicles", {
            searchQuery: $SEARCH,
            jobType: $PLAYER.job.type
        });
        $VEHICLES = vehicle;
        // console.log($VEHICLES)
		// loading = false;
    }

</script>

<div class="h-full min-w-[35vh] p-[1vh] bg-dark_secondary rounded-[0.5vh] border-[0.1vh] border-gray_primary">
    <Search 
        label={$LOCALE.ui.shared.search}
        bind:search={$SEARCH} 
        onInput={searchVehicle}
    />
    <div class="w-full h-[69vh] flex flex-col gap-[1vh] mt-[1vh] pr-[0.3vh] overflow-auto">
		{#if loading}
			<Loader />
		{:else}
            {#if $VEHICLES}
                {#each $VEHICLES as item}
                    <VehicleCard
                        vehicle={item}
                        label={item.label}
                        model={item.model}
                        plate={item.plate}
                        vinScrached={item.vinScrached}
                    />
                {/each}
            {/if}
        {/if}
    </div>
</div>