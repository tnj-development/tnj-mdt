<script lang="ts">
	import { PLAYER } from "@store/player"
    import { SELECTED_VEHICLE } from "@store/dmv";
	import { SendNUI } from "@utils/SendNUI"

    export let vehicle: any;
    export let label: string;
    export let model: string;
    export let plate: string;
    export let vinScrached: number;

    async function SelectProfile() {
        $SELECTED_VEHICLE = vehicle;
    }
</script>


{#if vinScrached == 0}
    <button 
        class="w-full rounded-[0.5vh] p-[1vh] flex flex-col text-start font-medium border-[0.1vh] border-gray_primary hover:bg-dark_tertiary"
        on:click={SelectProfile}
    >
        <h1 class="w-full text-[1.6vh] text-gray-400">
            {label}
        </h1>
        <h1 class="w-full text-[1.3vh] text-gray-500 mt-[0.4vh]">
            <i class="fas fa-rectangle-list mr-[0.5vh]"></i>
            {plate}
        </h1>
    </button>
{/if}