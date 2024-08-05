<script>
	import Clock from "./Clock.svelte"
	import Notify from "./Notify.svelte"
	import Quote from "./Quote.svelte"
</script>

<div class="w-full h-[10vh] bg-dark_secondary flex items-center justify-center rounded-tr-[0.5vh] border-b-[0.1vh] border-gray_primary">
    <Quote />
    <Notify />
    <Clock />
</div>