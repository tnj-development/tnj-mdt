<script lang="ts">
    import { onMount } from "svelte";
    import { BROWSER_MODE } from "@store/stores";
    import { OFFICERS } from "@store/officers";
    import OfficersCard from "./OfficersCard.svelte";
	import { SendNUI } from "@utils/SendNUI"
  
    let loading = false;
  
    onMount(async () => {
        if (!$BROWSER_MODE) {
            loading = true;
            let officers = await SendNUI("getOfficers");
            $OFFICERS = officers;
            loading = false;
        }
    });
  

</script>
  
<div class="w-full h-[69vh] flex flex-col gap-[1vh] mt-[1vh] pr-[0.3vh] overflow-auto">
    {#if $OFFICERS}
        {#each $OFFICERS as item}
            <OfficersCard 
                id={item.id}
                name={item.name}
                job={item.job}
                grade={item.jobGrade}
                onduty={item.duty}
                callsign={item.callsign}
            />
        {/each}
    {/if}
</div>
  

