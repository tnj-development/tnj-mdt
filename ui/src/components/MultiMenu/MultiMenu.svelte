<script lang="ts">
    import { LOCALE } from "@store/locales"
    import { ACTIVE_MULTI_MENU } from "@store/multimenu"

	import Search from "@components/Search.svelte"
	import Button from "./components/Button.svelte"
	import ActiveOfficers from "./components/ActiveOfficers/ActiveOfficersList.svelte"
	import Units from "./components/Units/Units.svelte"
	import DispatchList from "./components/Dispatch/DispatchList.svelte"

    let search = ""

    let pages = [
        { jobtypes: ["leo", "ems", "laywer"], icon: 'fas fa-user-group', value: "officers", component: ActiveOfficers },
        { jobtypes: ["leo", "ems"], icon: 'fas fa-users', value: "units", component: Units },
        { jobtypes: ["leo", "ems"], icon: 'fas fa-circle-exclamation', value: "dispatch", component: DispatchList },
    ]

</script>

<div class="h-full w-full p-[1vh] bg-dark_secondary rounded-[0.5vh] border-[0.1vh] border-gray_primary">
    <div class="w-full h-[5vh] flex gap-[0.5vh]">
        <Search
            label={$LOCALE.ui.shared.search}
            bind:search={search}
            onInput={() => {}}
        />
        {#each pages as item}
            <Button
                jobtypes={item.jobtypes}
                icon={item.icon}
                value={item.value}
                component={item.component}
            />
        {/each}
    </div>
    <svelte:component this={$ACTIVE_MULTI_MENU.component} />
</div>