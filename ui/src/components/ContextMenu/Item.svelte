<script lang="ts">
    export let icon: string;
    export let text: string;
    export let onClick: () => void;
</script>

<button
    on:click={onClick}
    class="w-full h-[3.2vh] flex items-center px-[1vh] gap-[0.8vh] hover:bg-dark_tertiary font-medium"
>
    <i class={icon}></i>
    <h1>{text}</h1>
</button>