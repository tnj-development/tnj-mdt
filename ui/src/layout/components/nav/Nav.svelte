<script lang="ts">
    import { LOCALE } from "@store/locales"

    import Dashboard from '@pages/dashboard/Dashboard.svelte'
	import Profiles from '@pages/profiles/Profiles.svelte'
	import Incidents from '@pages/incidents/Incidents.svelte'
	import Reports from '@pages/reports/Reports.svelte'
	import Cameras from '@pages/cameras/Cameras.svelte'
	import Dispatch from '@pages/dispatch/Dispatch.svelte'
	import Logs from '@pages/logs/Logs.svelte'
	import Vehicles from '@pages/dmv/Vehicles.svelte'
	import Weapons from '@pages/weapons/Weapons.svelte'

	import NavHeader from "./components/NavHeader.svelte"
	import NavProfile from "./components/NavProfile.svelte"
	import NavButton from "./components/NavButton.svelte"
	import NavCategory from "./components/NavCategory.svelte"
	import LawData from "@pages/iframes/LawData.svelte"
	import HandBook from "@pages/iframes/HandBook.svelte"
	import EMSHandbook from "@pages/iframes/EMSHandbook.svelte"
	import LegalProcedure from "@pages/iframes/LegalProcedure.svelte"
	import HandBookRobbery from "@pages/iframes/HandBookRobbery.svelte"

	let navigations = [
		{
			label: $LOCALE.ui.navigation.dashboard,
			icon: 'fas fa-house',
			value: 'dashboard',
            jobtypes: ['leo', 'ems', 'doj'],
			component: Dashboard,
		},
		{
			label: $LOCALE.ui.navigation.profiles,
			icon: 'fas fa-database',
			value: 'profiles',
            jobtypes: ['leo', 'ems', 'doj'],
			component: Profiles,
		},
		{
			label: $LOCALE.ui.navigation.incidents,
			icon: 'fas fa-file-lines',
			value: 'incidents',
            jobtypes: ['leo', 'ems', 'doj'],
			component: Incidents,
		},
		{
			label: $LOCALE.ui.navigation.reports,
			icon: 'fas fa-file-lines',
			value: 'reports',
            jobtypes: ['leo', 'ems', 'doj'],
			component: Reports,
		},
		{
			label: $LOCALE.ui.navigation.documents,
			icon: 'fas fa-book',
            jobtypes: ['leo'],
			dropdownData: [
				{
					label: "Politimanualen",
					icon: 'fas fa-file-lines',
					value: 'handbook',
					jobtypes: ['leo'],
					component: HandBook,
				},
				{
					label: "Lovdata",
					icon: 'fas fa-section',
					value: 'lawdata',
					jobtypes: ['leo'],
					component: LawData,
				},
				{
					label: "Juridisk Prosedyre",
					icon: 'fas fa-section',
					value: 'legalprocedure',
					jobtypes: ['leo'],
					component: LegalProcedure,
				},
				{
					label: "Brukermanual under ran",
					icon: 'fas fa-file-lines',
					value: 'handbookrobbery',
					jobtypes: ['leo'],
					component: HandBookRobbery,
				},
			]
		},
		{
			label: "Håndbok",
			icon: 'fas fa-file-lines',
			value: 'emshandbook',
            jobtypes: ['ems'],
			component: EMSHandbook,
		},
		// {
		// 	label: $LOCALE.ui.navigation.dispatch,
		// 	icon: 'fas fa-map',
		// 	value: 'dispatch',
        //     jobtypes: ['leo', 'ems'],
		// 	component: Dispatch,
		// },
		{
			label: $LOCALE.ui.navigation.vehicles,
			icon: 'fas fa-car-side',
			value: 'vehicles',
            jobtypes: ['leo'],
			component: Vehicles,
		},
		{
			label: $LOCALE.ui.navigation.weapons,
			icon: 'fas fa-gun',
			value: 'weapons',
            jobtypes: ['leo'],
			component: Weapons,
		},
		{
			label: $LOCALE.ui.navigation.cameras,
			icon: 'fas fa-video',
			value: 'cameras',
            jobtypes: ['leo'],
			component: Cameras,
		},
		// {
		// 	label: $LOCALE.ui.navigation.evidence,
		// 	icon: 'fas fa-box-archive',
		// 	value: 'evidence',
        //     jobtypes: ['leo'],
		// 	component: Reports,
		// },
		{
			label: $LOCALE.ui.navigation.logs,
			icon: 'fas fa-file-lines',
			value: 'logs',
            jobtypes: ['leo', 'ems', 'doj'],
			component: Logs,
		},
		// {
		// 	label: $LOCALE.ui.navigation.settings,
		// 	icon: 'fas fa-sliders',
		// 	value: 'settings',
        //     jobtypes: ['leo', 'ems', 'doj'],
		// 	component: Reports,
		// },
	]

</script>

<div class="h-full w-[30vh] bg-dark_secondary rounded-l-[0.5vh] border-r-[0.1vh] border-gray_primary flex flex-col">
    <NavHeader />
	<div class="h-[90vh] w-full flex flex-col overflow-auto">
		{#each navigations as item}
			{#if item.dropdownData}
				<NavCategory 
					icon={item.icon} 
					label={item.label} 
					jobtypes={item.jobtypes}
					dropdown={item.dropdownData}
				/>
			{:else}
				<NavButton 
					icon={item.icon} 
					label={item.label} 
					value={item.value} 
					jobtypes={item.jobtypes}
					component={item.component}
				/>
			{/if}
		{/each}
	</div>
    <NavProfile />
</div>