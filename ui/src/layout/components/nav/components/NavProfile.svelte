<script>
    import { PLAYER } from "@store/player";
</script>

<div class="mt-auto w-full py-[1vh] border-t-[0.1vh] border-gray_primary flex flex-col justify-center pl-[2vh]">
    <h1 class="font-medium text-[1.5vh] text-gray-400">
        {$PLAYER.charinfo.firstname} {$PLAYER.charinfo.lastname}
    </h1>
    <h1 class="font-medium text-[1.5vh] text-gray-500">
        {$PLAYER.job.grade.name}
    </h1>
    <!-- <h1 class="font-medium text-[1.5vh] text-gray-500">
        {$PLAYER.job.type}
    </h1> -->
</div>