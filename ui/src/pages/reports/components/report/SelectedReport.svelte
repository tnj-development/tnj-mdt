<script lang="ts">
    import { onMount } from "svelte"
    import { REPORTS, SELECTED_REPORTS } from "@store/reports"
	import { PLAYER } from "@store/player"
    import { Notify } from "@store/notify"
    import { LOCALE } from "@store/locales"

	import { SendNUI } from "@utils/SendNUI"

	import Tags from "./Tags.svelte"
	import Gallery from "./Gallery.svelte"
	import OfficersInvolved from "./OfficersInvolved.svelte"
    import CiviliansInvolved from "./CiviliansInvolved.svelte"
	import Details from "./Details.svelte"

    async function NewIncident() {
        let data = await SendNUI("newIncident", {
            title: "",
            details: "",
            tags: [],
            officersinvolved: [],
            civsinvolved: [],
            evidence: [],
            author: $PLAYER.charinfo.firstname + " " + $PLAYER.charinfo.lastname,
            jobType: $PLAYER.job.type,
        });

        Notify(`Incident Created`, `Incident ${data.id} successfully created.`);

        $SELECTED_REPORTS = data;

        $REPORTS = [data, ...$REPORTS];
    }

    async function SaveIncident() {
        let data = await SendNUI("editIncident", {
            id: $SELECTED_REPORTS.id,
            title: $SELECTED_REPORTS.title,
            details: $SELECTED_REPORTS.details,
            tags: $SELECTED_REPORTS.tags,
            officersinvolved: $SELECTED_REPORTS.officersinvolved,
            civsinvolved: $SELECTED_REPORTS.civsinvolved,
            evidence: $SELECTED_REPORTS.evidence,
            author: $PLAYER.charinfo.firstname + " " + $PLAYER.charinfo.lastname,
            jobType: $PLAYER.job.type,
        });

        Notify(`Incident Saved`, `Incident ${data.title} successfully saved.`);

        $REPORTS = $REPORTS.map((incident) => {
            if (incident.id === data.id) {
                return data;
            }
            return incident;
        });
    }

    function DeleteIncident() {
        SendNUI("deleteIncident", {
            id: $SELECTED_REPORTS.id,
            title: $SELECTED_REPORTS.title,
            player: $PLAYER.charinfo.firstname + " " + $PLAYER.charinfo.lastname,
            jobType: $PLAYER.job.type,
        });

        Notify(`Incident Deleted`, `Incident ${$SELECTED_REPORTS.title} successfully deleted.`);

        $REPORTS = $REPORTS.filter((incident) => {
            return incident.id !== $SELECTED_REPORTS.id;
        });
    
        $SELECTED_REPORTS = null;
    }

</script>

<div class="h-full w-full p-[1vh] bg-dark_secondary rounded-[0.5vh] border-[0.1vh] border-gray_primary">
    <div class="h-[5vh] flex justify-between items-center border-b-[0.1vh] border-gray_primary text-gray-400">
        <div class="px-[1vh] flex items-center gap-[1vh] font-medium">
            <i class="fas fa-file-lines"></i>
            <h1>
                {$LOCALE.ui.incidents.manage_incident} {$SELECTED_REPORTS ? "- ID: " + $SELECTED_REPORTS.id : "" }
            </h1>
        </div>
        {#if $PLAYER.job.type !== 'doj'}
            <div>
                {#if $SELECTED_REPORTS}
                    <button 
                        class="w-[3vh] h-[3vh] rounded-[0.5vh] hover:bg-dark_tertiary"
                        on:click={DeleteIncident}
                    >
                        <i class="fas fa-trash"></i>
                    </button>
                {/if}
                <button 
                    class="w-[3vh] h-[3vh] rounded-[0.5vh] hover:bg-dark_tertiary"
                    on:click={SaveIncident}
                >
                    <i class="fas fa-floppy-disk"></i>
                </button>
                <button 
                    class="w-[3vh] h-[3vh] rounded-[0.5vh] hover:bg-dark_tertiary"
                    on:click={NewIncident}
                >
                    <i class="fas fa-plus"></i>
                </button>
            </div>
        {/if}
    </div>

    <div class="w-full h-[70vh] flex flex-col gap-[1vh] py-[1vh]">
        <div class="w-full min-h-[5vh] rounded-[0.5vh] border-[0.1vh] border-gray_primary bg-dark_tertiary flex items-center px-[1.5vh] text-gray-400">
            <i class="far fa-pen-to-square"></i>
            {#if $SELECTED_REPORTS}
                <input 
                    type="text" 
                    placeholder="Incident Title"
                    bind:value={$SELECTED_REPORTS.title}
                    class="w-full px-[1vh] bg-transparent"
                >
            {:else}
                <input type="text" placeholder="Incident Title" class="w-full px-[1vh] bg-transparent">
            {/if}
        </div>

        <div class="w-full min-h-[5vh] rounded-[0.5vh] border-[0.1vh] border-gray_primary bg-dark_tertiary flex items-center px-[1.5vh] text-gray-400">
            <i class="far fa-pen-to-square"></i>
            {#if $SELECTED_REPORTS}
                <input 
                    type="text" 
                    placeholder="Incident Title"
                    bind:value={$SELECTED_REPORTS.title}
                    class="w-full px-[1vh] bg-transparent"
                >
            {:else}
                <input type="text" placeholder="Incident Title" class="w-full px-[1vh] bg-transparent">
            {/if}
        </div>

        <Details />
    </div>
</div>

<div class="h-full min-w-[35vh] p-[1vh] bg-dark_secondary rounded-[0.5vh] border-[0.1vh] border-gray_primary">

    <div class="w-full h-full pr-[0.5vh] flex flex-col gap-[1vh] overflow-auto">
        <Tags tags={$SELECTED_REPORTS?.tags}/>
        <Gallery gallery={$SELECTED_REPORTS?.gallery} />
        <OfficersInvolved officers={$SELECTED_REPORTS?.officersinvolved} />
        <CiviliansInvolved civilians={$SELECTED_REPORTS?.civsinvolved} />
    </div>

</div>
