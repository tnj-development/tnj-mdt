<script lang="ts">
	import { SELECTED_INCIDENTS } from "@store/incidents"
	import { PLAYER } from "@store/player"
    import { LOCALE } from "@store/locales"

    export let tags: string[] = [];
 
    let editingTagIndex: number | null = null;
    let editingTagValue = '';

    function NewTag() {
        if (editingTagValue === 'New Tag') return;
        tags = [...tags, ''];
        editingTagIndex = tags.length - 1;
        editingTagValue = 'New Tag';
    }

    function EditTag(index: number) {
        editingTagIndex = index;
        editingTagValue = tags[index];
    }

    function SaveTag(index: number) {
        if (editingTagIndex === null) return;
        tags[index] = editingTagValue;
        editingTagIndex = null;
        editingTagValue = '';
    }

    function CancelEditTag() {
        editingTagIndex = null;
        editingTagValue = '';
    }

</script>

<div class="w-full flex flex-col px-[1.5vh] rounded-[0.5vh] border-[0.1vh] border-gray_primary bg-dark_tertiary text-gray-400">
    <div class="w-full h-[5vh] flex justify-between items-center">
        <div class="flex items-center">
            <i class="fas fa-tag"></i>
            <h1 class="px-[1vh]">
                {$LOCALE.ui.incidents.tags}
            </h1>
        </div>
        {#if $PLAYER.job.type !== 'doj' && $SELECTED_INCIDENTS}
            <button 
                class="w-[3vh] h-[3vh] rounded-[0.5vh] hover:bg-dark_quaternary"
                on:click={NewTag}
            >
                <i class="fas fa-plus"></i>
            </button>
        {/if}
    </div>

    {#if $SELECTED_INCIDENTS && tags.length > 0}
        <div class="w-full flex flex-wrap gap-[0.5vh] pb-[1.5vh] text-[1.3vh]">
            {#each tags as tag, index}
                <div class="px-[1vh] py-[0.2vh] rounded-[0.5vh] {editingTagIndex === index ? "bg-dark_senary" : " bg-dark_quaternary"}">
                    {#if editingTagIndex === index}
                        <button 
                            on:keydown={(event) => {
                                if (event.key === 'Enter') {
                                    if (editingTagValue.trim() !== '') {
                                        SaveTag(index);
                                    } else {
                                        CancelEditTag();
                                    }
                                } else if (event.key === 'Escape') {
                                    CancelEditTag();
                                }
                            }}
                            contenteditable="true"
                            bind:innerHTML={editingTagValue}
                        ></button>
                    {:else}
                        <button 
                            on:click={() => EditTag(index)}
                            on:contextmenu={(event) => {
                                event.preventDefault();
                                tags = tags.filter((_, i) => i !== index);
                            }}
                        >
                            {tag}
                        </button>
                    {/if}
                </div>
            {/each}
        </div>
    {/if}
</div>