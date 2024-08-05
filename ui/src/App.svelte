<script lang="ts">
	import { onMount } from 'svelte'

	import VisibilityProvider from '@providers/VisibilityProvider.svelte'
	import DebugBrowser from '@providers/DebugBrowser.svelte'
	import AlwaysListener from '@providers/AlwaysListener.svelte'

	import Main from '@layout/Main.svelte'
	import Dashboard from '@pages/dashboard/Dashboard.svelte'
	import ActiveOfficers from '@components/multiMenu/components/ActiveOfficers/ActiveOfficersList.svelte'

	import { ACTIVE_PAGE, BROWSER_MODE, RESOURCE_NAME } from '@store/stores'
	import { ACTIVE_MULTI_MENU } from '@store/multimenu'
	import { PLAYER } from '@store/player'
	import { LOCALE } from '@store/locales'

	$RESOURCE_NAME = 'ok1ez-mdt'

	onMount(() => {
		ACTIVE_PAGE.set({ value: "dashboard", component: Dashboard });
		ACTIVE_MULTI_MENU.set({ icon: "fas fa-user-group", value: "officers", component: ActiveOfficers })
	})
</script>


<VisibilityProvider>
	{#if $LOCALE && $PLAYER}
		<Main />
	{/if}
</VisibilityProvider>

<AlwaysListener />
{#if $BROWSER_MODE}
	<DebugBrowser />
	<div class="absolute w-screen h-screen top-0 left-0 dev-image" />
{/if}

<style>
	.dev-image {
		background-image: url('https://cdn.discordapp.com/attachments/1068663854143389788/1074878298498281554/HUD_-_Target_Menu.png');
		background-size: cover;
		background-repeat: no-repeat;
		background-position: center;

	}
</style>