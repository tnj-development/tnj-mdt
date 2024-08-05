<script>
    import { SELECTED_INCIDENTS } from "@store/incidents"
    import InvolvedCard from "./InvolvedCard.svelte"
    import { LOCALE } from "@store/locales"

    function NewInvolved() {
        console.log("New Involved");
    }
</script>

<div class="h-full min-w-[35vh] p-[1vh] bg-dark_secondary rounded-[0.5vh] border-[0.1vh] border-gray_primary">
    <div class="h-[5vh] flex justify-between items-center border-b-[0.1vh] border-gray_primary text-gray-400">
        <div class="px-[1vh] flex items-center gap-[1vh] font-medium">
            <i class="fas fa-users"></i>
            <h1>{$LOCALE.ui.incidents.criminals_involved}</h1>
        </div>
        <button 
            class="w-[3vh] h-[3vh] rounded-[0.5vh] hover:bg-dark_tertiary"
            on:click={NewInvolved}
        >
            <i class="fas fa-plus"></i>
        </button>
    </div>
    <div class="w-full h-[69vh] flex flex-col gap-[1vh] mt-[1vh] pr-[0.3vh] overflow-auto">
        <!-- {#if $SELECTED_INCIDENTS}
            {#each $SELECTED_INCIDENTS.criminalsinvolved as item}
                <InvolvedCard item={item} />
            {/each}
        {/if} -->
    </div>
</div>
