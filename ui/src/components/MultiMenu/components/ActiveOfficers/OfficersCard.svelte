<script lang="ts">
    import { LOCALE } from "@store/locales";

    export let id: string;
    export let name: string;
    export let job: string;
    export let grade: string;
    export let onduty: boolean;
    export let callsign: string;

    function ToggleDuty() {
        console.log("ToggleOfficerDuty");
    }
  
    function SetCallsign() {
        console.log("SetCallsign");
    }
  
    function SetRadio() {
        console.log("SetRadio");
    }
  
    function SetWaypoint() {
        console.log("SetWaypoint");
    }

</script>

<button 
    class="w-full flex flex-col justify-center pl-[1vh] py-[0.5vh] rounded-[0.5vh] border-[0.1vh] border-gray_primary font-medium text-[1.5vh] hover:bg-dark_tertiary {onduty ? "" : "opacity-50 bg-dark_primary"}"
>
    <h1 class="text-gray-400 text-[1.6vh]">
        {name} - ({callsign})
    </h1>
    <h1 class="text-gray-500">
        {grade}
    </h1>
</button>
