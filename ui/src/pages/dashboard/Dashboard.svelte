<script>
	import MultiMenu from "@components/multiMenu/MultiMenu.svelte"
	import AnnouncementList from "./components/announcements/List.svelte"
	import ChatList from "./components/chat/ChatList.svelte"
</script>

<div class="w-full h-[80vh] p-[1.5vh] gap-[1.5vh] flex">
    <ChatList />
    <AnnouncementList />
    <MultiMenu  />
</div>