<script>
    import { BROWSER_MODE } from "@store/stores";
    import { onMount } from "svelte";
	import Loader from "@components/Loader.svelte"
	import { MESSAGES } from "@store/messages"
	import { SendNUI } from "@utils/SendNUI"
	import { PLAYER } from "@store/player"
	import { timeAgo } from "@utils/timeAgo"
    import { LOCALE } from "@store/locales";

    let loading = false;
    let new_message = ""
    
	onMount(async () => {
		loading = true;
        GetMessages();
        scrollToBottom();
		loading = false;
	});

    function SendMessage() {
        if (new_message.length > 0) {
            SendNUI("newMesssage", {
                message: new_message,
                player: $PLAYER,
            })
            new_message = "";
        }
        setTimeout(() => {
            scrollToBottom();
        }, 100);
    }

    async function GetMessages() {
        let messages = await SendNUI("getMessages");
        $MESSAGES = messages;
    }

    function scrollToBottom() {
        let chatList = document.getElementById("chatList");
        chatList.scroll({
            top: chatList.scrollHeight,
            behavior: 'auto'
        });
    }


</script>

<div class="h-full max-h-[90vh] min-w-[35vh] max-w-[35vh] p-[1vh] bg-dark_secondary rounded-[0.5vh] border-[0.1vh] border-gray_primary">
    <div class="h-[5vh] flex justify-between items-center border-b-[0.1vh] border-gray_primary text-gray-400">
        <div class="px-[1vh] flex items-center gap-[1vh] font-medium">
            <i class="fas fa-comments"></i>
            <h1>
                {$LOCALE.ui.chat.title}
            </h1>
        </div>
        <!-- <button 
            class="w-[3vh] h-[3vh] rounded-[0.5vh] hover:bg-dark_tertiary"
            on:click={GetMessages}
        >
            <i class="fas fa-rotate"></i>
        </button> -->
    </div>

    <div class="w-full h-[62.8vh] flex flex-col gap-[0.4vh] my-[1vh] pr-[0.3vh] py-[0.8vh] overflow-auto" id="chatList">
        {#if $MESSAGES.length > 0}
            {#each $MESSAGES as item}
                <div class="w-full flex flex-col text-[1.3vh] text-gray-400 {$PLAYER.citizenid === item.player.citizenid ? "items-end" : "items-start"}">
                    <p>{timeAgo(item.time)} { item.player.citizenid === $PLAYER.citizenid ? "" : " - " + item.player.charinfo.firstname + " " + item.player.charinfo.lastname }</p>
                    <div class="w-fit max-w-[98%] p-[0.8vh] break-words text-start rounded-[0.5vh] {$PLAYER.citizenid == item.player.citizenid ? "bg-dark_quinary" : "bg-dark_quaternary"}">
                        <p>{item.message}</p>
                    </div>
                </div>
            {/each}
        {:else}
            <div class="w-full h-full flex flex-col items-center gap-[0.5vh] py-[4vh] text-gray-400 font-medium opacity-50">
                <i class="fas fa-triangle-exclamation text-[3vh]"></i>
                <h1>
                    No Recent Messages.
                </h1>
            </div>
        {/if}
    </div>

    <div class="w-full h-[5vh]">
        <div class="w-full h-full px-[1vh] flex items-center rounded-[0.5vh] border-[0.1vh] border-gray_primary text-[1.5vh] text-gray-500 font-medium">
            <input 
                type="text" 
                class="w-full h-full bg-transparent"
                placeholder={$LOCALE.ui.chat.placeholder}
                bind:value={new_message}
                on:keyup={(e) => {
                    if (e.key == "Enter") {
                        SendMessage()
                    }
                }}
            />
            <button
                on:click={SendMessage}
            >
                <i class="fas fa-share"></i>
            </button>
        </div>
    </div>
</div>

<style>
    ::placeholder {
        color: rgb(107, 114, 128);
    }
</style>