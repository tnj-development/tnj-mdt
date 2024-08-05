<script lang="ts">
    import { onMount } from "svelte"
	import { SendNUI } from "@utils/SendNUI"

    import { LOCALE } from "@store/locales"
    import { WEAPONS, SEARCH } from "@store/weapons"
    import { BROWSER_MODE } from "@store/stores"

	import Search from "@components/Search.svelte"
	import Loader from "@components/Loader.svelte"
	import Card from "./Card.svelte"

    let loading = false;

	onMount(async () => {
		loading = true;
        let weapons = await SendNUI("getWeapons");
        $WEAPONS = weapons;
		loading = false;
	});

    async function SearchWeapon() {
        if ($SEARCH.length < 3) return;
        // loading = true;
        let weapons = await SendNUI("searchWeapons", $SEARCH);
        $WEAPONS = weapons;
        console.log($WEAPONS)
		// loading = false;
    }

</script>

<div class="h-full min-w-[35vh] p-[1vh] bg-dark_secondary rounded-[0.5vh] border-[0.1vh] border-gray_primary">
    <Search 
        label={$LOCALE.ui.shared.search}
        bind:search={$SEARCH} 
        onInput={SearchWeapon}
    />
    <div class="w-full h-[69vh] flex flex-col gap-[1vh] mt-[1vh] pr-[0.3vh] overflow-auto">
		{#if loading}
			<Loader />
		{:else}
            {#if $WEAPONS}
                {#each $WEAPONS as item}
                    <Card 
                        weapon={item}
                        weapModel={item.weapModel}
                        owner={item.owner}
                        serial={item.serial}
                    />
                {/each}
            {/if}
        {/if}
    </div>
</div>