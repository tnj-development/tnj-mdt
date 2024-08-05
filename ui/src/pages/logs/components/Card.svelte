<script lang="ts">
	import { PLAYER } from "@store/player"
	import { timeAgo } from "@utils/timeAgo"

    export let id: number;
    export let text: string;
    export let category: string;
    export let time: string;
    export let jobtype: string;
</script>

{#if jobtype == $PLAYER.job.type}
    <div class="w-full flex gap-[1vh] px-[1vh] py-[0.5vh] font-medium text-gray-400 border-b-[0.1vh] border-gray_primary">
        <h1 class="w-[18vh]">
            {timeAgo(time)}
        </h1>
        <h1 class="w-[14vh]">
            {category}
        </h1>
        <h1 class="w-[95vh]">
            {text}
        </h1>
    </div>
{/if}