<script lang="ts">
    import { LOCALE } from "@store/locales";
    import { PLAYER } from "@store/player"
    import { ANNOUNCEMENTS } from "@store/announcements"
	import { SendNUI } from "@utils/SendNUI"

    export let show: boolean;
    export let onClose: () => void;
    export let id: number;
    export let title: string;
    export let desc: string;
    export let time: string;

    async function SaveAnnouncement() {
        if (title.length < 1 || desc.length < 1) return;

        let upperTitle = title.charAt(0).toUpperCase() + title.slice(1);
        let upperDesc = desc.charAt(0).toUpperCase() + desc.slice(1);

        let data = await SendNUI("editAnnouncement", {
            id: id,
            title: upperTitle,
            desc: upperDesc,
            time: time,
            author: $PLAYER.charinfo.firstname + " " + $PLAYER.charinfo.lastname,
            jobType: $PLAYER.job.type,
        });

        const index = $ANNOUNCEMENTS.findIndex(a => a.id === id);
        if (index !== -1) {
            $ANNOUNCEMENTS[index] = data;
        }

        title = "";
        desc = "";

        onClose();
    }

</script>

<div 
    class="{show ? "" : "hidden"} w-screen h-screen fixed top-0 bottom-0 left-0 right-0 flex items-center justify-center bg-black bg-opacity-50"
>
    <div class="w-[45vh] px-[1vh] flex flex-col gap-[0.2vh] bg-dark_primary rounded-[0.5vh] border-[0.1vh] border-gray_primary">

        <div class="h-[5vh] flex justify-between items-center border-b-[0.1vh] border-gray_primary text-gray-400">
            <div class="px-[1vh] flex items-center gap-[1vh] font-medium">
                <i class="fas fa-bullhorn"></i>
                <h1>
                    Rediger Kunngjøring
                </h1>
            </div>
            <button 
                class="w-[3vh] h-[3vh] rounded-[0.5vh] hover:bg-dark_tertiary"
                on:click={onClose}
            >
                <i class="fas fa-xmark"></i>
            </button>
        </div>

        <div>
            <h1 class="text-gray-400">
                Tittel:
            </h1>
            <input 
                type="text"
                placeholder="Tittel"
                bind:value={title}
                class="w-full h-[4vh] bg-dark_secondary rounded-[0.5vh] border-[0.1vh] border-gray_primary px-[0.8vh]"
            >
        </div>

        <div>
            <h1 class="text-gray-400">
                Beskrivelse:
            </h1>
            <textarea
                placeholder="Beskrivelse"
                value={desc}
                on:input={e => desc = e.target.value}
                class="w-full min-h-[14vh] max-h-[14vh] bg-dark_secondary rounded-[0.5vh] border-[0.1vh] border-gray_primary p-[0.8vh]"
            ></textarea>
        </div>

        <div class="w-full flex flex-row gap-[0.5vh] pb-[1vh]">
            <button
                class="w-[8vh] h-[4vh] font-medium bg-dark_secondary hover:bg-dark_tertiary rounded-[0.5vh] border-[0.1vh] border-gray_primary px-[0.8vh]"
                on:click={onClose}
            >            
                Lukk
            </button>
            <button
                class="w-full h-[4vh] font-medium bg-dark_secondary hover:bg-dark_tertiary rounded-[0.5vh] border-[0.1vh] border-gray_primary px-[0.8vh]"
                on:click={SaveAnnouncement}
            >            
                Large Kunngjøring
            </button>
        </div>

    </div>
</div>