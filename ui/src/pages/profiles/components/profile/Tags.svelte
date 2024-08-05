<script lang="ts">
    import { SELECTED_PROFILE } from "@store/profiles";
	import { PLAYER } from "@store/player"
    import { LOCALE } from "@store/locales"
 
    let editingTagIndex: number | null = null;
    let editingTagValue = '';

    function NewTag() {
        if (editingTagValue === 'New Tag') return;
        $SELECTED_PROFILE.tags = [...$SELECTED_PROFILE.tags, ''];
        editingTagIndex = $SELECTED_PROFILE.tags.length - 1;
        editingTagValue = 'New Tag';
    }

    function EditTag(index: number) {
        editingTagIndex = index;
        editingTagValue = $SELECTED_PROFILE.tags[index];
    }

    function SaveTag(index: number) {
        if (editingTagIndex === null) return;
        $SELECTED_PROFILE.tags[index] = editingTagValue;
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
                {$LOCALE.ui.profiles.tags}
            </h1>
        </div>
        {#if $PLAYER.job.type !== 'doj' && $SELECTED_PROFILE}
            <button 
                class="w-[3vh] h-[3vh] rounded-[0.5vh] hover:bg-dark_quaternary"
                on:click={NewTag}
            >
                <i class="fas fa-plus"></i>
            </button>
        {/if}
    </div>

    {#if $SELECTED_PROFILE?.tags.length > 0}
        <div class="w-full flex flex-wrap gap-[0.5vh] pb-[1.5vh] text-[1.3vh]">
            {#each $SELECTED_PROFILE.tags as tag, index}
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
                                $SELECTED_PROFILE.tags = $SELECTED_PROFILE.tags.filter((_, i) => i !== index);
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