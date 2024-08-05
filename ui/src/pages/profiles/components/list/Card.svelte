<script lang="ts">
	import { PLAYER } from "@store/player"
	import { SELECTED_PROFILE } from "@store/profiles"
	import { SendNUI } from "@utils/SendNUI"

    export let profile: any;
    export let citizenid: string;
    export let fullname: string;
    export let gender: number;
    export let licences: string[];

    async function SelectProfile() {
        let profile = await SendNUI("selectProfile", { 
            citizenid: citizenid,
            jobType: $PLAYER.job.type
        });

        $SELECTED_PROFILE = {};
        $SELECTED_PROFILE = {...profile};
    }
</script>

<button 
    class="w-full rounded-[0.5vh] p-[1vh] flex flex-col text-start font-medium border-[0.1vh] border-gray_primary hover:bg-dark_tertiary { $SELECTED_PROFILE?.cid === citizenid ? 'bg-dark_tertiary' : '' }"
    on:click={SelectProfile}
>
    <h1 class="w-full text-[1.6vh] text-gray-400">
        {fullname} (#{citizenid})
    </h1>
    <h1 class="w-full text-[1.3vh] text-gray-500 mt-[0.4vh]">
        <i class="fas fa-user mr-[0.5vh]"></i>
        {gender === 0 ? "Male" : "Female"}
    </h1>
    <h1 class="w-full text-[1.3vh] text-gray-500 mt-[0.2vh]">
        <i class="fas fa-id-card  mr-[0.5vh]"></i>
        {#if Object.values(licences).every(x => !x)}
            <span>No licenses found.</span>
        {:else}
            {#each Object.entries(licences) as [key, value], index}
                {#if value}
                    <span>{index > 0 ? ', ' : ''}{key.charAt(0).toUpperCase() + key.slice(1)}</span>
                {/if}
            {/each}
        {/if}
    </h1>
</button>