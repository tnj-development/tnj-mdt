<script lang="ts">
    import { SELECTED_REPORTS } from "@store/reports";
	import { PLAYER } from "@store/player"
    import { LOCALE } from "@store/locales";

    export let civilians: string[] = [];

    function AddNewCivilian() {
        console.log("Add New Civilian");
    }

</script>

<div class="w-full flex flex-col px-[1.5vh] rounded-[0.5vh] border-[0.1vh] border-gray_primary bg-dark_tertiary text-gray-400">
    <div class="w-full h-[5vh] flex justify-between items-center">
        <div class="flex items-center">
            <i class="fas fa-users"></i>
            <h1 class="px-[1vh]">
                {$LOCALE.ui.reports.civilians_involved}
            </h1>
        </div>
        {#if $PLAYER.job.type !== 'doj' && $SELECTED_REPORTS}
        <button 
            class="w-[3vh] h-[3vh] rounded-[0.5vh] hover:bg-dark_quaternary"
            on:click={AddNewCivilian}
        >
            <i class="fas fa-plus"></i>
        </button>
        {/if}
    </div>

    {#if $SELECTED_REPORTS && civilians.length > 0}
        <div class="w-full flex flex-wrap gap-[0.5vh] pb-[1.5vh] text-[1.3vh]">
            {#each civilians as item}
                <div class="px-[1vh] py-[0.2vh] rounded-[0.5vh] bg-dark_quaternary">
                    <h1>
                        {item}
                    </h1>
                </div>
            {/each}
        </div>
    {/if}
</div>