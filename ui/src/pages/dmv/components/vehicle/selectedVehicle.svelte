<script lang="ts">
    import { Notify } from "@store/notify";
	import { PLAYER } from "@store/player"
    import { SELECTED_VEHICLE } from "@store/dmv";
    import { LOCALE } from "@store/locales";
	import TextEditor from "@components/TextEditor.svelte"

    let showImageModal = false;

    function saveVehicle() {

        Notify(`Profile Saved`, `${$SELECTED_VEHICLE.plate} successfully saved.`);

    }
</script>

<div class="h-full w-full flex flex-col p-[1vh] gap-[1vh] bg-dark_secondary rounded-[0.5vh] border-[0.1vh] border-gray_primary">
    <div class="h-[5vh] w-full flex justify-between items-center border-b-[0.1vh] border-gray_primary text-gray-400">
        <div class="px-[1vh] flex items-center gap-[1vh] font-medium">
            <i class="fas fa-file-lines"></i>
            <h1>
                {$LOCALE.managevehicle} {$SELECTED_VEHICLE ? "- " + $SELECTED_VEHICLE.plate : "" }
            </h1>
        </div>
        <button 
            class="w-[3vh] h-[3vh] rounded-[0.5vh] hover:bg-dark_tertiary"
            on:click={saveVehicle}
        >
            <i class="fas fa-floppy-disk"></i>
        </button> 
    </div>

    <div class="w-full flex gap-[1vh] h-[69vh]">
        <div class="w-full h-full flex flex-col gap-[1vh]">
            <div class="w-full h-[24.5vh] flex  p-[1vh] rounded-[0.5vh] border-[0.1vh] border-gray_primary bg-dark_tertiary">
                <button 
                    on:click={() => showImageModal = true}
                    class="w-[25vh] h-full relative"
                >
                    <!-- <img 
                        src={$SELECTED_VEHICLE.image ? $SELECTED_VEHICLE.image : "https://uzex.uz/images/blog/image_not_found.png"} 
                        alt={$SELECTED_VEHICLE.model}
                        class="w-full h-full object-cover rounded-[0.5vh]"
                    > -->
                    <img 
                        src={"https://uzex.uz/images/blog/image_not_found.png"} 
                        alt=""
                        class="w-full h-full object-cover rounded-[0.5vh]"
                    >
                    <div class="absolute inset-0 flex items-center justify-center rounded-[0.5vh] opacity-0 transition-opacity duration-300 bg-black bg-opacity-60 hover:opacity-100">
                        <i class="fas fa-pen-to-square text-gray-400 text-[2.5vh]"></i>
                    </div>
                </button>
                <div class="w-full h-full pl-[1vh] text-[1.5vh] text-gray-400 font-medium">
                    <h1 class="text-[1.5vh]">{$SELECTED_VEHICLE ? $SELECTED_VEHICLE.isVinScrached : ""}</h1>
                    <div class="w-full border-b-[0.1vh] border-gray_primary">
                        <p class="text-[1.4vh]">{$LOCALE.vehiclelabel}</p>
                        <i class="fas fa-user"></i>
                        <span>{$SELECTED_VEHICLE ? $SELECTED_VEHICLE.label : ""}</span>
                    </div>
                    <div class="w-full border-b-[0.1vh] border-gray_primary">
                        <p class="text-[1.4vh]">{$LOCALE.vehiclemodel}</p>
                        <i class="fas fa-user"></i>
                        <span>{$SELECTED_VEHICLE ? $SELECTED_VEHICLE.model : ""}</span>
                    </div>
                    <div class="w-full border-b-[0.1vh] border-gray_primary">
                        <p class="text-[1.4vh]">{$LOCALE.vehicleplate}</p>
                        <i class="fas fa-user"></i>
                        <span>{$SELECTED_VEHICLE ? $SELECTED_VEHICLE.plate : ""}</span>
                    </div>
                </div>
            </div>
            <div class="w-full flex flex-col rounded-[0.5vh] border-[0.1vh] border-gray_primary bg-dark_tertiary text-gray-400">
                <TextEditor />
                <!-- {#if $SELECTED_VEHICLE.information}
                    <div 
                        id="editor" 
                        contenteditable="true"
                        class="w-full h-[39.5vh] rounded-b-[0.5vh] p-[1vh] overflow-auto" 
                        bind:innerHTML={$SELECTED_VEHICLE.information}
                    ></div>
                {:else} -->
                    <div 
                        id="editor" 
                        contenteditable="true"
                        class="w-full h-[39.5vh] rounded-b-[0.5vh] p-[1vh] overflow-auto" 
                    >
                        {$LOCALE.noinformation}
                    </div>
                <!-- {/if} -->
            </div>
        </div>
        <div class="border-l-[0.1vh] border-gray_primary"></div>
        <div class="w-full h-full flex flex-col gap-[1vh]">

        </div>
    </div>
</div>