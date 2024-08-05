import { writable } from "svelte/store";

export const MESSAGES = writable<MESSAGES_DATA[]>([]);

interface MESSAGES_DATA {
    message: string;
    player: any;
    time: number;
}