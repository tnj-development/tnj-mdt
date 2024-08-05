import { writable } from 'svelte/store';

export const currentDate = writable(new Date());

setInterval(() => {
    currentDate.set(
        new Date()
    );
}, 1000);