import { writable } from "svelte/store";

export const LOGS = writable<LOGS_DATA[]>([]);

interface LOGS_DATA {
    id: number;
    text: string;
    category: string;
    time: string;
    jobtype: string;
}