<script lang="ts">
	import { ACTIVE_PAGE, hoverState } from '@store/stores'

	import Header from './components/header/Header.svelte'
	import Navbar from './components/nav/Nav.svelte'
</script>

<div 
	class="w-[165vh] h-[90vh] flex bg-dark_primary rounded-[0.5vh] {$hoverState ? " opacity-75" : ""}" 
>
	<Navbar />
	<div 
		class="w-[135vh] h-full flex flex-col"
	>
		<Header />
		<svelte:component this={$ACTIVE_PAGE.component} />
	</div>
</div>
