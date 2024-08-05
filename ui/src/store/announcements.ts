import { writable } from "svelte/store";

export const ANNOUNCEMENTS = writable<ANNOUNCEMENTS_DATA[]>([]);

interface ANNOUNCEMENTS_DATA {
    id: number;
    title: string;
    desc: string;
    time: string;
    author: string;
    jobtype: string;
}