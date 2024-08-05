<script>
    import { LOCALE } from "@store/locales";
    import { SELECTED_WEAPON } from "@store/weapons";
	import { SendNUI } from "@utils/SendNUI"

    function CreateWeapon() {
        console.log("CreateWeapon")
    }

    function SaveWeapon() {
        console.log($SELECTED_WEAPON.information)
        let data = SendNUI("saveWeapon", {
            id: $SELECTED_WEAPON.id,
            information: $SELECTED_WEAPON.information,
        })
    }

    let img = ""
</script>

<div class="h-full w-full flex flex-col p-[1vh] gap-[1vh] bg-dark_secondary rounded-[0.5vh] border-[0.1vh] border-gray_primary">
    <div class="h-[5vh] w-full flex justify-between items-center border-b-[0.1vh] border-gray_primary text-gray-400">
        <div class="px-[1vh] flex items-center gap-[1vh] font-medium">
            <i class="fas fa-gun"></i>
            <h1>
                {$LOCALE.ui.weapons.manage_weapon} {$SELECTED_WEAPON ? "- ID: #" + $SELECTED_WEAPON.id : "" }
            </h1>
        </div>
        <div class="flex gap-[0.5vh]">
            {#if $SELECTED_WEAPON}
                <button 
                    class="w-[3vh] h-[3vh] rounded-[0.5vh] hover:bg-dark_tertiary"
                    on:click={SaveWeapon}
                >
                    <i class="fas fa-floppy-disk"></i>
                </button> 
            {/if}
            <button 
                class="w-[3vh] h-[3vh] rounded-[0.5vh] hover:bg-dark_tertiary"
                on:click={CreateWeapon}
            >
                <i class="fas fa-plus"></i>
            </button> 
        </div>
    </div>

    <div class="w-full h-[69vh] flex flex-col gap-[1vh]">
        <h1>Id: {$SELECTED_WEAPON?.id}</h1>
        <img 
            src={"nui://ox_inventory/web/images/"+$SELECTED_WEAPON?.image+".png"} 
            alt="weapon_image"
            class="w-[10vh]" 
        >
        <h1>Serienummer: {$SELECTED_WEAPON?.serial}</h1>
        <h1>Registert Til: {$SELECTED_WEAPON?.owner}</h1>
        <h1>Modell: {$SELECTED_WEAPON?.weapModel}</h1>
        <h1>Klasse: {$SELECTED_WEAPON?.weapClass}</h1>
        <h1>Våpen Notat: {$SELECTED_WEAPON?.information}</h1>
        {#if $SELECTED_WEAPON}
            <textarea
                id="editor" 
                contenteditable="true"
                bind:innerHTML={$SELECTED_WEAPON.information}
            > 
            </textarea>
        {/if}
    </div>
</div>