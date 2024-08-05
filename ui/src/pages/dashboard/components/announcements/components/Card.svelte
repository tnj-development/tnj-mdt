<script lang="ts">
    import { PLAYER } from "@store/player"
	import { ANNOUNCEMENTS } from "@store/announcements"
    import { timeAgo } from "@utils/timeAgo"
    import { SendNUI } from "@utils/SendNUI"
	import Menu from "@components/contextmenu/Menu.svelte"
	import EditModal from "./EditModal.svelte"

    export let id: number;
    export let title: string;
    export let desc: string;
    export let time: string;
    export let author: string;
    export let jobtype: string;

    let showEditModal = false;

    function editAnnoucement() {
        showEditModal = true;
    }

    function deleteAnnoucement() {
        SendNUI("deleteAnnouncement", {
            id: id,
            title: title,
            jobType: $PLAYER.job.type,
            player: $PLAYER.charinfo.firstname + " " + $PLAYER.charinfo.lastname,
        });

        $ANNOUNCEMENTS = $ANNOUNCEMENTS.filter((announcement) => {
            return announcement.id !== id;
        });
    }

    let mouseX;
    let mouseY;
    let showContextMenu = false;
    let contextMenuItems = [
        {
            icon: "fas fa-edit",
            text: "Edit",
            onClick: editAnnoucement,
        },
        {
            icon: "fas fa-trash",
            text: "Delete",
            onClick: deleteAnnoucement,
        },
    ]

</script>

{#if jobtype === $PLAYER.job.type}
    <button 
        on:contextmenu={(e) => {
            showContextMenu = true;
            mouseX = e.clientX;
            mouseY = e.clientY;
        }}
        class="w-full flex flex-col p-[1vh] gap-[0.6vh] text-[1.6vh] text-start text-gray-300 rounded-[0.5vh] border-[0.1vh] border-gray_primary hover:bg-dark_tertiary"
    >
        <h1 class="text-[1.8vh] font-medium">
            {title}
        </h1>
        <p class="text-gray-400">
            {desc}
        </p>
        <div class="w-full flex justify-between text-gray-500 text-[1.3vh]">
            <h3>
                {timeAgo(time)}
            </h3>
            <h3>
                Author: {author}
            </h3>
        </div>
    </button>
{/if}

<Menu 
    show={showContextMenu}
    items={contextMenuItems}
    mouseX={mouseX}
    mouseY={mouseY}
    onClose={() => showContextMenu = false}
/>

<EditModal
    show={showEditModal}
    onClose={() => showEditModal = false}
    id={id}
    title={title}
    desc={desc}
    time={time}
/>