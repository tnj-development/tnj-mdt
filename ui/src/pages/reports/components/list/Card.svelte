<script lang="ts">
    import { SELECTED_REPORTS } from "@store/reports";
	import { LOCALE } from "@store/locales"
	import { PLAYER } from "@store/player"
	import { timeAgo } from "@utils/timeAgo"

    export let report: any;
    export let title: string;
    export let type: string;
    export let time: string;
    export let jobtype: string;
    function SelectIncident() {
        $SELECTED_REPORTS = {};
        $SELECTED_REPORTS = {...report};
    }

</script>

{#if (jobtype == $PLAYER.job.type || ($PLAYER.job.type == 'doj' && jobtype == 'leo'))}
<button 
    class="w-full rounded-[0.5vh] p-[1vh] flex flex-col text-start font-medium border-[0.1vh] border-gray_primary hover:bg-dark_tertiary {$SELECTED_REPORTS?.id == report.id ? 'bg-dark_tertiary' : ''}"
    on:click={SelectIncident}
>
    <h1 class="w-full text-[1.6vh] text-gray-400">
        {title ? title : "No Report Title"}
    </h1>
    {#if type}
        <div class="w-full flex items-center gap-[0.5vh] text-[1.3vh] text-gray-500 mt-[0.4vh]">
            <i class="fas fa-tag"></i>
            <h1>
                {type}
            </h1>
        </div>
    {/if}
    <div class="w-full flex flex-wrap items-center justify-between text-[1.3vh] text-gray-500">
        <h1>
            {report.author}
        </h1>
        <h1>
            {timeAgo(time)}
        </h1>
    </div>
</button>
{/if}