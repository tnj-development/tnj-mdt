<script lang="ts">
	import { PLAYER } from "@store/player"
    import { SELECTED_WEAPON } from "@store/weapons";
	import { SendNUI } from "@utils/SendNUI"

    export let weapon: any;
    export let weapModel: string;
    export let owner: string;
    export let serial: string;

    async function SelectWeapon() {
        $SELECTED_WEAPON = weapon;
    }
</script>

<button 
    class="w-full rounded-[0.5vh] p-[1vh] flex flex-col text-start font-medium border-[0.1vh] border-gray_primary hover:bg-dark_tertiary"
    on:click={SelectWeapon}
>
    <h1 class="w-full text-[1.6vh] text-gray-400">
        {weapModel}
    </h1>
    <h1 class="w-full text-[1.3vh] text-gray-500 mt-[0.4vh]">
        <i class="fas fa-user mr-[0.5vh]"></i>
        {owner}
    </h1>
    <h1 class="w-full text-[1.3vh] text-gray-500 mt-[0.4vh]">
        <i class="fas fa-rectangle-list mr-[0.5vh]"></i>
        {serial}
    </h1>
</button>