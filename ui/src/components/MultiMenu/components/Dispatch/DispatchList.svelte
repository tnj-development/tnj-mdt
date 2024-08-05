<script lang="ts">
	import { onMount } from "svelte"
    import { BROWSER_MODE } from "@store/stores";
	import { SendNUI } from "@utils/SendNUI"
	import { DISPATCHS } from "@store/dispatchs"
	import DispatchCard from "./DispatchCard.svelte"

    let loading = false;
    
	onMount(async () => {
		loading = true;
        if (!$BROWSER_MODE) {
            let dispatchs = await SendNUI("getActiveCalls");
            $DISPATCHS = dispatchs;
        }
		loading = false;
	});

</script>

<div class="w-full h-[69vh] flex flex-col gap-[1vh] mt-[1vh] pr-[0.3vh] overflow-auto">
    {#if $DISPATCHS.length > 0}
        {#each $DISPATCHS as item}
            <DispatchCard 
                id={item.id}
                units={item.units}
                time={item.time}
                codeName={item.codeName}
                message={item.message}
                coords={item.coords}
                gender={item.gender}
                code={item.code}
                jobs={item.jobs}
                street={item.street}
                responses={item.responses}
                automaticGunFire={item.automaticGunFire}
                color={item.color}
                plate={item.plate}
                heading={item.heading}
                model={item.model}
            />
        {/each}
    {:else}
        <div class="w-full h-full flex flex-col items-center gap-[0.5vh] py-[4vh] text-gray-400 font-medium opacity-50">
            <i class="fas fa-triangle-exclamation text-[3vh]"></i>
            <h1>
                No Recent Calls.
            </h1>
        </div>
    {/if}
</div>
