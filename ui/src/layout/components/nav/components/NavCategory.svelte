<script lang="ts">
    import { ACTIVE_PAGE } from "@store/stores"
    import { PLAYER } from "@store/player"
    
    export let label: string;
    export let icon: string;
    export let jobtypes: string[];
    export let dropdown: any;

    let isOpen = false;
    function ToggleDropdown() {
        isOpen = !isOpen;
    }

    function SetPage(value, component) {
        ACTIVE_PAGE.set({ 
            value: value, 
            component: component 
        });
    }
</script>

{#if jobtypes.includes($PLAYER.job.type)}
    <div class="flex flex-col bg-dark_secondary">
        <button
            class="flex justify-between items-center px-[2vh] min-h-[4.5vh] text-[1.5vh] hover:bg-dark_primary "
            on:click={ToggleDropdown}
        >
            <div class="flex gap-[1.5vh] items-center">
                <i class="{icon} w-[1.5vh]"></i>
                <h1>{label}</h1>
            </div>
            <div class="text-[1vh]">
                <i class="fas fa-chevron-down"></i>
            </div>
        </button>

        {#if isOpen}
            {#each dropdown as item}
                <button 
                    class="flex items-center pl-[3vh] min-h-[4.5vh] gap-[1.5vh] text-[1.5vh] hover:bg-dark_primary {$ACTIVE_PAGE.value === item.value ? 'bg-dark_primary' : 'bg-dark_secondary'}"
                    on:click={() => SetPage(item.value, item.component)}
                >
                    <i class="{item.icon} w-[1.5vh]"></i>
                    <h1>{item.label}</h1>
                </button>
            {/each}
        {/if}
    </div>
{/if}