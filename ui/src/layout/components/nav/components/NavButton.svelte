<script lang="ts">
    import { ACTIVE_PAGE } from "@store/stores"
    import { PLAYER } from "@store/player"
    
    export let label: string;
    export let icon: string;
    export let value: string;
    export let jobtypes: string[];
    export let component: any;

    const setActivePage = () => {
        ACTIVE_PAGE.set({ 
            value: value, 
            component: component 
        });
    }
</script>

{#if jobtypes.includes($PLAYER.job.type)}
    <button 
        class="flex items-center pl-[2vh] min-h-[4.5vh] gap-[1.5vh] text-[1.5vh] hover:bg-dark_primary {$ACTIVE_PAGE.value === value ? 'bg-dark_primary' : 'bg-dark_secondary'}"
        on:click={setActivePage}
    >
        <i class="{icon} w-[1.5vh]"></i>
        <h1>{label}</h1>
    </button>
{/if}