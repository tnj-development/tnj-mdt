<script lang="ts">
    import { onMount } from "svelte"

    import { INCIDENTS, SELECTED_INCIDENTS } from "@store/incidents";
	import { PLAYER } from "@store/player"
    import { Notify } from "@store/notify"
    import { LOCALE } from "@store/locales"

	import { SendNUI } from "@utils/SendNUI"

	import Tags from "./Tags.svelte"
	import Evidence from "./Evidence.svelte"
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

        $SELECTED_INCIDENTS = data;

        $INCIDENTS = [data, ...$INCIDENTS];
    }

    async function SaveIncident() {
        let data = await SendNUI("saveIncident", {
            id: $SELECTED_INCIDENTS.id,
            title: $SELECTED_INCIDENTS.title,
            details: $SELECTED_INCIDENTS.details,
            tags: $SELECTED_INCIDENTS.tags,
            officersinvolved: $SELECTED_INCIDENTS.officersinvolved,
            civsinvolved: $SELECTED_INCIDENTS.civsinvolved,
            evidence: $SELECTED_INCIDENTS.evidence,
            author: $PLAYER.charinfo.firstname + " " + $PLAYER.charinfo.lastname,
            jobType: $PLAYER.job.type,
        });

        Notify(`Incident Saved`, `Incident ${data.title} successfully saved.`);

        $INCIDENTS = $INCIDENTS.map((incident) => {
            if (incident.id === data.id) {
                return data;
            }
            return incident;
        });
    }

    function DeleteIncident() {
        SendNUI("deleteIncident", {
            id: $SELECTED_INCIDENTS.id,
            title: $SELECTED_INCIDENTS.title,
            player: $PLAYER.charinfo.firstname + " " + $PLAYER.charinfo.lastname,
            jobType: $PLAYER.job.type,
        });

        Notify(`Incident Deleted`, `Incident ${$SELECTED_INCIDENTS.title} successfully deleted.`);

        $INCIDENTS = $INCIDENTS.filter((incident) => {
            return incident.id !== $SELECTED_INCIDENTS.id;
        });
    
        $SELECTED_INCIDENTS = null;
    }

</script>

<div class="h-full w-full p-[1vh] bg-dark_secondary rounded-[0.5vh] border-[0.1vh] border-gray_primary">
    <div class="h-[5vh] flex justify-between items-center border-b-[0.1vh] border-gray_primary text-gray-400">
        <div class="px-[1vh] flex items-center gap-[1vh] font-medium">
            <i class="fas fa-file-lines"></i>
            <h1>
                {$LOCALE.ui.incidents.manage_incident} {$SELECTED_INCIDENTS ? "- ID: " + $SELECTED_INCIDENTS.id : "" }
            </h1>
        </div>
        {#if $PLAYER.job.type !== 'doj'}
            <div>
                {#if $SELECTED_INCIDENTS}
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
            {#if $SELECTED_INCIDENTS}
                <input 
                    type="text" 
                    placeholder="Incident Title"
                    bind:value={$SELECTED_INCIDENTS.title}
                    class="w-full px-[1vh] bg-transparent"
                >
            {:else}
                <input type="text" placeholder="Incident Title" class="w-full px-[1vh] bg-transparent">
            {/if}
        </div>

        <Details />

        <div class="w-full h-full pr-[0.5vh] flex flex-col gap-[1vh] overflow-auto">
            <Tags tags={$SELECTED_INCIDENTS?.tags}/>
            <Evidence evidence={$SELECTED_INCIDENTS?.evidence} />
            <OfficersInvolved officers={$SELECTED_INCIDENTS?.officersinvolved} />
            <CiviliansInvolved civilians={$SELECTED_INCIDENTS?.civsinvolved} />
        </div>
    </div>
</div>
