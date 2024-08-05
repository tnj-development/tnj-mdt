<script lang="ts">
    export let img: string;
    export let onClose: () => void;
</script>

<button
    on:click={onClose}
    class="fixed w-screen h-screen top-0 bottom-0 left-0 right-0 flex items-center justify-center bg-black bg-opacity-50"
>
    <button class="max-w-[100vh] max-h-[75vh] min-w-[40vh] rounded-[0.5vh] bg-dark_secondary border-gray_primary border-[0.1vh]" on:click|stopPropagation>
        <div class="h-[3vh] flex items-center justify-between px-[1vh] text-gray-400 font-medium border-gray_primary border-b-[0.1vh]">
            <h1>
                Image
            </h1>
            <button
                on:click={onClose}
                class="hover:text-white"
            >
                <i class="fas fa-xmark"></i>
            </button>
        </div>
        <img src={img} alt="display_img" class="rounded-b-[0.5vh] w-full h-full">
    </button>
</button>