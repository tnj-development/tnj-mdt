<script lang="ts">
    import { SELECTED_PROFILE } from "@store/profiles";
	import { PLAYER } from "@store/player"
	import { Notify } from "@store/notify"
	import { SendNUI } from "@utils/SendNUI"
    import { LOCALE } from "@store/locales";
	import Menu from "@components/contextmenu/Menu.svelte"

    function HandleLicence(key: string, value: boolean) {
        if (value) {
            SendNUI("removeLicence", { 
                citizenid: $SELECTED_PROFILE.citizenid,
                licence: key,
            })
        } else {
            SendNUI("grantLicence", { 
                citizenid: $SELECTED_PROFILE.citizenid,
                licence: key,
            })
        }

        $SELECTED_PROFILE.licences[key] = !value;
    }

    let mouseX;
    let mouseY;
    let showContextMenu = false;
    let contextMenuItems = [
        {
            icon: "fas fa-edit",
            text: "Gi lisense",
            onClick: HandleLicence,
        },
        {
            icon: "fas fa-trash",
            text: "Fjern lisense",
            onClick: HandleLicence,
        },
    ]
 
</script>

<div class="w-full flex flex-col px-[1.5vh] rounded-[0.5vh] border-[0.1vh] border-gray_primary bg-dark_tertiary text-gray-400">
    <div class="w-full h-[5vh] flex justify-between items-center">
        <div class="flex items-center">
            <i class="fas fa-id-card"></i>
            <h1 class="px-[1vh]">
                {$LOCALE.ui.profiles.licences}
            </h1>
        </div>
    </div>

    {#if $SELECTED_PROFILE?.licences}
        <div class="w-full flex flex-wrap gap-[0.5vh] pb-[1.5vh] text-[1.3vh]">
            {#if $SELECTED_PROFILE}
                {#each Object.entries($SELECTED_PROFILE.licences) as [key, value]}
                    <div class="px-[1vh] py-[0.2vh] rounded-[0.5vh] {value ? "bg-dark_quaternary" : " bg-dark_senary"}">
                        <button
                            on:contextmenu={(e) => {
                                showContextMenu = true;
                                mouseX = e.clientX;
                                mouseY = e.clientY;
                            }}
                        >
                            <span>{key.charAt(0).toUpperCase() + key.slice(1)}</span>
                        </button>
                    </div>
                {/each}
            {/if}
        </div>
    {/if}
</div>

<Menu
    show={showContextMenu}
    items={contextMenuItems}
    mouseX={mouseX}
    mouseY={mouseY}
    onClose={() => showContextMenu = false}
/>