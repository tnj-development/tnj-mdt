<script lang="ts">
    import { Notify } from "@store/notify"
	import { PLAYER } from "@store/player"
    import { PROFILES, SELECTED_PROFILE } from "@store/profiles"
    import { LOCALE } from "@store/locales"

    import { SendNUI } from "@utils/SendNUI"

	import TextEditor from "@components/TextEditor.svelte"
	import Tags from "./Tags.svelte"
	import Licences from "./Licences.svelte"
	import Vehicles from "./Vehicles.svelte"
	import Properties from "./Properties.svelte"
	import Gallery from "./Gallery.svelte"

    let showPFPModal = false;

    async function saveProfile() {
        console.log($SELECTED_PROFILE)
        let data = await SendNUI("saveProfile", {
            id: $SELECTED_PROFILE.id,
            cid: $SELECTED_PROFILE.cid,
            information: $SELECTED_PROFILE.information,
            tags: $SELECTED_PROFILE.tags ? $SELECTED_PROFILE.tags : [],
            gallery: $SELECTED_PROFILE.gallery ? $SELECTED_PROFILE.gallery : [],
            pfp: $SELECTED_PROFILE.pfp ? $SELECTED_PROFILE.pfp : "https://uzex.uz/images/blog/image_not_found.png",
            fingerprint: $SELECTED_PROFILE.fingerprint ? $SELECTED_PROFILE.fingerprint : "",
            jobtype: $SELECTED_PROFILE.jobtype,
        });

        console.log(data)

        Notify(`Profile Saved`, `${$SELECTED_PROFILE.fullname} successfully saved.`);

        $PROFILES = $PROFILES.map((profile) => {
            if (profile.id === $SELECTED_PROFILE.id) {
                return data;
            }
            return profile;
        });
    }

    function UpdateImg() {

    }

</script>

