<script lang="ts">
	import ImageDisplay from "@components/ImageDisplay.svelte"
	import { SELECTED_INCIDENTS } from "@store/incidents"
	import { PLAYER } from "@store/player"
    import { LOCALE } from "@store/locales"

    export let evidence: string[] = [];

    function NewEvidence() {
        console.log("New Evidence");
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
                {$LOCALE.ui.incidents.evidence}
            </h1>
        </div>
        {#if $PLAYER.job.type !== 'doj' && $SELECTED_INCIDENTS}
        <button 
            class="w-[3vh] h-[3vh] rounded-[0.5vh] hover:bg-dark_quaternary"
            on:click={NewEvidence}
        >
            <i class="fas fa-plus"></i>
        </button>
        {/if}
    </div>

    {#if $SELECTED_INCIDENTS && evidence.length > 0}
        <div class="h-full overflow-auto flex flex-wrap gap-[1vh] pb-[1.5vh]">
            {#each evidence as evidence}
                <button
                    on:click={() => ShowImage(evidence)}
                    class=""
                >
                    <img 
                        src="{evidence}" 
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