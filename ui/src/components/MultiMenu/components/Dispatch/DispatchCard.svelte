<script lang="ts">
    import { slide } from "svelte/transition"
	import { timeAgo } from "@utils/timeAgo"
    import { LOCALE } from "@store/locales"

    export let id: number;
    export let units: any[];
    export let time: number;
    export let code: string;
    export let codeName: string;
    export let message: string;
    export let coords: string;
    export let gender: string;
    export let jobs: string[];
    export let street: string;
    export let responses: any;
    export let automaticGunFire: boolean;
    export let color: string;
    export let plate: string;
    export let heading: string;
    export let model: string;


    function SetWaypoint() {

    }

    function Attach() {

    }

    function Detach() {

    }

</script>

<button 
    class="w-full flex flex-col rounded-[0.5vh] border-[0.1vh] border-gray_primary px-[1vh] py-[vh] hover:bg-dark_tertiary"
>
    <div class="w-full flex gap-[0.5vh] border-b-[0.1vh] py-[1vh] text-[1.7vh] font-me border-gray_primary">
        <div class="px-[1vh] rounded-full bg-opacity-50 bg-accent_green">
            #{id}
        </div>
        <div class="px-[1vh] rounded-full bg-opacity-50 bg-accent_cyan">
            {code}
        </div>
        <h1 class=" font-medium pl-[0.5vh]">{message}</h1>
    </div>
    <div class="text-gray-400 text-[1.5vh] flex flex-col gap-[0.5vh] py-[0.5vh]">
        <div class="flex items-center gap-[1.2vh]">
            <i class="fas fa-clock w-[1.5vh]"></i>
            <p>{timeAgo(time)}</p>
        </div>
        <div class="flex items-center gap-[1.2vh] {street ? "" : "hidden"}">
            <i class="fas fa-map w-[1.5vh]"></i>
            <p>{street}</p>
        </div>
        <div class="flex items-center gap-[1.2vh] {gender ? "" : "hidden"}">
            <i class="fas fa-person w-[1.5vh]"></i>
            <p>{gender}</p>
        </div>
        <div class="flex items-center gap-[1.2vh] {units ? "" : "hidden"}">
            <i class="fas fa-user w-[1.5vh]"></i>
            <p>{units.length} UNITS</p>
        </div>
        <div class="flex items-center gap-[1.2vh] {model ? "" : "hidden"}">
            <i class="fas fa-car w-[1.5vh]"></i>
            <p>{model}</p>
        </div>
        <div class="flex items-center gap-[1.2vh] {plate ? "" : "hidden"}">
            <i class="fas fa-rectangle-list w-[1.5vh]"></i>
            <p>{plate}</p>
        </div>
        <div class="flex items-center gap-[1.2vh] {color ? "" : "hidden"}">
            <i class="fas fa-droplet w-[1.5vh]"></i>
            <p>{color}</p>
        </div>
        <div class="flex items-center gap-[1.2vh] {heading ? "" : "hidden"}">
            <i class="fas fa-compass w-[1.5vh]"></i>
            <p>{heading}</p>
        </div>
    </div>
</button>