<div class="h-full w-full flex flex-col p-[1vh] gap-[1vh] bg-dark_secondary rounded-[0.5vh] border-[0.1vh] border-gray_primary">
    <div class="h-[5vh] w-full flex justify-between items-center border-b-[0.1vh] border-gray_primary text-gray-400">
        <div class="px-[1vh] flex items-center gap-[1vh] font-medium">
            <i class="fas fa-file-lines"></i>
            <h1>
                {$LOCALE.ui.profiles.manage_profile} {$SELECTED_PROFILE ? "- ID: #" + $SELECTED_PROFILE.cid : "" }
            </h1>
        </div>
        {#if $PLAYER.job.type !== 'doj' && $SELECTED_PROFILE}
            <button 
                class="w-[3vh] h-[3vh] rounded-[0.5vh] hover:bg-dark_tertiary"
                on:click={saveProfile}
            >
                <i class="fas fa-floppy-disk"></i>
            </button> 
        {/if}
    </div>

    <div class="w-full flex gap-[1vh] h-[69vh]">
        <div class="w-full h-full flex flex-col gap-[1vh]">
            <div class="w-full h-[24.5vh] flex  p-[1vh] rounded-[0.5vh] border-[0.1vh] border-gray_primary bg-dark_tertiary">
                <button 
                    on:click={() => showPFPModal = true}
                    class="w-[25vh] h-full relative"
                >
                    <img 
                        src={$SELECTED_PROFILE?.pfp ? $SELECTED_PROFILE.pfp : "https://uzex.uz/images/blog/image_not_found.png"} 
                        alt="pfp"
                        class="w-full h-full object-cover rounded-[0.5vh]"
                    >
                    <div class="absolute inset-0 flex items-center justify-center rounded-[0.5vh] opacity-0 transition-opacity duration-300 bg-black bg-opacity-60 hover:opacity-100">
                        <i class="fas fa-pen-to-square text-gray-400 text-[2.5vh]"></i>
                    </div>
                </button>
                <div class="w-full h-full pl-[1vh] text-[1.5vh] text-gray-400 font-medium">
                    <div class="w-full border-b-[0.1vh] border-gray_primary">
                        <p class="text-[1.4vh]">
                            {$LOCALE.ui.profiles.fullname}
                        </p>
                        <i class="fas fa-user"></i>
                        <span>
                            {$SELECTED_PROFILE?.fullname ? $SELECTED_PROFILE.fullname : $LOCALE.ui.profiles.fullname}
                        </span>
                    </div>
                    <div class="w-full border-b-[0.1vh] border-gray_primary">
                        <p class="text-[1.4vh]">
                            {$LOCALE.ui.profiles.birthdate}
                        </p>
                        <i class="fas fa-user"></i>
                        <span>
                            {$SELECTED_PROFILE?.birthdate ? $SELECTED_PROFILE.birthdate : $LOCALE.ui.profiles.birthdate}
                        </span>
                    </div>
                    <div class="w-full border-b-[0.1vh] border-gray_primary">
                        <p class="text-[1.4vh]">
                            {$LOCALE.ui.profiles.gender}
                        </p>
                        <i class="fas fa-user"></i>
                        <span>
                            {$SELECTED_PROFILE?.gender === 0 ? $LOCALE.ui.profiles.genders.male : $LOCALE.ui.profiles.genders.female}
                        </span>
                    </div>
                    <div class="w-full border-b-[0.1vh] border-gray_primary">
                        <p class="text-[1.4vh]">
                            {$LOCALE.ui.profiles.phonenumber}
                        </p>
                        <i class="fas fa-user"></i>
                        <span>
                            {$SELECTED_PROFILE?.phoneNumber ? $SELECTED_PROFILE.phoneNumber : $LOCALE.ui.profiles.phonenumber}
                        </span>
                    </div>
                    <div class="w-full">
                        <p class="text-[1.4vh]">
                            {$LOCALE.ui.profiles.job}
                        </p>
                        <i class="fas fa-user"></i>
                        <span>
                            {$SELECTED_PROFILE?.job ? $SELECTED_PROFILE.job+" - "+$SELECTED_PROFILE.jobGrade : $LOCALE.ui.profiles.job}
                        </span>
                    </div>
                </div>
            </div>
            <div class="w-full flex flex-col rounded-[0.5vh] border-[0.1vh] border-gray_primary bg-dark_tertiary text-gray-400">
                <TextEditor />
                {#if $SELECTED_PROFILE?.information}
                    <div 
                        id="editor" 
                        contenteditable="true"
                        class="w-full h-[39.5vh] rounded-b-[0.5vh] p-[1vh] overflow-auto" 
                        bind:innerHTML={$SELECTED_PROFILE.information}
                    ></div>
                {:else}
                    <div 
                        id="editor" 
                        contenteditable="true"
                        class="w-full h-[39.5vh] rounded-b-[0.5vh] p-[1vh] overflow-auto" 
                    >
                        No Information.
                    </div>
                {/if}
            </div>
        </div>
        <div class="border-l-[0.1vh] border-gray_primary"></div>
        <div class="w-full h-full flex flex-col gap-[1vh]">
            <Licences />
            <Tags />
            <Vehicles />
            <Properties />
            <Gallery />
        </div>
    </div>
</div>

{#if showPFPModal && $SELECTED_PROFILE}
    <button 
        on:click={() => showPFPModal = false}
        class="w-screen h-screen fixed top-0 left-0 right-0 bottom-0 bg-black bg-opacity-50 flex items-center justify-center"
    >
        <button class="max-w-[100vh] max-h-[75vh] min-w-[40vh] rounded-[0.5vh] bg-dark_secondary border-gray_primary border-[0.1vh]" on:click|stopPropagation>
            <div class="h-[3vh] flex items-center justify-between px-[1vh] text-gray-400 font-medium border-gray_primary border-b-[0.1vh]">
                <h1>
                    Update Image
                </h1>
                <button
                    on:click={() => showPFPModal = false }
                    class="hover:text-white"
                >
                    <i class="fas fa-xmark"></i>
                </button>
            </div>
            <div class="w-full flex flex-col gap-[1vh] py-[1vh] px-[1vh]">
                <div class="flex items-center gap-[0.5vh] text-gray-400">
                    <i class="fas fa-image"></i>
                    <input 
                        type="text"
                        bind:value={$SELECTED_PROFILE.pfp}
                        class=" bg-transparent w-full border-b-[0.1vh] border-gray_primary"
                    >

                </div>
                <button
                    on:click={UpdateImg}
                    class=" bg-dark_tertiary hover:bg-dark_quaternary py-[0.1vh] px-[1vh] rounded-[0.5vh] text-[1.4vh] text-gray-400 font-medium"
                >
                    Update
                </button>
            </div>
        </button>
    </button>
{/if}