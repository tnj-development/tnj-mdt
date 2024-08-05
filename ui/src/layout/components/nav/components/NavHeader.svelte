<script>
    import { PLAYER } from "@store/player";
    import { LOCALE } from "@store/locales";
</script>

<div class="w-full min-h-[10vh] border-b-[0.1vh] border-gray_primary flex flex-col justify-center pl-[2vh]">
    <h1 class="uppercase font-semibold text-[2.2vh]">
        {$PLAYER.job.label}
    </h1>
    <h1 class="uppercase font-medium text-[1.6vh] text-gray-400">
        {$LOCALE.ui.mdt}
    </h1>
</div>