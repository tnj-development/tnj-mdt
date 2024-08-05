<script lang="ts">
    import { SELECTED_PROFILE } from "@store/profiles";
    import { LOCALE } from "@store/locales"
</script>

<div class="w-full flex flex-col px-[1.5vh] rounded-[0.5vh] border-[0.1vh] border-gray_primary bg-dark_tertiary text-gray-400">
    <div class="w-full h-[5vh] flex justify-between items-center">
        <div class="flex items-center">
            <i class="fas fa-house"></i>
            <h1 class="px-[1vh]">
                {$LOCALE.ui.profiles.properties}
            </h1>
        </div>
    </div>

    {#if $SELECTED_PROFILE?.properties.length > 0}
        <div class="w-full flex flex-wrap gap-[0.5vh] pb-[1.5vh] text-[1.3vh]">
            {#each $SELECTED_PROFILE.properties as property}
                {#if Array.isArray(property)}
                    {#each property as property}
                        <div 
                            class="px-[1vh] py-[0.2vh] rounded-[0.5vh] bg-dark_quaternary"
                        >
                            {property.label}
                        </div>
                    {/each}
                {:else}
                    <div 
                        class="px-[1vh] py-[0.2vh] rounded-[0.5vh] bg-dark_quaternary"
                    >
                        {property.label}
                    </div>
                {/if}
            {/each}
        </div>
    {/if}
</div>