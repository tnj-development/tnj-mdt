<script>
	import SelectedIncident from "./components/Incident/SelectedIncident.svelte"
    import List from "./components/list/List.svelte"
	import IncidentsInvolved from "./components/incidentInvolved/IncidentsInvolved.svelte"
</script>

<div class="w-full h-[80vh] p-[1.5vh] gap-[1.5vh] flex">
    <List />
    <SelectedIncident />
    <IncidentsInvolved />
</div>