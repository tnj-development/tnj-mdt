<script lang="ts">
	import ImageDisplay from "@components/ImageDisplay.svelte"
    import { SELECTED_REPORTS } from "@store/reports";
	import { PLAYER } from "@store/player"
    import { LOCALE } from "@store/locales"

    export let gallery: string[] = [];

    function NewGallery() {
        console.log("New gallery");
    }

    let displayImage = "";
    function ShowImage(url: string) {
        console.log("Show Image: " + url);
        displayImage = url;
    }

</script>

<div class="w-full flex flex-col px-[1.5vh] rounded-[0.5vh] border-[0.1vh] border-gray_primary bg-dark_tertiary text-gray-400">
    <div class="w-full min-h-[5vh] flex justify-between items-center">
        <div class="flex items-center">
            <i class="fas fa-folder"></i>
            <h1 class="px-[1vh]">
                {$LOCALE.ui.reports.gallery}
            </h1>
        </div>
        {#if $PLAYER.job.type !== 'doj' && $SELECTED_REPORTS}
        <button 
            class="w-[3vh] h-[3vh] rounded-[0.5vh] hover:bg-dark_quaternary"
            on:click={NewGallery}
        >
            <i class="fas fa-plus"></i>
        </button>
        {/if}
    </div>

    {#if $SELECTED_REPORTS && gallery.length > 0}
        <div class="h-full overflow-auto flex flex-wrap gap-[1vh] pb-[1.5vh]">
            {#each gallery as gallery}
                <button
                    on:click={() => ShowImage(gallery)}
                    class=""
                >
                    <img 
                        src="{gallery}" 
                        alt="" 
                        class="object-cover rounded-[0.5vh] h-[11vh]"
                    >
                </button>
            {/each}
        </div>
    {/if}
</div>

{#if displayImage}
    <ImageDisplay 
        img={displayImage} 
        onClose={() => displayImage = ""}
    />
{/if}