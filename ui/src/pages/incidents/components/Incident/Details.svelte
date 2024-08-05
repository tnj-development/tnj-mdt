<script lang="ts">
    import TextEditor from "@components/TextEditor.svelte";
    import { SELECTED_INCIDENTS } from "@store/incidents";
    import { LOCALE } from "@store/locales";
</script>

<div class="w-full flex flex-col rounded-[0.5vh] border-[0.1vh] border-gray_primary bg-dark_tertiary text-gray-400">
    <TextEditor />
    {#if $SELECTED_INCIDENTS}
        <div 
            id="editor" 
            contenteditable="true"
            class="w-full h-[29vh] rounded-b-[0.5vh] p-[1vh] overflow-auto" 
            bind:innerHTML={$SELECTED_INCIDENTS.details}
        ></div>
    {:else}
        <div 
            id="editor" 
            contenteditable="true"
            class="w-full h-[29vh] rounded-b-[0.5vh] p-[1vh] overflow-auto" 
        >
            {$LOCALE.ui.incidents.no_information}
        </div>
    {/if}
</div>