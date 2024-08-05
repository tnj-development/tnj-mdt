<script lang="ts">
    import { SELECTED_PROFILE } from "@store/profiles";
	import { PLAYER } from "@store/player"
	import { Notify } from "@store/notify"
	import { SendNUI } from "@utils/SendNUI"
	import { ACTIVE_PAGE } from "@store/stores"
	import { SELECTED_VEHICLE } from "@store/dmv"
    import { LOCALE } from "@store/locales";

    import Vehicles from "@pages/dmv/Vehicles.svelte";

    function OpenInDMV(vehicle: any) {

        ACTIVE_PAGE.set({ 
            value: "vehicles", 
            component: Vehicles 
        });
        $SELECTED_VEHICLE = vehicle.plate;
    }

</script>

<div class="w-full flex flex-col px-[1.5vh] rounded-[0.5vh] border-[0.1vh] border-gray_primary bg-dark_tertiary text-gray-400">
    <div class="w-full h-[5vh] flex justify-between items-center">
        <div class="flex items-center">
            <i class="fas fa-car-side"></i>
            <h1 class="px-[1vh]">
                {$LOCALE.ui.profiles.vehicles}
            </h1>
        </div>
    </div>

    {#if $SELECTED_PROFILE?.vehicles.length > 0}
        <div class="w-full flex flex-wrap gap-[0.5vh] pb-[1.5vh] text-[1.3vh]">
            {#each $SELECTED_PROFILE.vehicles as vehicle}
                <button 
                    on:click={() => OpenInDMV(vehicle)}
                    class="px-[1vh] py-[0.2vh] rounded-[0.5vh] bg-dark_quaternary"
                >
                    {vehicle.label} - {vehicle.plate}
                </button>
            {/each}
        </div>
    {/if}
</div>