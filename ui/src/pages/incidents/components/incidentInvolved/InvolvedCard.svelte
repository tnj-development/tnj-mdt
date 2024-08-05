<script lang="ts">
    import { LOCALE } from "@store/locales";
    export let item: any;

    function SaveInvolvedCrim() {
        console.log("Save Involved Criminal");
    }

    function DeleteInvolvedCrim() {
        console.log("Delete Involved Criminal");
    }

    function AddCharges() {
        console.log("Add Charges");
    }
</script>

<button class="w-full flex flex-col p-[1vh] gap-[1vh] rounded-[0.5vh] border-[0.1vh] text-[1.6vh] border-gray_primary text-gray-400 bg-dark_tertiary">
    <div class="w-full flex justify-between">
        <h1 class="font-medium">
            {item.name}
        </h1>
        <div>
            <button 
                class="w-[3vh] h-[3vh] rounded-[0.5vh] hover:bg-dark_quaternary"
                on:click={DeleteInvolvedCrim}
            >
                <i class="fas fa-xmark"></i>
            </button>
        </div>
    </div>
    <div class="w-full flex flex-col gap-[1vh] text-[1.3vh]">
        <button 
            class="w-full flex flex-col gap-[0.8vh] p-[1vh] bg-dark_secondary rounded-[0.5vh]"
            on:click={AddCharges}
        >
            <p class="w-full text-start">
                {$LOCALE.charges}
            </p>
            <div class="flex gap-[0.5vh]">
                {#each item.charges as charge}
                    <div class="px-[1vh] py-[0.2vh] rounded-[0.5vh] bg-dark_quaternary">
                        <h1>
                            {charge.name}
                        </h1>
                    </div>
                {/each}
            </div>
        </button>
        <div class="w-full flex flex-col gap-[0.8vh] p-[1vh] bg-dark_secondary rounded-[0.5vh]">
            <p class="w-full text-start">
                Final
            </p>
            <div class="flex flex-col text-start gap-[0.5vh]">
                <p>
                    0 Months
                </p>
                <p>
                    $69 Fine
                </p>
            </div>
        </div>
    </div>
</button>
