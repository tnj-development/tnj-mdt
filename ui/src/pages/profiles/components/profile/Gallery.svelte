<script lang="ts">
    import { SELECTED_PROFILE } from "@store/profiles";
	import { PLAYER } from "@store/player"
	import { Notify } from "@store/notify"
    import { LOCALE } from "@store/locales";

    import ImageDisplay from "@components/ImageDisplay.svelte";

    let displayImage = "";
    function ShowImage(url: string) {
        console.log("Show Image: " + url);
        displayImage = url;
    }

    function NewGallery() {

    }
</script>

<div class="w-full flex flex-col px-[1.5vh] rounded-[0.5vh] border-[0.1vh] border-gray_primary bg-dark_tertiary text-gray-400">
    <div class="w-full h-[5vh] flex justify-between items-center">
        <div class="flex items-center">
            <i class="fas fa-images"></i>
            <h1 class="px-[1vh]">
                {$LOCALE.ui.profiles.gallery}
            </h1>
        </div>
        {#if $PLAYER.job.type !== 'doj' && $SELECTED_PROFILE}
            <button 
                class="w-[3vh] h-[3vh] rounded-[0.5vh] hover:bg-dark_quaternary"
                on:click={NewGallery}
            >
                <i class="fas fa-plus"></i>
            </button>
        {/if}
    </div>

    {#if $SELECTED_PROFILE?.gallery.length > 0}
        <div class="w-full flex flex-wrap gap-[0.5vh] pb-[1.5vh] text-[1.3vh]">
            {#each $SELECTED_PROFILE.gallery as image}
                <button
                    on:click={() => ShowImage(image)}
                >
                    <img src={image} alt="">
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