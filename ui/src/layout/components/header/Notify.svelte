<script>
    import { NOTIFICATIONS } from "@store/notify";
	import { fly } from "svelte/transition"
</script>

<div class="h-full ml-auto flex items-center max-w-[40vh]">
    {#each $NOTIFICATIONS as notification}
        <div 
            class="h-full flex px-[2vh] text-gray-400 gap-[1.5vh] border-l-[0.1vh] border-gray_primary text-[1.5vh]" 
            transition:fly={{ x: 25 }}
        >
            <div class="h-full flex items-center text-[2vh]">
                <i class="far fa-circle-check"></i>
            </div>
            <div class="h-full flex flex-col justify-center">
                <h1 class="font-medium">{notification.title}</h1>
                <p class="text-gray-400">{notification.message}</p>
            </div>
        </div>
    {/each}
</div>