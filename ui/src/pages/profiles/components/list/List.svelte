<script lang="ts">
    import { onMount } from "svelte"
	import { SendNUI } from "@utils/SendNUI"

    import { LOCALE } from "@store/locales"
    import { PLAYER } from "@store/player"
    import { SEARCH, PROFILES } from "@store/profiles"
    import { BROWSER_MODE } from "@store/stores"

	import Search from "@components/Search.svelte"
	import ProfileCard from "./Card.svelte"
	import Loader from "@components/Loader.svelte"

    let loading = false;

	onMount(async () => {
        if (!$BROWSER_MODE) {  
            loading = true;
            let profiles = await SendNUI("getProfiles");
            $PROFILES = profiles;
            loading = false;
        }
	});

    async function SearchProfile() {
        if ($SEARCH.length < 3) return;
        // loading = true;
        let profile = await SendNUI("searchProfiles", {
            searchQuery: $SEARCH,
            jobType: $PLAYER.job.type
        });
        $PROFILES = profile;
        console.log($PROFILES)
		// loading = false;
    }

</script>

<div class="h-full min-w-[35vh] p-[1vh] bg-dark_secondary rounded-[0.5vh] border-[0.1vh] border-gray_primary">
    <Search 
        label={$LOCALE.ui.shared.search}
        bind:search={$SEARCH} 
        onInput={SearchProfile}
    />
    <div class="w-full h-[69vh] flex flex-col gap-[1vh] mt-[1vh] pr-[0.3vh] overflow-auto">
		{#if loading}
			<Loader />
		{:else}
            {#if $PROFILES}
                {#each $PROFILES as item}
                    <ProfileCard
                        profile={item}
                        citizenid={item.citizenid}
                        fullname={item.fullname}
                        gender={item.gender}
                        licences={item.licences}
                    />
                {/each}
            {/if}
        {/if}
    </div>
</div>