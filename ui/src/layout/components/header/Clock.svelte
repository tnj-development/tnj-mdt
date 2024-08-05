<script lang="ts">
	import { hoverState } from "@store/stores"
    import { currentDate } from "@utils/clock";

    function handleMouseOver() {
        hoverState.set(true);
    }

    function handleMouseOut() {
        hoverState.set(false);
    }

</script>

<div 
    class="h-full px-[2vh] pr-[4vh] rounded-tr-[0.5vh] border-l-[0.1vh] border-gray_primary flex flex-col justify-center font-medium text-[1.8vh] text-gray-400"
    role="tooltip"
    on:mouseover={handleMouseOver}
    on:mouseout={handleMouseOut}
    on:focus={handleMouseOver}
    on:blur={handleMouseOut}
>
    <h1>
        {$currentDate.toLocaleTimeString("nb-NO")}
    </h1>
    <h1>
        {$currentDate.toLocaleDateString("nb-NO")}
    </h1>
</div>

