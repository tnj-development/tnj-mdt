<script lang="ts">
    import { PLAYER } from "@store/player";
    import { ACTIVE_MULTI_MENU } from "@store/multimenu";

    export let jobtypes: string[];
    export let icon: string;
    export let value: string;
    export let component: any;

    function handleClick() {
        ACTIVE_MULTI_MENU.set({ icon, value, component })
    }
</script>

{#if jobtypes.includes($PLAYER.job.type)}
    <button 
        class="h-full min-w-[6vh] rounded-[0.5vh] bg-dark_secondary hover:bg-dark_tertiary text-gray-500 border-[0.1vh] border-gray_primary text-[1.6vh] {$ACTIVE_MULTI_MENU.value == value ? 'bg-dark_tertiary' : ''}"
        on:click={handleClick}
    >
        <i class={icon}></i>
    </button>
{/if}
