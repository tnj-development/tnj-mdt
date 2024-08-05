<script>
        const commands = [
        { name: 'bold', icon: 'fas fa-bold' },
        { name: 'italic', icon: 'fas fa-italic' },
        { name: 'underline', icon: 'fas fa-underline' },
        { name: 'strikeThrough', icon: 'fas fa-text-slash' },
        { name: 'justifyLeft', icon: 'fas fa-align-left' },
        { name: 'justifyCenter', icon: 'fas fa-align-center' },
        { name: 'justifyRight', icon: 'fas fa-align-right' },
        { name: 'insertHorizontalRule', icon: 'fas fa-minus fa-md' },
        { name: 'undo', icon: 'fas fa-rotate-left' },
        { name: 'redo', icon: 'fas fa-rotate-right' },
    ];

    function executeCommand(command) {
        document.execCommand(command, false, null);
    }
</script>

<div class="w-full h-[4vh] flex items-center border-b-[0.1vh] border-gray_primary">
    {#each commands as { name, icon }}
        <button class="w-full h-full hover:bg-dark_quaternary" on:click={() => executeCommand(name)}>
            <i class={icon}></i>
        </button>
    {/each}
</div>