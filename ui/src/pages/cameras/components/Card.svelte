<script lang="ts">
	import { SendNUI } from "@utils/SendNUI"

    export let id: number;
    export let label: string;
    export let location: string;
    export let img: string;

    function ViewCamera() {
        SendNUI("viewCamera", id)
    }

</script>

<button 
    class="h-[22.7vh] w-[25.5vh] flex flex-col bg-dark_secondary hover:bg-dark_tertiary rounded-[0.5vh] border-[0.1vh] border-gray_primary"
    on:click={ViewCamera}
>
    <img src={img} alt={location} class="h-[16vh] w-full aspect-square object-cover rounded-t-[0.5vh] border-b-[0.1vh] border-gray_primary" />
    <div class="h-[6.5vh] w-full rounded-b-[0.5vh] flex flex-col items-start p-[1vh] font-medium text-[1.5vh]">
        <div class="w-full flex items-center gap-[0.8vh] text-gray-400">
            <i class="fas fa-video"></i>
            <p>{label}</p>
        </div>
        <div class="w-full flex items-center gap-[0.8vh] text-gray-400">
            <i class="fas fa-map-pin"></i>
            <p>{location}</p>
        </div>
    </div>
</button>