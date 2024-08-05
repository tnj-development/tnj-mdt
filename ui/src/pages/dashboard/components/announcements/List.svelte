<script lang="ts">
    import { onMount } from "svelte";
    import { BROWSER_MODE } from "@store/stores";

    import { LOCALE } from "@store/locales";
    import { PLAYER } from "@store/player"
    import { ANNOUNCEMENTS } from "@store/announcements"

    import { SendNUI } from "@utils/SendNUI";

	import Loader from "@components/Loader.svelte"
	import Card from "./components/Card.svelte"

    import CreateModal from "./components/CreateModal.svelte"

    let loading = false;
    let showCreateModal = false;
    
	onMount(async () => {
        if (!$BROWSER_MODE) 
            loading = true;{
                let announcements = await SendNUI("getAnnouncements", $PLAYER.job.type);
                $ANNOUNCEMENTS = announcements;
            loading = false;
        }
	});

    async function newAnnouncement() {
        showCreateModal = true;

    }

</script>

<div class="h-full w-full p-[1vh] bg-dark_secondary rounded-[0.5vh] border-[0.1vh] border-gray_primary">
    <div class="h-[5vh] flex justify-between items-center border-b-[0.1vh] border-gray_primary text-gray-400">
        <div class="px-[1vh] flex items-center gap-[1vh] font-medium">
            <i class="fas fa-bullhorn"></i>
            <h1>
                {$LOCALE.ui.announcements.title}
            </h1>
        </div>
        <button 
            class="w-[3vh] h-[3vh] rounded-[0.5vh] hover:bg-dark_tertiary"
            on:click={newAnnouncement}
        >
            <i class="fas fa-plus"></i>
        </button>
    </div>
    <div class="w-full h-[69vh] flex flex-col gap-[1vh] mt-[1vh] pr-[0.3vh] overflow-auto">
        {#if loading}
            <Loader />
        {:else}
            {#each $ANNOUNCEMENTS.slice().reverse() as item}
                <Card
                    id={item.id}
                    title={item.title}
                    desc={item.desc}
                    time={item.time}
                    author={item.author}
                    jobtype={item.jobtype}
                />
            {/each}
        {/if}
    </div>
</div>

<CreateModal 
    show={showCreateModal}
    onClose={() => showCreateModal = false}
/>
