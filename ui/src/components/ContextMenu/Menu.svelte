<script lang="ts">
	import Item from "./Item.svelte"

    export let show: boolean = false;
    export let items: string[] = [];
    export let mouseX: number;
    export let mouseY: number;
    export let onClose: () => void;

    function hide() {
        show = false;
        onClose();
    }

    function handleClick(item) {
        item.onClick();
        hide();
    }

</script>

{#if show}
    <div on:click={hide} on:contextmenu={hide} class="w-screen h-screen fixed top-0 bottom-0 left-0 right-0"></div>
    <div class="absolute z-50 w-[15vh] bg-dark_secondary py-[0.5vh] rounded-[0.5vh] border-[0.1vh] border-gray_primary" style="left: {mouseX}px; top: {mouseY}px;">
        {#each items as item}
            <Item
                icon={item.icon}
                text={item.text}
                onClick={() => handleClick(item)}
            />
        {/each}
    </div>
{/if}