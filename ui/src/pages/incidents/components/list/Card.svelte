<script lang="ts">
	import { SELECTED_INCIDENTS } from "@store/incidents"
	import { LOCALE } from "@store/locales"
	import { PLAYER } from "@store/player"
	import { timeAgo } from "@utils/timeAgo"

    export let incident: any;
    export let title: string;
    export let tags: string[];
    export let time: string;
    export let jobtype: string;
    function SelectIncident() {
        $SELECTED_INCIDENTS = {};
        $SELECTED_INCIDENTS = {...incident};
    }

</script>

{#if (jobtype == $PLAYER.job.type || ($PLAYER.job.type == 'doj' && jobtype == 'leo'))}
<button 
    class="w-full rounded-[0.5vh] p-[1vh] flex flex-col text-start font-medium border-[0.1vh] border-gray_primary hover:bg-dark_tertiary {$SELECTED_INCIDENTS?.id == incident.id ? 'bg-dark_tertiary' : ''}"
    on:click={SelectIncident}
>
    <h1 class="w-full text-[1.6vh] text-gray-400">
        {title ? title : "Incident Title"}
    </h1>
    <!-- <div class="w-full flex items-center text-[1.3vh] text-gray-500 mt-[0.4vh]">
        <div class="w-full flex flex-wrap gap-[0.4vh]">
            {#if tags.length > 0}
                {#each tags as tag, index}
                    <h1>
                        {tag.trim()}{index === tags.length - 1 ? '' : ','}
                    </h1>
                {/each}
            {:else}
                No Tags.
            {/if}
        </div>
    </div> -->
    <div class="w-full flex flex-wrap items-center justify-between text-[1.3vh] text-gray-500">
        <h1>
            {incident.author}
        </h1>
        <h1>
            {timeAgo(time)}
        </h1>
    </div>
</button>
{/if}